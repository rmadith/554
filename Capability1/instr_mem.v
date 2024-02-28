module IM(clk,addr,rd_en,instr);

input clk;
input [15:0] addr;
input rd_en;			// asserted when instruction read desired

output reg [15:0] instr;	//output of insturction memory

reg [15:0]instr_mem[0:8191];

/////////////////////////////////////
// Memory is floped on negedge clock  //
///////////////////////////////////
always @(negedge clk)
   if(rd_en)
   	instr <= instr_mem[addr[13:0]];

initial begin
  $readmemh("test.hex",instr_mem);
end

endmodule