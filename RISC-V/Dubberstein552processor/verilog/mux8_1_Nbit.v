/*
   CS/ECE 552, Spring '23
	
*/
`default_nettype none
module mux8_1_Nbit (
           // Outputs
           out, err,
           // Inputs
           sel, in
           );
		   
		   
   parameter N = 16;
   
   input wire [2:0] 	sel;
   input wire [N*8-1:0] 	in;

   output wire [N-1:0]	out;
   output wire        	err;
	
   /* YOUR CODE HERE */
   
   wire [N-1:0] submodule_errs;
   
   // Logic for multiplexor.
   mux8_1 muxes [N-1:0] (.out(out), .err(submodule_errs), .sel(sel), .in0(in[N-1:0]), .in1(in[2*N-1:N]), .in2(in[3*N-1:2*N]), .in3(in[4*N-1:3*N]), .in4(in[5*N-1:4*N]), .in5(in[6*N-1:5*N]), .in6(in[7*N-1:6*N]), .in7(in[8*N-1:7*N]));
			
	// Logic for err 
	assign err = (~((^sel) === 0 | (^sel) === 1)) | (~((^in) === 0 | (^in) === 1)) | ( | submodule_errs );

   
   
   
endmodule
`default_nettype wire
