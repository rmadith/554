	module rf(clk,p0_addr,p1_addr,p0,p1,re0,re1,dst_addr,dst,we,hlt);
//////////////////////////////////////////////////////////////////
// Triple ported register file.  Two read ports (p0 & p1), and //
// one write port (dst).  Data is written on clock high, and  //
// read on clock low //////////////////////////////////////////
//////////////////////

input clk;
input [3:0] p0_addr, p1_addr;			// two read port addresses
input re0,re1;							// read enables (power not functionality)
input [3:0] dst_addr;					// write address
input [15:0] dst;						// dst bus
input we;								// write enable
input hlt;								// not a functional input.  Used to dump register contents when
										// test is halted.

output wire [15:0] p0,p1;  				//output read ports

integer indx;

reg [15:0]mem0[0:15];					// 16 registers each 16-bit wide
reg [15:0]mem1[0:15];					// 
//////////////////////////////////////////////////////////
// Register file will come up uninitialized except for //
// register zero which is hardwired to be zero.       //
///////////////////////////////////////////////////////


reg [15:0] temp_p0,temp_p1;


/////////////////////////////////////////////// BLock 1

always @(negedge clk)
  if (re0)
    temp_p0 <= mem0[p0_addr];
	
always @(negedge clk)
  if (we)
    mem0[dst_addr] <= dst;


///////////////////////////////////////////////// Block 2

always @(negedge clk)
  if (re1)
    temp_p1 <= mem1[p1_addr];

always @(negedge clk)
  if (we)
    mem1[dst_addr] <= dst;


assign p0 =  (p0_addr == 4'h0) ? 16'h0 : (((we === 1'b1) && (dst_addr === p0_addr)) ? dst: temp_p0);

assign p1 =  (p1_addr == 4'h0) ? 16'h0 : (((we === 1'b1) && (dst_addr === p1_addr)) ? dst: temp_p1);


////////////////////////////////////////
// Dump register contents at program //
// halt for debug purposes          //
/////////////////////////////////////
	
endmodule
  

