/*
   CS/ECE 552, Spring '23
	
*/
`default_nettype none
module mux8_1 (
           // Outputs
           out, err,
           // Inputs
           sel, in0, in1, in2, in3, in4, in5, in6, in7
           );
   
   input wire [2:0] 	sel;
   input wire 	in0, in1, in2, in3, in4, in5, in6, in7;

   output wire 			out;
   output wire        	err;
	
   /* YOUR CODE HERE */
   
   // Logic for multiplexor.
   assign out = 	(sel == 3'h0)? in0 :
					(sel == 3'h1)? in1 :
					(sel == 3'h2)? in2 :
					(sel == 3'h3)? in3 :
					(sel == 3'h4)? in4 :
					(sel == 3'h5)? in5 :
					(sel == 3'h6)? in6 : in7;
					
	assign err = (~((^sel) === 0 | (^sel) === 1)) | (~(in0 === 0 | in0 === 1)) | (~(in1 === 0 | in1 === 1)) | (~(in2 === 0 | in2 === 1))
					| (~(in3 === 0 | in3 === 1)) | (~(in4 === 0 | in4 === 1)) | (~(in5 === 0 | in5 === 1)) 
					| (~(in6 === 0 | in6 === 1)) | (~(in7 === 0 | in7 === 1));

   
   
   
endmodule
`default_nettype wire
