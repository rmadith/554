`default_nettype none

module execute(
	///// INPUTS  /////
	input wire setDataZero_IDEX_out,
	input wire PC_as_operand_IDEX_out,
	input wire [31:0] regData1_IDEX_out,
	input wire [31:0] regData2_IDEX_out,
	input wire immSel_IDEX_out,
	input wire [31:0] sext_imm_IDEX_out,
	input wire [3:0] ALU_op_IDEX_out,
	input wire [31:0] PC_IDEX_EXMEM,
	input wire memRead_IDEX_EXMEM,
	input wire memWrite_IDEX_EXMEM,
	input wire addConstant4_IDEX_out,


	///// OUTPUTS  /////
	output wire [31:0] execute_result_EXMEM_in
	);

	//////////////////////////////////////////
	/////////////// Variables ///////////////
	////////////////////////////////////////

	logic [31:0] alu_inA, alu_inB;

	////////////////////////////////////////
	///////////////////////////////////////
	//////////////////////////////////////

	assign alu_inA = (setDataZero_IDEX_out) ? 32'h0 : (PC_as_operand_IDEX_out) ? PC_IDEX_EXMEM : regData1_IDEX_out;
	assign alu_inB = (addConstant4_IDEX_out) ? 32'h4 : (immSel_IDEX_out) ? sext_imm_IDEX_out : regData2_IDEX_out;

	ALU iALU(.A(alu_inA),.B(alu_inB),.ALU_op(ALU_op_IDEX_out),.out(execute_result_EXMEM_in));


endmodule

`default_nettype wire
