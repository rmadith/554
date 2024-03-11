/*
   CS/ECE 552, Spring '23
	
*/
`default_nettype none
module nBitRegister (
           // Outputs
           D_O, err,
           // Inputs
           clk, rst, D, C
           );

   
   parameter N = 16; // The size of the register (number of bits it can store)
   
   input wire       clk, rst, C;
   input wire [N-1:0] D;

   output wire [N-1:0] D_O;
   output wire        err;

	wire [N-1:0] error_from_ffs;
	
   /* YOUR CODE HERE */
   
   // instantiate all FFs
   en_dff enable_flip_flops [N-1:0](.q(D_O), .err(error_from_ffs), .d(D), .clk(clk), .rst(rst), .en(C));
   
   assign err = (~((^D) === 0 | (^D) === 1)) | (~(clk === 0 | clk === 1)) | (~(rst === 0 | rst === 1)) | (~(C === 0 | C === 1));

endmodule
`default_nettype wire
