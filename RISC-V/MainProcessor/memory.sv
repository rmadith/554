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

	assign memAddr = execute_result_EXMEM_MEMWB;

	always @(*) begin 
		memDataOut = 0;
		inter_memWrData = 0;
		case(memType_EXMEM_out)
			3'b000: begin 
				inter_memWrData = {{24{regData2_EXMEM_out[7]}},regData2_EXMEM_out[7:0]}; // SB
				memDataOut = {{24{inter_memData[7]}},inter_memData[7:0]}; //LB
				end
			3'b001: begin 
				inter_memWrData = {{16{regData2_EXMEM_out[15]}},regData2_EXMEM_out[15:0]}; //SH
				memDataOut = {{16{inter_memData[15]}},inter_memData[15:0]}; //LH
				end
			3'b010: begin 
				inter_memWrData = regData2_EXMEM_out; //SW
				memDataOut = inter_memData; //LW
				end
			3'b100: begin 
				memDataOut = {24'h0,inter_memData[7:0]}; //LBU
				end
			3'b101: begin 
				memDataOut = {16'h0,inter_memData[15:0]}; //LHU
				end


		endcase

	end

	///////////////////////////////////////////////
	// Model read, data is ___________________  //
	/////////////////////////////////////////////
	//always @(*) // not sure about the clock edge ??
	//if (memRead_EXMEM_MEMWB && ~memWrite_EXMEM_out)
	//	inter_memData <= data_mem[memAddr[15:0]];
	assign inter_memData = (memRead_EXMEM_MEMWB && ~memWrite_EXMEM_out) ? data_mem[memAddr[15:0]] : 32'hz;	
	////////////////////////////////////////////////
	// Model write, data is written on _________ //
	//////////////////////////////////////////////
	always @(negedge clk) // not sure about the clock edge ??
	if (memWrite_EXMEM_out && ~memRead_EXMEM_MEMWB)
		data_mem[memAddr[15:0]] <= inter_memWrData;

	assign memReadRst_MEMWB_in = memDataOut;

endmodule


`default_nettype wire
