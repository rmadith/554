`default_nettype none

module memory(
	///// INPUTS  /////
	input wire clk,
    input wire rst_n,
	input wire [31:0] execute_result_EXMEM_MEMWB,
	input wire memWrite_EXMEM_out,
	input wire memRead_EXMEM_MEMWB,
	input wire [31:0] regData2_EXMEM_out,
	input wire [2:0] memType_EXMEM_out,

	///// OUTPUTS  /////
	output logic [31:0] memReadRst_MEMWB_in
	
	);

	reg [31:0]data_mem[0:65535];  // Uh this value should be very less ??
	reg [31:0] inter_memWrData;
	reg [31:0] inter_memData;

	logic [31:0] memDataOut;
	logic [31:0] memAddr;
	logic [31:0] wrt_data;

	assign memAddr = execute_result_EXMEM_MEMWB;

	assign wrt_data = regData2_EXMEM_out;

	// TODO: Check with Eric Hoffman if this is the right way to do our data memory. 
	
	////////////////////////////////////////////////
	// Model write, data is written on negedge clk //
	//////////////////////////////////////////////
	always @(negedge clk) begin
		if (memWrite_EXMEM_out && ~memRead_EXMEM_MEMWB) begin
			if (memType_EXMEM_out == 3'b010)
				data_mem[memAddr] <= wrt_data;
			else if (memType_EXMEM_out == 3'b000)
				data_mem[memAddr] <= {data_mem[memAddr][31:8], wrt_data[7:0]};
			else if (memType_EXMEM_out == 3'b001)
				data_mem[memAddr] <= {data_mem[memAddr][31:16], wrt_data[15:0]};
		end
			
	end
	
	
	///////////////////////////////////////////////
	// Model read, data is negedge  clock  //
	/////////////////////////////////////////////
	always @(negedge clk) begin
		if (memRead_EXMEM_MEMWB && ~memWrite_EXMEM_out)
			inter_memData <= data_mem[memAddr];
	end

	// This always_comb block infers a multiplexor that selects between the different formats for a load word.
	always_comb begin 
		memDataOut = 0;

		case(memType_EXMEM_out)
			3'b000: memDataOut = {{24{inter_memData[7]}},inter_memData[7:0]}; //LB
			3'b001: memDataOut = {{16{inter_memData[15]}},inter_memData[15:0]}; //LH
			3'b010: memDataOut = inter_memData; //LW
			3'b100: memDataOut = {24'h0,inter_memData[7:0]}; //LBU
			3'b101: memDataOut = {16'h0,inter_memData[15:0]}; //LHU
		endcase

	end
	
	assign memReadRst_MEMWB_in = memDataOut;

endmodule


`default_nettype wire
