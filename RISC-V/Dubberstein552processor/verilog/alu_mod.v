/*
    CS/ECE 552 Spring '23
*/
`default_nettype none
module alu_mod (A, B, instruction, Ofl, Zero, result);
	parameter N = 16;
	
	input wire [N-1:0] A, B, instruction;
	output wire Ofl;
	output wire Zero;
	output wire [N-1:0] result;


	
	
	// declare internal nets
	wire Cin, invA, invB, sign;
	wire [4:0] opcode;
	wire [1:0] funct;
	wire [N-1:0] inB;
	wire [3:0] rotate_right_amt;
	
	wire [2:0] alu_op;
	
	assign opcode = instruction[N-1: N-5];
	assign funct = instruction [1:0];
	
	
	// Logic for alu_op.
	assign alu_op = ( (opcode==5'b01000 | opcode==5'b01001 | opcode==5'b10000 | opcode==5'b10001 | opcode==5'b10011 | (opcode==5'b11011 & (~funct[1])) | (& opcode[4:2])) ? 3'b100 : // case for ADD alu op
				//    ADDI                SUBI                ST                    LD                STU					ADD/SUB							// SEQ, SLT, SLE, SCO
				
				( (opcode==5'b01011 | (opcode==5'b11011 & (&funct))) ? 3'b101 : // case for AND alu op
				//   ANDNI				ANDN
				
				( (opcode==5'b11000 | opcode==5'b10010) ? 3'b110 : // case for OR alu op
				//  LBI                  SLBI
				
				( (opcode==5'b01010 | (opcode==5'b11011 & funct==2'b10))? 3'b111	:	// case for XOR alu op
				//  XORI				   XOR
				
				( (opcode==5'b10101 | (opcode==5'b11010 & ~(|funct)) | opcode==5'b10010)? 3'b000 :			// case for sll alu op
				//   SLLI				SLL                              SLBI
				
				( (opcode==5'b10111 | (opcode==5'b11010 & funct==2'b01)) ? 3'b001	:          // case for srl alu op
				//   SRLI              SRL
				
				( (opcode==5'b10100 | opcode==5'b10110 | (opcode==5'b11010 & funct[1])) ? 3'b010:// case for rll (rotate left) alu op. Note, this also includes rotate right (will be done 16-X times)
				//    ROLI             RORI                      ROL/ROR
				
				// case for sra alu op
				// no arithmetic right shifts needed.
				3'b011 )))))));//default case is XXX (error in logic).
				
				
	// Logic for invA
	assign invA = ((opcode==5'b01001) | (opcode==5'b11011 & funct==2'b01));
	//              SUBI                          SUB
	
	//Logic for invB
	assign invB = ((opcode==5'b01011) | (opcode==5'b11011 & funct==2'b11) | ( (& opcode[4:2]) & ~(&opcode[1:0])));
	//				ANDNI                ANDN                              SEQ, SLT,SLE instruction
	
	//Logic for Cin
	assign Cin = ((opcode==5'b01001) | (opcode==5'b11011 & funct==2'b01) | ( (& opcode[4:2]) & ~(&opcode[1:0])));
	//              SUBI                          SUB                      SEQ, SLT,SLE instruction
	
	//Logic for sign
	assign sign = (&opcode[4:2]) & (^opcode[1:0]);
	//				only true for SLT and SLE
	
	////////// logic to calculate rotate_right_amt = 16 - B[3:0]. This is the twos complement of B[3:0]. ////////////
	wire [3:0] not_b;
	wire c1,c2;
	assign not_b = ~B[3:0];
	assign rotate_right_amt[0] = B[0];
	
	assign rotate_right_amt[1] = not_b[0] ^ not_b[1];
	assign c1 = not_b[0] & not_b[1];
	
	assign rotate_right_amt[2] = c1 ^ not_b[2];
	assign c2 = c1 & not_b[2];
	
	assign rotate_right_amt[3] = c2 ^ not_b[3];
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	// Only change the rotate amount to the rotate right amount IF it is a rotate right operation.
	assign inB =  (opcode==5'b10110 | (opcode==5'b11010 & ( &funct))) ? {B[15:4], rotate_right_amt}    : B;
	//                 RORI                    ROR
	
	alu alu_internal(.InA(A), .InB(inB), .Cin(Cin), .Oper(alu_op), .invA(invA), .invB(invB), .sign(sign), .Out(result), .Zero(Zero), .Ofl(Ofl));
	
	
		
    
endmodule
`default_nettype wire
