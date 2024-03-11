/*
    branch/jump logic.
*/
`default_nettype none
module b_j_logic (opcode, RsVal, takeBranch);
	parameter N = 16;
	
	input wire [4:0] opcode;
	input wire [N-1:0] RsVal;
	output wire takeBranch;
	
	assign takeBranch = ( (~opcode[4]) & (~opcode[3]) & opcode[2] ) | 
							// always take branch if it is a jump
						
						(  ((~opcode[4]) & opcode[3] & opcode[2]  ) & // or if it is a branch and...
							(
								(  (~opcode[1]) & (~opcode[0]) & (~(|RsVal))  ) | // BEQZ or
								(  (~opcode[1]) & opcode[0] & (|RsVal)  ) | // BNEZ or
								(  opcode[1] & (~opcode[0]) & (RsVal[N-1])  ) | // BLTZ or
								(  opcode[1] & opcode[0] & (~RsVal[N-1])  ) // BGEZ or
							)
						);
endmodule
`default_nettype wire
