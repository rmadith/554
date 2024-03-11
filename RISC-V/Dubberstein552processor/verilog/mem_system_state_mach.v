/**
* FOR SA Cache ONLY
* Eric Dubberstein, Joash Shankar.
*/


`default_nettype none
module mem_system_state_mach(
	// Inputs to state machine //////////////////////////////
	// Cache outputs c0
	input wire from_c0_hit,
	input wire from_c0_dirty,
	input wire [4:0] from_c0_tag_out,
	input wire [15:0] from_c0_data_out,
	input wire from_c0_valid, 

	// Cache outputs c1
	input wire from_c1_hit,
	input wire from_c1_dirty,
	input wire [4:0] from_c1_tag_out,
	input wire [15:0] from_c1_data_out,
	input wire from_c1_valid, 
	
	// mem_system inputs
	input wire [15:0] top_Addr,
	input wire [15:0] top_DataIn,
	input wire top_Rd,
	input wire top_Wr,

	// Four Bank Mem output
	input wire [15:0] from_FBM_DataOut,
	input wire from_FBM_stall,
	input wire [3:0] from_FBM_Busy,

	// from extra state FFs
	input wire ff_curr_miss,
	input wire ff_curr_victimway,
	input wire ff_curr_cache,
	
	// from LRU bit storage 
	input wire LRU_data_out,

	// synch signals
	input wire clk,
	input wire rst,

	/////////////////////////////////////////////////////////
	
	// Outputs from state machine ///////////////////////////
	// outputs to cache //
	output reg cache1_enable,
	output reg cache0_enable,
	
	output reg [7:0] cache_index,
	output reg [2:0] cache_offset,
	output reg cache_comp,
	output reg cache_write,
	output reg [4:0] cache_tag,
	output reg [15:0] cache_data_in,
	output reg cache_valid_in,
	
	// outputs to top level //
	output reg [15:0] out_DataOut,
	output reg out_done,
	output reg out_stall,
	output reg out_cacheHit,
	output reg err,

	// outputs to FBM //
	output reg [15:0] FBM_Addr,
	output reg [15:0] FBM_DataIn,
	output reg FBM_wr,
	output reg FBM_rd, 
	
	// outputs to LRU FFs
	output reg LRU_data_in,
	output reg [7:0] LRU_index,
	output reg LRU_write,
	
	// outputs to extra state FFs
	output reg ff_next_miss,
	output reg ff_next_victimway,
	output reg ff_next_cache
);
	
	// Localparams for state.
	localparam IDLE_COMPARE = 4'h0;
	localparam ERROR = 4'h1;
	localparam S_READ_0 = 4'h4;
	localparam S_READ_1 = 4'h5;
	localparam S_READ_2_R_0 = 4'h6;
	localparam S_READ_3_R_1 = 4'h7;
	localparam R2 = 4'h8;
	localparam R3 = 4'h9;
	localparam WRITE_BACK_0 = 4'hA;
	localparam WRITE_BACK_1 = 4'hB;
	localparam WRITE_BACK_2 = 4'hC;
	localparam WRITE_BACK_3 = 4'hD;
	
	localparam COMPLETE_WR = 4'h2;

	
	// Internal access FFs //
	// Stores the previous accesses that we are still working on for critical word first. 
	wire [15:0] top_Addr_flopped;
	wire [15:0] top_DataIn_flopped;
	wire topRd_flopped;
	wire topWr_flopped;
	
	wire actually_done_out;
	reg actually_done_in;
	
	reg store_req_details;
	
	// Instantiate access FFs //
	en_dff top_Addr_dff [15:0] (.q(top_Addr_flopped), .d(top_Addr), .clk(clk), .rst(rst), .en(store_req_details), .err());
	en_dff top_DataIn_dff [15:0] (.q(top_DataIn_flopped), .d(top_DataIn), .clk(clk), .rst(rst), .en(store_req_details), .err());
	en_dff top_RD_dff (.q(topRd_flopped), .d(top_Rd), .clk(clk), .rst(rst), .en(store_req_details), .err());
	en_dff top_WR_dff (.q(topWr_flopped), .d(top_Wr), .clk(clk), .rst(rst), .en(store_req_details), .err());
	dff actually_done_dff (.q(actually_done_out), .d(actually_done_in), .clk(clk), .rst(rst));
	
	
	// Instantiate CLA to add offset to memory addr
	wire [3:0] resultingOffset_1;
	reg [2:0] currOffset_1; 
	
	wire [3:0] resultingOffset_2;
	reg [2:0] currOffset_2;
	
	cla4b #(4) cla0 (.sum(resultingOffset_1), .cOut(), .inA({1'b0,top_Addr_flopped[2:0]}), .inB({1'b0, currOffset_1}), .cIn(1'b0), .G(), .P());
	cla4b #(4) cla1 (.sum(resultingOffset_2), .cOut(), .inA({1'b0,top_Addr_flopped[2:0]}), .inB({1'b0, currOffset_2}), .cIn(1'b0), .G(), .P());
	
	// declare internal nets.
	wire [3:0] curr_state;
	reg [3:0] next_state;
	
	dff state_dff [3:0] (.q(curr_state), .d(next_state), .clk(clk), .rst(rst));

	always@(*) begin

		// DEFAULT state //////////////////////////////////
		// outputs to cache //
		cache1_enable = ff_curr_cache;
		cache0_enable = ~ff_curr_cache;
		cache_data_in = 16'b0;
		cache_comp = 1'b0;
		cache_write = 1'b0;
		cache_valid_in = 1'b1;
		cache_tag = top_Addr_flopped[15:11];
		cache_index = top_Addr_flopped[10:3];
		cache_offset = 3'b0;
		
		// outputs to FBM //
		FBM_DataIn = 16'b0;
		FBM_wr = 1'b0;
		FBM_rd = 1'b0;
		FBM_Addr = 16'b0;
		
		// outputs to top level //
		out_done = 1'b0;
		out_stall = 1'b1;
		out_cacheHit = 1'b0;
		out_DataOut = 16'hFFFF;
		
		// outputs to LRU bits //
		LRU_data_in = 1'b0;
		LRU_index = top_Addr[10:3];
		LRU_write = 1'b0;
		
		// outputs to extra state FFs //
		ff_next_victimway = ff_curr_victimway;
		ff_next_cache = ff_curr_cache;
		ff_next_miss = ff_curr_miss;
		
		// error signal.
		err = 1'b0;
		
		// Next state.
		next_state = IDLE_COMPARE;
		
		// Extra signals for CWF //
		store_req_details = 1'b0;
		actually_done_in = 1'b0;
		
		
		
		///////////////////////////////////////////////////////
		
		case(curr_state)
			ERROR: begin
				cache0_enable = 1'b0;
				cache1_enable = 1'b0;
				out_stall = 1'b0;
				err = 1'b1;
				next_state = ERROR;
			end
			IDLE_COMPARE: begin
				cache0_enable = top_Rd | top_Wr;
				cache1_enable = top_Rd | top_Wr;
				cache_data_in = top_DataIn;
				cache_comp = top_Rd | top_Wr;
				cache_write = top_Wr;
				cache_tag = (top_Rd | top_Wr) ? top_Addr[15:11] : 5'b0;
				cache_index = (top_Rd | top_Wr) ? top_Addr[10:3] : 8'b0;
				cache_offset = (top_Rd | top_Wr) ? top_Addr[2:0] : 3'b0;
				out_done = ((top_Rd) & ( (from_c0_valid & from_c0_hit) | (from_c1_valid & from_c1_hit) ) ) | top_Wr;
				out_stall = (top_Rd | top_Wr);
				out_cacheHit = ((from_c0_valid & from_c0_hit) | (from_c1_valid & from_c1_hit)) & ~ff_curr_miss;
				out_DataOut = (from_c0_valid & from_c0_hit) ? from_c0_data_out[15:0] : ( (from_c1_valid & from_c1_hit) ? from_c1_data_out[15:0] : 16'hFFFF);
				ff_next_victimway = ((~ff_curr_miss & (top_Rd | top_Wr)) ^ ff_curr_victimway);
				ff_next_cache = (~from_c0_valid) ? 1'b0 : ((~from_c1_valid) ? 1'b1 : LRU_data_out);
				ff_next_miss = ~((from_c0_valid & from_c0_hit) | (from_c1_valid & from_c1_hit));
				
				store_req_details = 1'b1;
				
				LRU_data_in = ~ff_next_cache;
				LRU_index = (top_Rd | top_Wr) ? top_Addr[10:3] : 8'b0;
				LRU_write = (top_Rd | top_Wr);
				
				next_state = ((from_c0_valid & from_c0_hit) | (from_c1_valid & from_c1_hit) | (~top_Rd & ~top_Wr)) ? IDLE_COMPARE :
							(  (ff_next_cache ? (from_c1_dirty & from_c1_valid) : (from_c0_dirty & from_c0_valid) ) // is writeback required?
							? WRITE_BACK_0: S_READ_0);
				
			end
			S_READ_0: begin
				currOffset_1 = 3'b000;
				
				
				
				FBM_rd = 1'b1;
				FBM_Addr = {top_Addr_flopped[15:3], resultingOffset_1[2:0]};
				next_state = from_FBM_stall ? S_READ_0 : S_READ_1;
			end
			S_READ_1: begin
				currOffset_1 = 3'b010;
				
				
				FBM_rd = 1'b1;
				FBM_Addr = {top_Addr_flopped[15:3], resultingOffset_1[2:0]};
				next_state = from_FBM_stall ? S_READ_1 : S_READ_2_R_0;
			end
			S_READ_2_R_0: begin
				currOffset_1 = 3'b100;
				currOffset_2 = 3'b000;
				
				
				out_done = topRd_flopped;
				out_DataOut = from_FBM_DataOut;
				
				
				cache_data_in = from_FBM_DataOut;
				cache_write = 1'b1;
				cache_offset = resultingOffset_2[2:0];
				FBM_rd = 1'b1;
				FBM_Addr = {top_Addr_flopped[15:3], resultingOffset_1[2:0]};
				next_state = from_FBM_stall ? S_READ_2_R_0 : S_READ_3_R_1;
			end
			S_READ_3_R_1: begin
				currOffset_1 = 3'b110;
				currOffset_2 = 3'b010;
				
				
				
				cache_data_in = from_FBM_DataOut;
				cache_write = 1'b1;
				cache_offset = resultingOffset_2[2:0];
				FBM_rd = 1'b1;
				FBM_Addr = {top_Addr_flopped[15:3], resultingOffset_1[2:0]};
				next_state = from_FBM_stall ? S_READ_3_R_1 : R2;
			end
			R2: begin
				currOffset_2 = 3'b100;
				
				
				cache_data_in = from_FBM_DataOut;
				cache_write = 1'b1;
				cache_offset = resultingOffset_2[2:0];
				next_state = R3;
			end
			R3: begin
				currOffset_2 = 3'b110;
				
				
				cache_data_in = from_FBM_DataOut;
				cache_write = 1'b1;
				cache_offset = resultingOffset_2[2:0];
				next_state = from_FBM_stall ? R3 : ( (topWr_flopped) ?  COMPLETE_WR :  IDLE_COMPARE);
			end
			WRITE_BACK_0: begin
				cache_offset = 3'b000;
				FBM_DataIn = ff_curr_cache ? from_c1_data_out: from_c0_data_out;
				FBM_wr = 1'b1;
				FBM_Addr = {(ff_curr_cache ? from_c1_tag_out[4:0] : from_c0_tag_out[4:0]), top_Addr_flopped[10:3], 3'b000};
				next_state = from_FBM_stall ? WRITE_BACK_0 : WRITE_BACK_1;
			end
			WRITE_BACK_1: begin
				cache_offset = 3'b010;
				FBM_DataIn = ff_curr_cache ? from_c1_data_out: from_c0_data_out;
				FBM_wr = 1'b1;
				FBM_Addr = {(ff_curr_cache ? from_c1_tag_out[4:0] : from_c0_tag_out[4:0]), top_Addr_flopped[10:3], 3'b010};
				next_state = from_FBM_stall ? WRITE_BACK_1 : WRITE_BACK_2;
			end
			WRITE_BACK_2: begin
				cache_offset = 3'b100;
				FBM_DataIn = ff_curr_cache ? from_c1_data_out: from_c0_data_out;
				FBM_wr = 1'b1;
				FBM_Addr = {(ff_curr_cache ? from_c1_tag_out[4:0] : from_c0_tag_out[4:0]), top_Addr_flopped[10:3], 3'b100};
				next_state = from_FBM_stall ? WRITE_BACK_2 : WRITE_BACK_3;
			end
			WRITE_BACK_3: begin
				cache_offset = 3'b110;
				FBM_DataIn = ff_curr_cache ? from_c1_data_out: from_c0_data_out;
				FBM_wr = 1'b1;
				FBM_Addr = {(ff_curr_cache ? from_c1_tag_out[4:0] : from_c0_tag_out[4:0]), top_Addr_flopped[10:3], 3'b110};
				next_state = from_FBM_stall ? WRITE_BACK_3 : S_READ_0;
			end
			COMPLETE_WR: begin
				cache_data_in = top_DataIn_flopped;
				cache_comp = 1'b1;
				cache_write = 1'b1;
				cache_offset = top_Addr_flopped[2:0];
				next_state = IDLE_COMPARE;
			end

			default: begin
			end
		endcase
	end

endmodule
`default_nettype wire
