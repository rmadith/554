`default_nettype none

import common_def::*;

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
    input wire ECALL_IFID_in,


    ///// PIPELINE OUTPUTS  /////
    output logic [31:0] PC_plus4_IFID_out,
	output logic [31:0] instruction_IFID_IDEX,
    output logic [31:0] PC_IFID_IDEX,
    output logic ECALL_IFID_IDEX


);
    // Dummy version for now.
    // assign PC_plus4_IFID_out = PC_plus4_IFID_in;
    // assign instruction_IFID_IDEX =  instruction_IFID_in;
    // assign PC_IFID_IDEX = PC_IFID_in;

    always_ff @( posedge clk, negedge rst_n) begin 
        if (!rst_n) begin
            PC_plus4_IFID_out <= '0;
            instruction_IFID_IDEX <= NOP_INSTR_HEX;
            PC_IFID_IDEX <= '0;
            ECALL_IFID_IDEX <= '0;
        end else if (flush | instruction_IFID_in == NOP_INSTR_HEX) begin
            PC_plus4_IFID_out <= PC_plus4_IFID_in;
            instruction_IFID_IDEX <= NOP_INSTR_HEX;
            PC_IFID_IDEX <= PC_IFID_in;
            ECALL_IFID_IDEX <= '0;
        end else begin
            PC_plus4_IFID_out <= PC_plus4_IFID_in;
            instruction_IFID_IDEX <=  instruction_IFID_in;
            PC_IFID_IDEX <= PC_IFID_in;
            ECALL_IFID_IDEX <= ECALL_IFID_in;

        end
    end




endmodule

`default_nettype wire
