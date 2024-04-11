`default_nettype none

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
    input wire [31:0] execute_rst_EXMEM_MEMWB,
    input wire memRead_EXMEM_MEMWB,
    input wire [31:0] memReadRst_MEMWB_in,

    ///// PIPELINE OUTPUTS  /////
    output logic regWriteEnable_MEMWB_out,
    output logic [31:0] instruction_MEMWB_out,
    output logic [31:0] PC_MEMWB_out,
    output logic [31:0] execute_rst_MEMWB_out,
    output logic memRead_MEMWB_out,
    output logic [31:0] memReadRst_MEMWB_out

);
    // Dummy version for now.
    assign regWriteEnable_MEMWB_out =  regWriteEnable_EXMEM_MEMWB;
    assign instruction_MEMWB_out =  instruction_EXMEM_MEMWB;
    assign PC_MEMWB_out =  PC_EXMEM_MEMWB;
    assign execute_rst_MEMWB_out =  execute_rst_EXMEM_MEMWB;
    assign memRead_MEMWB_out = memRead_EXMEM_MEMWB ;
    assign memReadRst_MEMWB_out =  memReadRst_MEMWB_in;





endmodule

`default_nettype wire
