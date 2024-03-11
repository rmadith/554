/* $Author: karu $ */
/* $LastChangedDate: 2009-04-24 09:28:13 -0500 (Fri, 24 Apr 2009) $ */
/* $Rev: 77 $ */

// FOR SA cache.

`default_nettype none
module mem_system(/*AUTOARG*/
	// Outputs
	DataOut, Done, Stall, CacheHit, err,
	// Inputs
	Addr, DataIn, Rd, Wr, createdump, clk, rst
	);

	input wire [15:0] Addr;
	input wire [15:0] DataIn;
	input wire        Rd;
	input wire        Wr;
	input wire        createdump;
	input wire        clk;
	input wire        rst;

	output wire [15:0] DataOut;
	output wire        Done;
	output wire        Stall;
	output wire        CacheHit;
	output wire        err;

	// Declare internal nets ////////////////////////////////////////
	
	// FSM outputs //////////////////////
	// outputs to cache //
	wire cache1_enable;
	wire cache0_enable;
	wire [7:0] cache_index;
	wire [2:0] cache_offset;
	wire cache_comp;
	wire cache_write;
	wire [4:0] cache_tag;
	wire [15:0] cache_data_in;
	wire cache_valid_in;

	// outputs to top level //
	wire [15:0] out_DataOut;
	wire out_done;
	wire out_stall;
	wire out_cacheHit;
	wire fsm_err;

	// outputs
	wire [15:0] FBM_Addr;
	wire [15:0] FBM_DataIn;
	wire FBM_wr;
	wire FBM_rd; 
	
	// outputs to LRU FFs
	wire LRU_data_in;
	wire [7:0] LRU_index;
	wire LRU_write;

	// outputs to extra state FFs
	wire ff_next_miss;
	wire ff_next_victimway;
	wire ff_next_cache;
	
	///////////////////////////////////////
	
	// cache outputs //////////////////////
	wire from_c0_hit;
	wire from_c0_dirty;
	wire [4:0] from_c0_tag_out;
	wire [15:0] from_c0_data_out;
	wire from_c0_valid;
	wire cache0_err;
	
	wire from_c1_hit;
	wire from_c1_dirty;
	wire [4:0] from_c1_tag_out;
	wire [15:0] from_c1_data_out;
	wire from_c1_valid;
	wire cache1_err;

	///////////////////////////////////////

	// four_bank_mem outputs //////////////
	wire [15:0] from_FBM_DataOut;
	wire from_FBM_stall;
	wire [3:0] from_FBM_Busy;
	wire fbm_err;
	
	///////////////////////////////////////
	
	// LRU bit outputs
	wire LRU_data_out;
	
	// ff curr_miss output.
	wire ff_curr_miss;
	wire ff_curr_victimway;
	wire ff_curr_cache;

	// Instantiate Cache /////////////////////////////////////////
	/* data_mem = 1, inst_mem = 0 *
	* needed for cache parameter */
	parameter memtype = 0;
	cache #(0 + memtype) c0(// Outputs
						  .tag_out              (from_c0_tag_out),
						  .data_out             (from_c0_data_out),
						  .hit                  (from_c0_hit),
						  .dirty                (from_c0_dirty),
						  .valid                (from_c0_valid),
						  .err                  (cache0_err),
						  // Inputs
						  .enable               (cache0_enable),
						  .clk                  (clk),
						  .rst                  (rst),
						  .createdump           (createdump),
						  .tag_in               (cache_tag),
						  .index                (cache_index),
						  .offset               (cache_offset),
						  .data_in              (cache_data_in),
						  .comp                 (cache_comp),
						  .write                (cache_write),
						  .valid_in             (cache_valid_in)
	);
	
	cache #(0 + memtype) c1(// Outputs
						  .tag_out              (from_c1_tag_out),
						  .data_out             (from_c1_data_out),
						  .hit                  (from_c1_hit),
						  .dirty                (from_c1_dirty),
						  .valid                (from_c1_valid),
						  .err                  (cache1_err),
						  // Inputs
						  .enable               (cache1_enable),
						  .clk                  (clk),
						  .rst                  (rst),
						  .createdump           (createdump),
						  .tag_in               (cache_tag),
						  .index                (cache_index),
						  .offset               (cache_offset),
						  .data_in              (cache_data_in),
						  .comp                 (cache_comp),
						  .write                (cache_write),
						  .valid_in             (cache_valid_in)
	);
						  
	///////////////////////////////////////////////////////////////

	// Instantiate FBM ////////////////////////////////////////////
	four_bank_mem mem(// Outputs
					 .data_out          (from_FBM_DataOut),
					 .stall             (from_FBM_stall),
					 .busy              (from_FBM_Busy),
					 .err               (fbm_err),
					 // Inputs
					 .clk               (clk),
					 .rst               (rst),
					 .createdump        (createdump),
					 .addr              (FBM_Addr),
					 .data_in           (FBM_DataIn),
					 .wr                (FBM_wr),
					 .rd                (FBM_rd));
	///////////////////////////////////////////////////////////////
	
	// Instantiate cache controller state machine.
	mem_system_state_mach FSM(
		// Inputs to state machine //////////////////////////////
		// Cache outputs
		.from_c0_hit(from_c0_hit),
		.from_c0_dirty(from_c0_dirty),
		.from_c0_tag_out(from_c0_tag_out),
		.from_c0_data_out(from_c0_data_out),
		.from_c0_valid(from_c0_valid), 
		
		// Cache outputs
		.from_c1_hit(from_c1_hit),
		.from_c1_dirty(from_c1_dirty),
		.from_c1_tag_out(from_c1_tag_out),
		.from_c1_data_out(from_c1_data_out),
		.from_c1_valid(from_c1_valid), 
		
		// mem_system inputs
		.top_Addr(Addr),
		.top_DataIn(DataIn),
		.top_Rd(Rd),
		.top_Wr(Wr),

		// Four Bank Mem output
		.from_FBM_DataOut(from_FBM_DataOut),
		.from_FBM_stall(from_FBM_stall),
		.from_FBM_Busy(from_FBM_Busy),
		
		// from LRU bit storage 
		.LRU_data_out(LRU_data_out),

		// from extra state FFs
		.ff_curr_miss(ff_curr_miss),
		.ff_curr_victimway(ff_curr_victimway),
		.ff_curr_cache(ff_curr_cache),

		// synch signals
		.clk(clk),
		.rst(rst),

		/////////////////////////////////////////////////////////

		// Outputs from state machine ///////////////////////////
		// outputs to cache //
		.cache1_enable(cache1_enable),
		.cache0_enable(cache0_enable),
		
		.cache_index(cache_index),
		.cache_offset(cache_offset),
		.cache_comp(cache_comp),
		.cache_write(cache_write),
		.cache_tag(cache_tag),
		.cache_data_in(cache_data_in),
		.cache_valid_in(cache_valid_in),

		// outputs to top level //
		.out_DataOut(out_DataOut),
		.out_done(out_done),
		.out_stall(out_stall),
		.out_cacheHit(out_cacheHit),
		.err(fsm_err),

		// outputs to FBM //
		.FBM_Addr(FBM_Addr),
		.FBM_DataIn(FBM_DataIn),
		.FBM_wr(FBM_wr),
		.FBM_rd(FBM_rd), 
		
		// outputs to LRU FFs
		.LRU_data_in(LRU_data_in),
		.LRU_index(LRU_index),
		.LRU_write(LRU_write),

		// outputs to extra state FFs
		.ff_next_miss(ff_next_miss),
		.ff_next_victimway(ff_next_victimway),
		.ff_next_cache(ff_next_cache)
	);
	
	// Instantiate LRU bit storage
	LRU LRU_bits(
		// inputs
		.clk(clk), .rst(rst), .dataIn(LRU_data_in), .index(LRU_index), .write(LRU_write), 
		
		// output
		.dataOut(LRU_data_out)
	);
	
	// instantiate MissFF
	dff MissFF (.q(ff_curr_miss), .d(ff_next_miss), .clk(clk), .rst(rst));
	
	// instantiate victimwayFF
	dff victimwayFF (.q(ff_curr_victimway), .d(ff_next_victimway), .clk(clk), .rst(rst));
	
	// instantiate cacheFF
	dff cacheFF (.q(ff_curr_cache), .d(ff_next_cache), .clk(clk), .rst(rst));
	
	assign DataOut = out_DataOut;
	assign Done = out_done;
	assign Stall = out_stall;
	assign CacheHit = out_cacheHit;
	assign err = cache0_err | cache1_err; // should change to or of all err signals.
   
   
endmodule // mem_system
`default_nettype wire
// DUMMY LINE FOR REV CONTROL :9:
