module dmem8(clk,addr,re,we,rdata,wdata, debug, data_cpu, waddr_cpu);

  // 8k byte memory //
  
  parameter file = "wiscv0.hex";
  
  
  //wiscv.hex --> 32-bits wide goes into readmemh of instr_mem
  //wiscv0.hex --> 8-bide and is [7:0];
  
  
  
  input clk;
  input [12:0] addr;
  input re, we;
  input [7:0] wdata;
  input debug;
  input [7:0] data_cpu;
  input [12:0] waddr_cpu;

  output reg [7:0] rdata;
  
  reg [7:0]mem[0:8191];


  always @(negedge clk)
    rdata <= mem[addr];
  
  always @(negedge clk)
    if (debug)
     mem[waddr_cpu] <= data_cpu;
    else if (we)
	   mem[addr] <= wdata;
		
  //initial
    //$readmemh(file,mem);
		
endmodule