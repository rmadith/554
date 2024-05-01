`default_nettype none

import common_def::*;

module EXMEMpipelineReg(
    ///// INPUTS  /////
    input wire clk,
    input wire rst_n,
    
    input wire stall_disable,
    input wire flush,

    ///// PIPELINE INPUTS  /////
    input wire regWriteEnable_IDEX_EXMEM,
    input wire [31:0] instruction_IDEX_EXMEM,
    input wire [31:0] PC_IDEX_EXMEM,
    input wire [31:0] regData2_EXMEM_in,
    input wire [2:0] memType_IDEX_EXMEM,
    input wire memRead_IDEX_EXMEM,
    input wire memWrite_IDEX_EXMEM,
    input wire [31:0] execute_result_EXMEM_in,
    input wire ECALL_IDEX_EXMEM,

    ///// PIPELINE OUTPUTS  /////
    output logic regWriteEnable_EXMEM_MEMWB,
    output logic [31:0] instruction_EXMEM_MEMWB,
    output logic [31:0] PC_EXMEM_MEMWB,
    output logic [31:0] regData2_EXMEM_out,
    output logic [2:0] memType_EXMEM_out,
    output logic memRead_EXMEM_MEMWB,
    output logic memWrite_EXMEM_out,
    output logic [31:0] execute_result_EXMEM_MEMWB,
    output logic ECALL_EXMEM_MEMWB

    );
    
    // Dummy version for now.
    // assign regWriteEnable_EXMEM_MEMWB = regWriteEnable_IDEX_EXMEM ;
    // assign instruction_EXMEM_MEMWB = instruction_IDEX_EXMEM ;
    // assign PC_EXMEM_MEMWB = PC_IDEX_EXMEM ;
    // assign regData2_EXMEM_out = regData2_EXMEM_in ;
    // assign memType_EXMEM_out = memType_IDEX_EXMEM ;
    // assign memRead_EXMEM_MEMWB = memRead_IDEX_EXMEM ;
    // assign memWrite_EXMEM_out = memWrite_IDEX_EXMEM ;
    // assign execute_result_EXMEM_MEMWB = execute_result_EXMEM_in ;

    always_ff @( posedge clk, negedge rst_n) begin 
        if (!rst_n) begin
            regWriteEnable_EXMEM_MEMWB <= '0 ;
            instruction_EXMEM_MEMWB <= NOP_INSTR_HEX ;
            PC_EXMEM_MEMWB <= '0 ;
            regData2_EXMEM_out <= '0 ;
            memType_EXMEM_out <= '0 ;
            memRead_EXMEM_MEMWB <= '0 ;
            memWrite_EXMEM_out <= '0 ;
            execute_result_EXMEM_MEMWB <= '0 ;
            ECALL_EXMEM_MEMWB <= '0;
        end else begin
            regWriteEnable_EXMEM_MEMWB <= regWriteEnable_IDEX_EXMEM ;
            instruction_EXMEM_MEMWB <= instruction_IDEX_EXMEM ;
            PC_EXMEM_MEMWB <= PC_IDEX_EXMEM ;
            regData2_EXMEM_out <= regData2_EXMEM_in ;
            memType_EXMEM_out <= memType_IDEX_EXMEM ;
            memRead_EXMEM_MEMWB <= memRead_IDEX_EXMEM ;
            memWrite_EXMEM_out <= memWrite_IDEX_EXMEM ;
            execute_result_EXMEM_MEMWB <= execute_result_EXMEM_in ;
            ECALL_EXMEM_MEMWB <= ECALL_IDEX_EXMEM;

        end
    end





endmodule

`default_nettype wire
