/*
   CS/ECE 552 Spring '22
  
   Filename        : execute.v
   Description     : This is the overall module for the execute stage of the processor.
*/
`default_nettype none
module execute (instruction, clk, rst, PCplus2, SetDataZero, SLData8, ALUSrcB,
				ReverseOp, CompareOp, RegData1, RegData2, sext_imm, execute_rst, err);

	parameter N = 16;
   // Inputs and outputs //////////////////////////////////////////////////////////////
	// inputs
	input wire [N-1:0] instruction;
	input wire clk, rst;
	input wire [N-1:0] PCplus2;
	
	// control signal inputs
	input wire SetDataZero;
	input wire SLData8;
	input wire ALUSrcB;
	input wire ReverseOp;
	input wire CompareOp;
	
	// data inputs
	input wire [N-1:0] RegData1;
	input wire [N-1:0] RegData2;
	input wire [N-1:0] sext_imm;
	
	// data outputs
	output wire [N-1:0] execute_rst;
	output wire err;
	////////////////////////////////////////////////////////////////////////////////////
	
	// Declare internal nets ////////////////////////////////////////////////////////////
	
	wire [N-1:0] RegData1Shifted;
	wire [N-1:0] ALUoperandB;
	wire [N-1:0] ALUoperandA;
	wire [N-1:0] reverseRst;
	wire [N-1:0] ex_rst_int;
	wire [N-1:0] CompareModOut;
	wire [N-1:0] ALUoutput;
	wire [N-1:0] Reg1Data_i;
	
	wire ALUoutIsZero, ALUofl;
	
	////////////////////////////////////////////////////////////////////////////////////
	
	
	// ALU Logic //////////////////////////////////////////////////////////////////////////
	// shifter and mux to choose if we want reg 1 result shifted.
	assign RegData1Shifted = RegData1 << 8;
	assign Reg1Data_i = SLData8 ? RegData1Shifted : RegData1;
	
	// mux to set alu input A to zero
	assign ALUoperandA = SetDataZero ? {N{1'b0}} : Reg1Data_i;
	
	// mux to choose immediate value or reg 2 data for ALU input B
	assign ALUoperandB = ALUSrcB ? sext_imm : RegData2;
	
	// instantiate the ALU
	alu_mod iALU_mod(	.A(ALUoperandA), .B(ALUoperandB), .instruction(instruction), 
						.Ofl(ALUofl), .Zero(ALUoutIsZero), .result(ALUoutput));
						
	// instantiate reverser
	reverse16b iReverser (.in(ALUoperandA), .out(reverseRst));
	
	// mux to choose if we want the reversed result
	assign ex_rst_int = ReverseOp ? reverseRst : ALUoutput;
	
	// instantiate compare module
	compare_mod i_compare_mod(	.aluResult(ALUoutput), .Ofl(ALUofl), .Zero(ALUoutIsZero), 
								.opcode(instruction[15:11]), .Out(CompareModOut));
								
	// mux to select if we want to use the compare mod result
	assign execute_rst = CompareOp ? CompareModOut : ex_rst_int;
	
	///////////////////////////////////////////////////////////////////////////////////////
	
   
endmodule
`default_nettype wire
