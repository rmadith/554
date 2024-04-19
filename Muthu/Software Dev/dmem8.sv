module dmem8(clk,addr,re,we,rdata,wdata);

  // 8k byte memory //
  
  parameter file = "wiscv0.hex";
  
  
  wiscv.hex --> 32-bits wide goes into readmemh of instr_mem
  wiscv0.hex --> 8-bide and is [7:0];
  
  
  
  input clk;
  input [12:0] addr;
  input re, we;
  input [7:0] rdata;
  input [7:0] wdata;
  
  reg [7:0]mem[0:8191];
  
  assign rdata = (re) ? mem[addr] : 8'hzz;
  
  always @(negedge clk)
    if (we)
	   mem[addr] <= wdata;
		
  initial
    $readmemh(file,mem);
		
endmodule