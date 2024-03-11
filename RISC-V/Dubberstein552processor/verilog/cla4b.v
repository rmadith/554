/*
    CS/ECE 552 Spring '23
    Homework #1, Problem 2
    
    a 4-bit CLA module
*/
`default_nettype none
module cla4b(sum, cOut, inA, inB, cIn, G, P);

    // declare constant for size of inputs, outputs (N)
    parameter   N = 4;

    output wire [N-1:0] sum;
    output wire         cOut, G, P;
    input wire [N-1: 0] inA, inB;
    input wire          cIn;

    // YOUR CODE HERE
	
	// declare internal nets	
	wire [N-1:0] carry;
	wire [N-1:0] g, p;
	
	wire p0_c0; // for carry[1]
	wire p1_g0, p1_p0_c0; // for carry[2]
	wire p2_g1, p2_p1_g0, p2_p1_p0_c0; // for carry[3]
	wire p2_p1;//, p0_c0; // for carry[3] intermediate
	wire g2_O_p2_g1, p2_p1_g0_O_p2_p1_p0_c0; // for carry[3] intermediate
	wire p3_g2, p3_p2_g1, p3_p2_p1_g0, p3_p2_p1_p0_c0; // for carry[4]
	wire p3_p2;// p1_g0
	wire p3_p2_p1;// p0_c0; // for carry[4] intermediate
	wire g3_O_p3_g2_O_p3_p2_g1, p3_p2_p1_g0_O_p3_p2_p1_p0_c0; // for carry[4] intermediate
	wire p1_p0; // for group P
	
	// create combinational logic for carrys using generates and propogates //
	
	// first create and / or gates to create generates / propogates.
	and2 and_g [N-1:0] (.out(g), .in1(inA), .in2(inB));
	or2 or_g [N-1:0] (.out(p), .in1(inA), .in2(inB));
	
	// carry[0] //////////////////////////////////////////////////////////////////////////////////
	assign carry[0] = cIn; // only using assign to connect wire.
	
	// carry[1] //////////////////////////////////////////////////////////////////////////////////
	and2 and_p0_c0 (.out(p0_c0), .in1(p[0]), .in2(carry[0])); //p0_c0
	or2 or_c1 (.out(carry[1]), .in1(g[0]), .in2(p0_c0)); // carry[1]
	
	// carry[2] //////////////////////////////////////////////////////////////////////////////////
	and2 and_p1_g0 (.out(p1_g0), .in1(p[1]), .in2(g[0])); //p1_g0
	and3 and_p1_p0_c0 (.out(p1_p0_c0), .in1(p[1]), .in2(p[0]), .in3(carry[0])); //p1_p0_c0
	or3 or_c2 (.out(carry[2]), .in1(g[1]), .in2(p1_g0), .in3(p1_p0_c0)); // carry[2]
	
	// carry[3] //////////////////////////////////////////////////////////////////////////////////
	and2 and_p2_g1 (.out(p2_g1), .in1(p[2]), .in2(g[1])); //p2_g1
	and3 and_p2_p1_g0 (.out(p2_p1_g0), .in1(p[2]), .in2(p[1]), .in3(g[0])); //p2_p1_g0
	
	and2 and_p2_p1 (.out(p2_p1), .in1(p[2]), .in2(p[1])); //p2_p1
	//and2 and_p0_c0 (.out(p0_c0), .in1(p[0]), .in2(carry[0])); //p0_c0
	and2 and_p2_p1_p0_c0 (.out(p2_p1_p0_c0), .in1(p2_p1), .in2(p0_c0)); //p2_p1_p0_c0
	
	or2 or_g2_O_p2_g1 (.out(g2_O_p2_g1), .in1(g[2]), .in2(p2_g1)); // g2_O_p2_g1
	or2 or_p2_p1_g0_O_p2_p1_p0_c0 (.out(p2_p1_g0_O_p2_p1_p0_c0), .in1(p2_p1_g0), .in2(p2_p1_p0_c0)); // p2_p1_g0_O_p2_p1_p0_c0
	
	or2 or_c3 (.out(carry[3]), .in1(g2_O_p2_g1), .in2(p2_p1_g0_O_p2_p1_p0_c0)); // carry[3]
	
	// cOut //////////////////////////////////////////////////////////////////////////////////
	and2 and_p3_g2 (.out(p3_g2), .in1(p[3]), .in2(g[2]));// p3_g2
	and3 and_p3_p2_g1 (.out(p3_p2_g1), .in1(p[3]), .in2(p[2]), .in3(g[1])); // p3_p2_g1
	
	and2 and_p3_p2 (.out(p3_p2), .in1(p[3]), .in2(p[2]));// p3_p2
	// p1_g0 already exists
	and2 and_p3_p2_p1_g0 (.out(p3_p2_p1_g0), .in1(p3_p2), .in2(p1_g0)); // p3_p2_p1_g0
	
	and3 and_p3_p2_p1 (.out(p3_p2_p1), .in1(p[3]), .in2(p[2]), .in3(p[1]));// p3_p2_p1
	// p0_c0 already exists
	and2 and_p3_p2_p1_p0_c0 (.out(p3_p2_p1_p0_c0), .in1(p3_p2_p1), .in2(p0_c0)); // p3_p2_p1_p0_c0
	
	or3 or_g3_O_p3_g2_O_p3_p2_g1 (.out(g3_O_p3_g2_O_p3_p2_g1), .in1(g[3]), .in2(p3_g2), .in3(p3_p2_g1)); // g3_O_p3_g2_O_p3_p2_g1
	or2 or_p3_p2_p1_g0_O_p3_p2_p1_p0_c0 (.out(p3_p2_p1_g0_O_p3_p2_p1_p0_c0), .in1(p3_p2_p1_g0), .in2(p3_p2_p1_p0_c0)); //p3_p2_p1_g0_O_p3_p2_p1_p0_c0

	or2 or_cOut (.out(cOut), .in1(g3_O_p3_g2_O_p3_p2_g1), .in2(p3_p2_p1_g0_O_p3_p2_p1_p0_c0)); //cOut
	
	// group G and P //////////////////////////////////////////////////////////////////////////////////
	// logic for P
	
	and2 and_p1_p0 (.out(p1_p0), .in1(p[1]), .in2(p[0]));
	and2 and_P (.out(P), .in1(p3_p2), .in2(p1_p0));
	
	// logic for G
	or2 or_G (.out(G), .in1(g3_O_p3_g2_O_p3_p2_g1), .in2(p3_p2_p1_g0));
	
	// declare array of full adders
	fullAdder1b full_adders [N-1:0] (.s(sum), .cOut(), .inA(inA), .inB(inB), .cIn(carry));
	
	
	
	
endmodule
`default_nettype wire
