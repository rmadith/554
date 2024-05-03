`default_nettype none

import common_def::*;

module IDEXpipelineReg(
    ///// INPUTS  /////
    input wire clk,
    input wire rst_n,

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
    input wire ECALL_IFID_IDEX,


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
    output logic [31:0] PC_IDEX_EXMEM,
    output logic ECALL_IDEX_EXMEM

);

    always_ff @( posedge clk, negedge rst_n) begin 
        if (!rst_n) begin       // on reset clear the register
            regData1_IDEX_out <=  '0 ;
            regData2_IDEX_out <=  '0 ;
            sext_imm_IDEX_out <=  '0 ;
            immSel_IDEX_out <=  '0 ;
            PC_as_operand_IDEX_out <=  '0 ;
            setDataZero_IDEX_out <=  '0 ;
            ALU_op_IDEX_out <=  '0 ;
            memRead_IDEX_EXMEM <=  '0 ;
            memType_IDEX_EXMEM <=  '0 ;
            memWrite_IDEX_EXMEM <=  '0 ;
            addConstant4_IDEX_out <=  '0 ;
            regWriteEnable_IDEX_EXMEM <=  '0 ;
            instruction_IDEX_EXMEM <=  NOP_INSTR_HEX ;
            PC_IDEX_EXMEM <=  '0 ;
            ECALL_IDEX_EXMEM <= '0;
        end else begin  // pipeline the required signals from decode to execute
            regData1_IDEX_out <=  regData1_IDEX_in ;
            regData2_IDEX_out <=  regData2_IDEX_in ;
            sext_imm_IDEX_out <=  sext_imm_IDEX_in ;
            immSel_IDEX_out <=  immSel_IDEX_in ;
            PC_as_operand_IDEX_out <=  PC_as_operand_IDEX_in ;
            setDataZero_IDEX_out <=  setDataZero_IDEX_in ;
            ALU_op_IDEX_out <=  ALU_op_IDEX_in ;
            memRead_IDEX_EXMEM <=  memRead_IDEX_in ;
            memType_IDEX_EXMEM <=  memType_IDEX_in ;
            memWrite_IDEX_EXMEM <=  memWrite_IDEX_in ;
            addConstant4_IDEX_out <=  addConstant4_IDEX_in ;
            regWriteEnable_IDEX_EXMEM <=  regWriteEnable_IDEX_in ;
            instruction_IDEX_EXMEM <=  instruction_IFID_IDEX ;
            PC_IDEX_EXMEM <=  PC_IFID_IDEX ;
            ECALL_IDEX_EXMEM <= ECALL_IFID_IDEX;

        end
    end

endmodule

`default_nettype wire
