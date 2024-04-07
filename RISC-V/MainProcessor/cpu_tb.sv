`default_nettype none

module cpu_tb();

    logic clk, rst_n;

    //////////////////////
    // Instantiate CPU //
    ////////////////////
    cpu iCPU(.clk(clk), .rst_n(rst_n));

    initial begin
        clk = 0;
        rst_n = 0;
        #2 rst_n = 1;

    end
    
    always
        #1 clk = ~clk;
  
endmodule

`default_nettype wire