`default_nettype none

import common_def::*;

module MEMWBpipelineReg(
    ///// INPUTS  /////
    input wire clk,
    input wire rst_n,
    
    input wire stall_disable,
    input wire flush,

    ///// PIPELINE INPUTS  /////
    input wire regWriteEnable_EXMEM_MEMWB,
    input wire [31:0] instruction_EXMEM_MEMWB,
    input wire [31:0] PC_EXMEM_MEMWB,
    input wire [31:0] execute_result_EXMEM_MEMWB,
    input wire memRead_EXMEM_MEMWB,
    input wire [31:0] memReadRst_MEMWB_in,
    input wire ECALL_EXMEM_MEMWB,

    ///// PIPELINE OUTPUTS  /////
    output logic regWriteEnable_MEMWB_out,
    output logic [31:0] instruction_MEMWB_out,
    output logic [31:0] PC_MEMWB_out,
    output logic [31:0] execute_result_MEMWB_out,
    output logic memRead_MEMWB_out,
    output logic [31:0] memReadRst_MEMWB_out,
    output logic ECALL_MEMWB_out

);
    // Dummy version for now.
    // assign regWriteEnable_MEMWB_out =  regWriteEnable_EXMEM_MEMWB;
    // assign instruction_MEMWB_out =  instruction_EXMEM_MEMWB;
    // assign PC_MEMWB_out =  PC_EXMEM_MEMWB;
    // assign execute_result_MEMWB_out =  execute_result_EXMEM_MEMWB;
    // assign memRead_MEMWB_out = memRead_EXMEM_MEMWB ;
    // assign memReadRst_MEMWB_out =  memReadRst_MEMWB_in;

    always_ff @( posedge clk, negedge rst_n) begin 
        if (!rst_n) begin
            regWriteEnable_MEMWB_out <=  '0;
            instruction_MEMWB_out <=  NOP_INSTR_HEX;
            PC_MEMWB_out <=  '0;
            execute_result_MEMWB_out <=  '0;
            memRead_MEMWB_out <= '0 ;
            memReadRst_MEMWB_out <=  '0;
            ECALL_MEMWB_out <= '0;
        end else begin
            regWriteEnable_MEMWB_out <=  regWriteEnable_EXMEM_MEMWB;
            instruction_MEMWB_out <=  instruction_EXMEM_MEMWB;
            PC_MEMWB_out <=  PC_EXMEM_MEMWB;
            execute_result_MEMWB_out <=  execute_result_EXMEM_MEMWB;
            memRead_MEMWB_out <= memRead_EXMEM_MEMWB ;
            memReadRst_MEMWB_out <=  memReadRst_MEMWB_in;
            ECALL_MEMWB_out <= ECALL_EXMEM_MEMWB;

        end
    end





endmodule

`default_nettype wire
