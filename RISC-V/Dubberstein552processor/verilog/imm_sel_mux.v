`default_nettype none
module imm_sel_mux (sel, in0, in1, in2, in3, in4, out);
    parameter N = 16;
	
	input wire [N-1:0] in0, in1, in2, in3, in4;
	input wire [2:0] sel;
    output wire [N-1:0] out;
	
	wire [N-1:0] mux1_out;

	// 4:1 mux
   assign mux1_out = 	sel[1:0] == 2'b00 ? in0:
						sel[1:0] == 2'b01 ? in1:
						sel[1:0] == 2'b10 ? in2: in3;
						
	// 2:1 mux
	assign out = sel[2] ? in4 : mux1_out;
   
endmodule
`default_nettype wire