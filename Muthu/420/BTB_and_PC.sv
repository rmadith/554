`default_nettype none

module BTB_and_PC (
    ///// INPUTS  /////
    input wire logic clk, 
    input wire logic rst_n, 

    input wire logic PC_enable, 
    input wire logic takeBranch, 
    input wire logic [31:0] PC_plus_4,

    input wire logic [31:0] instruction_IFID_in,
    input wire logic [31:0] branch_PC,
    input wire logic incorrect_b_prediction,
    input wire logic [31:0] PC_IFID_IDEX,
    input wire logic [31:0] PC_plus4_IFID_out,

    ///// OUTPUTS /////
    output logic [31:0] PC_IFID_in
);

    ////////////////////////////////
    // Declare FFs for PC         //
    ////////////////////////////////

    logic [31:0] next_PC;
    assign #2 next_PC = takeBranch ? branch_PC : PC_plus_4;

    always_ff @ (posedge clk, negedge rst_n) begin
        if (!rst_n)
            PC_IFID_in <= 32'h0;    // Reset program counter to 0
        else if (PC_enable)  
            PC_IFID_in <= next_PC;
    end


endmodule

`default_nettype wire

