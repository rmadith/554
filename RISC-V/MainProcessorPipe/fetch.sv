`default_nettype none
module fetch (
	
    ///// INPUTS  /////
	input wire clk,
    input wire rst_n,

    input wire PC_enable, 
    input wire takeBranch,
    input wire [31:0] branch_PC, 
    input wire incorrect_b_prediction,
    input wire [31:0] PC_IFID_IDEX,
    input wire [31:0] PC_plus4_IFID_out,

    ///// OUTPUTS /////
	output wire [31:0] PC_plus4_IFID_in,
	output reg [31:0] instruction_IFID_in,
    output reg [31:0] PC_IFID_in, 
    output wire ECALL
    );

    // Declare instruction memory and load contents from the code we wish to execute. 
    reg [31:0] instr_mem[0:65535];   // 2 ^ 16

    initial begin
        $readmemh("../Verification/basic_test_2_NOPs.hex",instr_mem);
    end


    // Instaniate BTB/PC module
    BTB_and_PC btb_pc (
        ///// INPUTS  /////
        .clk(clk), 
        .rst_n(rst_n), 

        .PC_enable(PC_enable), 
        .takeBranch(takeBranch), 
        .PC_plus_4(PC_plus4_IFID_in),

        .instruction_IFID_in(instruction_IFID_in),
        .branch_PC(branch_PC),
        .incorrect_b_prediction(incorrect_b_prediction),
        .PC_IFID_IDEX(PC_IFID_IDEX),
        .PC_plus4_IFID_out(PC_plus4_IFID_out),

        ///// OUTPUTS /////
        .PC_IFID_in(PC_IFID_in)
    );

    // Read instruction out of memory
    assign instruction_IFID_in = instr_mem[PC_IFID_in>>2]; // PC/4 (PC >>2) if increament by 4
   
    // Increment the PC
    assign PC_plus4_IFID_in = PC_IFID_in + 3'h4; // increament by 4 bytes (32 bit instruction set)

    assign ECALL = instruction_IFID_in == 32'h73;

endmodule

`default_nettype wire
