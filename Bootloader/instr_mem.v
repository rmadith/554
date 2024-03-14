module IM(clk,addr,rd_en,instr, debug);

input clk;
input [15:0] addr;
input rd_en;			// asserted when instruction read desired
input debug;

inout wire [15:0] instr;	//output of insturction memory

reg [15:0]instr_mem[0:16535];

assign instr = (debug) ? 16'hz : inter_instr;

reg [15:0] inter_instr;

/////////////////////////////////////
// Memory is floped on negedge clock  //
///////////////////////////////////
always @(negedge clk)
   if(debug)
	instr_mem[addr[13:0]] <= instr;
   if(rd_en)
   	inter_instr <= instr_mem[addr[13:0]];

initial begin
  $readmemh("test.hex",instr_mem);
end

endmodule