`default_nettype none

module IFIDpipelineReg(
    ///// INPUTS  /////
    input wire clk,
    input wire rst_n,
    
    input wire stall_disable,
    input wire flush,

    ///// PIPELINE INPUTS  /////
    input wire [31:0] PC_plus4_IFID_in,
	input wire [31:0] instruction_IFID_in,
    input wire [31:0] PC_IFID_in,


    ///// PIPELINE OUTPUTS  /////
    output wire [31:0] PC_plus4_IFID_out,
	output wire [31:0] instruction_IFID_IDEX,
    output wire [31:0] PC_IFID_IDEX

);
    // Dummy version for now.
    assign PC_plus4_IFID_out = PC_plus4_IFID_in;
    assign instruction_IFID_IDEX =  instruction_IFID_in;
    assign PC_IFID_IDEX = PC_IFID_in;




endmodule

`default_nettype wire
