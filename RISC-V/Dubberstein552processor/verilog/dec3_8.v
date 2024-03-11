/*
   CS/ECE 552, Spring '23
	
*/
`default_nettype none
module dec3_8 (
           // Outputs
           Out, err,
           // Inputs
           sel
           );
   
   input wire [2:0] sel;

   output wire [7:0] Out;
   output wire        err;
	
   /* YOUR CODE HERE */
   
   // Logic for decoder.
   assign Out[0] = (~sel[2]) & (~sel[1]) & (~sel[0]);
   assign Out[1] = (~sel[2]) & (~sel[1]) & (sel[0]);
   assign Out[2] = (~sel[2]) & (sel[1]) & (~sel[0]);
   assign Out[3] = (~sel[2]) & (sel[1]) & (sel[0]);
   assign Out[4] = (sel[2]) & (~sel[1]) & (~sel[0]);
   assign Out[5] = (sel[2]) & (~sel[1]) & (sel[0]);
   assign Out[6] = (sel[2]) & (sel[1]) & (~sel[0]);
   assign Out[7] = (sel[2]) & (sel[1]) & (sel[0]);
   
   assign err = (~((^sel) === 0 | (^sel) === 1));

   
   
   
endmodule
`default_nettype wire
