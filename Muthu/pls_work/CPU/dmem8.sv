module dmem8(clk,addr,re,we,rdata,wdata, debug, boot_addr, boot_data);

  // 8k byte memory //
  
  parameter file = "wiscv0.hex";
  
  
  //wiscv.hex --> 32-bits wide goes into readmemh of instr_mem
  //wiscv0.hex --> 8-bide and is [7:0];
  
  
  
  input clk;
  input [12:0] addr;
  input re, we;
  input [7:0] wdata;

  output logic [7:0] rdata;

  input debug;
  input [12:0] boot_addr;
  input [7:0] boot_data;
  
  reg [7:0]mem[0:8191];

  always @(negedge clk)
    if (re)
	    rdata <= mem[addr];
  
  always @(negedge clk)
    if(debug)
      mem[boot_addr] <= boot_data;
    else if (we)
	   mem[addr] <= wdata;
		
  //initial
    //$readmemh(file,mem);
		
endmodule