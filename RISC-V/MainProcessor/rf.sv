`default_nettype none

module rf(clk,p0_addr,p1_addr,p0,p1,re0,re1,dst_addr,dst,we);
//////////////////////////////////////////////////////////////////
// Triple ported register file.  Two read ports (p0 & p1), and //
// one write port (dst).  Data is written on clock high, and  //
// read on clock low //////////////////////////////////////////
//////////////////////

input wire clk;
input wire [4:0] p0_addr, p1_addr;			// two read port addresses
input wire re0,re1;							// read enables (power not functionality)
input wire [4:0] dst_addr;					// write address
input wire [31:0] dst;						// dst bus
input wire we;								// write enable								// not a functional input.  Used to dump register contents when
									

output wire [31:0] p0,p1;  				//output read ports


reg [31:0]mem0[0:31];					// 32 registers each 32-bit wide
reg [31:0]mem1[0:31];					// 32 register each 32-bit wide
//////////////////////////////////////////////////////////
// Register file will come up uninitialized except for //
// register zero which is hardwired to be zero.       //
///////////////////////////////////////////////////////


reg [31:0] temp_p0,temp_p1;


/////////////////////////////////////////////// BLock 1

assign temp_p0 = mem0[p0_addr];
	 
always @(negedge clk) // ??
  if (we)
    mem0[dst_addr] <= dst;


///////////////////////////////////////////////// Block 2

assign temp_p1 = mem1[p1_addr];

always @(negedge clk) // ??
  if (we)
    mem1[dst_addr] <= dst;



// Register Bypass Added edge case to make R0 return 0

//assign p0 =  (p0_addr == 4'h0) ? 31'h0 : (((we === 1'b1) && (dst_addr === p0_addr)) ? dst: temp_p0);

//assign p1 =  (p1_addr == 4'h0) ? 31'h0 : (((we === 1'b1) && (dst_addr === p1_addr)) ? dst: temp_p1);

assign p0 = (p0_addr == 4'h0) ? 'h0 : temp_p0; // only for single cycle
assign p1 = (p1_addr == 4'h0) ? 'h0 : temp_p1; // only for single cycle
	
endmodule

`default_nettype wire
  
