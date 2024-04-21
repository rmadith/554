`default_nettype none

import common_def::*;

module cpu_tb();

    logic clk, rst_n;

    logic [31:0] instruction_IFID_in;

    instruction_type inst_name_IFID_in;
    

    //////////////////////
    // Instantiate CPU //
    ////////////////////
    cpu iCPU(.clk(clk), .rst_n(rst_n));

    assign instruction_IFID_in = iCPU.instruction_IFID_in;


    instruction_debug iDEBUG_IFID_in(
        .instruction(instruction_IFID_in),
        .inst_name(inst_name_IFID_in)
    );




    initial begin
        clk = 0;
        rst_n = 0;
        #2 rst_n = 1;

    end
    
    always
        #1 clk = ~clk;
  
endmodule

`default_nettype wire