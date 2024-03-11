/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 1-bit enable D-flipflop (DFF).
*/
`default_nettype none
module en_dff (
            // Output
            q, err,
            // Inputs
            d, clk, rst, en
            );

    output wire    q;
	output wire    err;
    input wire     d;
    input wire     clk;
    input wire     rst;
	input wire 	   en;
	
	wire d_en; // output value of multiplexor
	
	assign d_en = en ? d : q; // mulitplexor for enable.
	
	dff flipflop (.q(q), .d(d_en), .clk(clk), .rst(rst));
	
	assign err = (~(d == 0 | d == 1)) | (~(clk == 0 | clk == 1)) | (~(rst == 0 | rst == 1)) | (~(en == 0 | en == 1));

    

endmodule
`default_nettype wire
