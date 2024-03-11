module rf(clk,rst_n,p0_addr,p1_addr,p0,p1,re0,re1,dst_addr,dst,we,hlt);
//////////////////////////////////////////////////////////////////
// Triple ported register file.  Two read ports (p0 & p1), and //
// one write port (dst).  Data is written on clock high, and  //
// read on clock low //////////////////////////////////////////
//////////////////////

input logic clk, rst_n;
input logic [3:0] p0_addr, p1_addr;			// two read port addresses
input logic re0,re1;							// read enables (power not functionality)
input logic [3:0] dst_addr;					// write address
input logic [15:0] dst;						// dst bus
input logic we;								// write enable
input logic hlt;								// not a functional input.  Used to dump register contents when
										// test is halted.

output logic [15:0] p0,p1;  				//output read ports

integer indx;

logic [15:0] p0_m,p1_m;
reg [15:0]mem[0:15];					// 16 registers each 16-bit wide

////////////////////
// Register Files //
////////////////////
always @(negedge clk, negedge rst_n) begin
  if(!rst_n) begin    // on reset, wipe the registers 
    mem[0] = '0;
    mem[1] = '0;
    mem[2] = '0;
    mem[3] = '0;
    mem[4] = '0;
    mem[5] = '0;
    mem[6] = '0;
    mem[7] = '0;
    mem[8] = '0;
    mem[9] = '0;
    mem[10] = '0;
    mem[11] = '0;
    mem[12] = '0;
    mem[13] = '0;
    mem[14] = '0;
    mem[15] = '0;
  end

  else begin  // not reset
      if (we)                                 //if register write
        mem[dst_addr] <= dst;
      if(re0)                                 //if reading from Register File 0
        if (~|p0_addr)                        //if reading from register 0 in RegisterFile 0
        p0 <= 16'h0000;
      else if(we && dst_addr == p0_addr)      //if register bypass is required
          p0 <= dst;
        else
          p0 <= mem[p0_addr];
      if(re1) begin                           //if reading from Register File 1
        if (~|p1_addr)                        //if reading from register 0 in RegisterFile1
        p1 <= 16'h0000;
        else if (we && dst_addr == p1_addr)   //if register bypass is required
          p1 <= dst;
        else
          p1 <= mem[p1_addr];
      end
  end
end

	
endmodule
  

