module DM(clk,addr,re,we,wrt_data,rd_data,debug, wr_data, in_addr);

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
input debug;
input [15:0] in_addr;
output reg [15:0] rd_data;	//output of data memory
input wire [15:0] wr_data;

reg [15:0]data_mem[0:8191];

///////////////////////////////////////////////
// Model read, data is negedge  clock  //
/////////////////////////////////////////////
always @(negedge clk)
  if (re && ~we)
    rd_data <= data_mem[addr[12:0]];
	
////////////////////////////////////////////////
// Model write, data is written on negedge clk //
//////////////////////////////////////////////
always @(negedge clk) begin
  if(debug)
    data_mem[in_addr[12:0]] <= wr_data;
  else if (we && ~re)
    data_mem[addr[12:0]] <= wrt_data;
end

initial begin
  $readmemh("data_mem.hex",data_mem);
end
endmodule