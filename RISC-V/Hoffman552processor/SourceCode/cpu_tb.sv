module cpu_tb();

reg clk,rst_n;
logic [9:0] rdata;
logic [9:0] wdata;
logic [15:0] addr;
logic ex_re, ex_we;

//////////////////////
// Instantiate CPU //
////////////////////
cpu iCPU(.clk(clk), .rst_n(rst_n), .wdata(wdata) , .ex_re(ex_re), .ex_we(ex_we), .addr(addr), .rdata(rdata));

initial begin
  clk = 0;
  rst_n = 0;
  #2 rst_n = 1;

  rdata = 10'b1010101010;     //set the switch data, with the instr_test_sim instructions the switch data should be stored in R3
  
end
  
always
  #1 clk = ~clk;
  
endmodule