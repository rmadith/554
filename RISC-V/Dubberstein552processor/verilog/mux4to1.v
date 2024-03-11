`default_nettype none
module mux4to1 (sel, in0, in1, in2, in3, out);
    input wire in0, in1, in2, in3;
	input wire [1:0] sel;
    output wire out;

   assign out = sel == 2'b00 ? in0:
				sel == 2'b01 ? in1:
				sel == 2'b10 ? in2: in3;
   
endmodule
`default_nettype wire