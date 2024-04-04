module IM(clk,addr,rd_en,instr, debug, wr_instr, in_addr);

input clk;
input [15:0] addr;
input rd_en;			// asserted when instruction read desired
input debug;
input [15:0] in_addr;

output reg [15:0] instr;	//output of insturction memory
input wire [15:0] wr_instr;

reg [15:0]instr_mem[0:16535];

/////////////////////////////////////
// Memory is floped on negedge clock  //
///////////////////////////////////
always @(negedge clk) begin
   if(debug)
	instr_mem[in_addr[13:0]] <= wr_instr;
   else if(rd_en)
   	instr <= instr_mem[addr[13:0]];
end
initial begin
  $readmemh("test.hex",instr_mem);
end

endmodule