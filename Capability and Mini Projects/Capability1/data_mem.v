module DM(clk,addr,re,we,wrt_data,rd_data);

/////////////////////////////////////////////////////////
// Data memory.  Single ported, can read or write but //
// not both in a single cycle.  Precharge on clock   //
// high, read/write on clock low.                   //
/////////////////////////////////////////////////////
input clk;
input [12:0] addr;
input re;				// asserted when instruction read desired
input we;				// asserted when write desired
input [15:0] wrt_data;	// data to be written

output reg [15:0] rd_data;	//output of data memory

reg [15:0]data_mem[0:2047];

///////////////////////////////////////////////
// Model read, data is negedge  clock  //
/////////////////////////////////////////////
always @(negedge clk)
  if (re && ~we)
    rd_data <= data_mem[addr[12:0]];
	
////////////////////////////////////////////////
// Model write, data is written on negedge clk //
//////////////////////////////////////////////
always @(negedge clk)
  if (we && ~re)
    data_mem[addr[12:0]] <= wrt_data;

initial begin
  $readmemh("data_mem.hex",data_mem);
end
endmodule