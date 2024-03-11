/*
    CS/ECE 552 Spring '23
*/
`default_nettype none
module compare_mod (aluResult, Ofl, Zero, opcode, Out);
	parameter N = 16;
	parameter N_minus_1 = N-1;
	
	input wire [N-1:0] aluResult;
	input wire [4:0] opcode;
	input wire Ofl;
	input wire Zero;
	output wire [N-1:0] Out;

	// declare internal nets
	wire lsb;
	
	// NOTE: We XOR with the overflow for inputs 1 and 2, which correspond to SLT and SLE, to reverse the result if overflow occured
	mux4to1 mux_i(.sel(opcode[1:0]), .in0(Zero), .in1((aluResult[N-1] ^ Ofl)), .in2((aluResult[N-1] ^ Ofl) | Zero), .in3(Ofl), .out(lsb));
	
	assign Out = {{N_minus_1{1'b0}}, lsb};
    
endmodule
`default_nettype wire
