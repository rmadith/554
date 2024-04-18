`default_nettype none

module IDEXpipelineReg(
    ///// INPUTS  /////
    input wire clk,
    input wire rst_n,
    
    input wire stall_disable,
    input wire flush,

    ///// PIPELINE INPUTS  /////
    input wire [31:0] regData1_IDEX_in,
	input wire [31:0] regData2_IDEX_in,
	input wire [31:0] sext_imm_IDEX_in,

	input wire immSel_IDEX_in,
	input wire PC_as_operand_IDEX_in,
	input wire setDataZero_IDEX_in,
	input wire [3:0] ALU_op_IDEX_in,
	input wire memRead_IDEX_in, 
	input wire [2:0] memType_IDEX_in, 
	input wire memWrite_IDEX_in,
	input wire addConstant4_IDEX_in,
	input wire regWriteEnable_IDEX_in,

    input wire [31:0] instruction_IFID_IDEX,
    input wire [31:0] PC_IFID_IDEX,


    ///// PIPELINE OUTPUTS  /////
    output logic [31:0] regData1_IDEX_out,
	output logic [31:0] regData2_IDEX_out,
	output logic [31:0] sext_imm_IDEX_out,

	output logic immSel_IDEX_out,
	output logic PC_as_operand_IDEX_out,
	output logic setDataZero_IDEX_out,
	output logic [3:0] ALU_op_IDEX_out,
	output logic memRead_IDEX_EXMEM, 
	output logic [2:0] memType_IDEX_EXMEM, 
	output logic memWrite_IDEX_EXMEM,
	output logic addConstant4_IDEX_out,
	output logic regWriteEnable_IDEX_EXMEM,

    output logic [31:0] instruction_IDEX_EXMEM,
    output logic [31:0] PC_IDEX_EXMEM

);
    // Dummy version for now.
    assign  regData1_IDEX_out =  regData1_IDEX_in ;
    assign  regData2_IDEX_out =  regData2_IDEX_in ;
    assign  sext_imm_IDEX_out =  sext_imm_IDEX_in ;
    assign  immSel_IDEX_out =  immSel_IDEX_in ;
    assign  PC_as_operand_IDEX_out =  PC_as_operand_IDEX_in ;
    assign  setDataZero_IDEX_out =  setDataZero_IDEX_in ;
    assign  ALU_op_IDEX_out =  ALU_op_IDEX_in ;
    assign  memRead_IDEX_EXMEM =  memRead_IDEX_in ;
    assign  memType_IDEX_EXMEM =  memType_IDEX_in ;
    assign  memWrite_IDEX_EXMEM =  memWrite_IDEX_in ;
    assign  addConstant4_IDEX_out =  addConstant4_IDEX_in ;
    assign  regWriteEnable_IDEX_EXMEM =  regWriteEnable_IDEX_in ;
    assign  instruction_IDEX_EXMEM =  instruction_IFID_IDEX ;
    assign  PC_IDEX_EXMEM =  PC_IFID_IDEX ;




endmodule

`default_nettype wire
