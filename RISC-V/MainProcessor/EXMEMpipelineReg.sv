`default_nettype none

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
    input wire [31:0] execute_rst_EXMEM_in,

    ///// PIPELINE OUTPUTS  /////
    output logic regWriteEnable_EXMEM_MEMWB,
    output logic [31:0] instruction_EXMEM_MEMWB,
    output logic [31:0] PC_EXMEM_MEMWB,
    output logic [31:0] regData2_EXMEM_out,
    output logic [2:0] memType_EXMEM_out,
    output logic memRead_EXMEM_MEMWB,
    output logic memWrite_EXMEM_out,
    output logic [31:0] execute_rst_EXMEM_MEMWB

    );
    
    // Dummy version for now.
    assign regWriteEnable_EXMEM_MEMWB = regWriteEnable_IDEX_EXMEM ;
    assign instruction_EXMEM_MEMWB = instruction_IDEX_EXMEM ;
    assign PC_EXMEM_MEMWB = PC_IDEX_EXMEM ;
    assign regData2_EXMEM_out = regData2_EXMEM_in ;
    assign memType_EXMEM_out = memType_IDEX_EXMEM ;
    assign memRead_EXMEM_MEMWB = memRead_IDEX_EXMEM ;
    assign memWrite_EXMEM_out = memWrite_IDEX_EXMEM ;
    assign execute_rst_EXMEM_MEMWB = execute_rst_EXMEM_in ;





endmodule

`default_nettype wire
