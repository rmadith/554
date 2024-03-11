/*
    Control logic for unpipelined processor
*/
`default_nettype none
module control (opcode, SavePC, MemToReg, MemRead, MemWrite, ALUSrcB, SetDataZero, SLData8, OffsetSel, CompareOp, ReverseOp, SextSel, WriteRegSel, RegWriteEnable);
	input wire [4:0] opcode;
	output wire SavePC;
	output wire MemToReg;
	output wire MemRead;
	output wire MemWrite;
	output wire ALUSrcB;
	output wire SetDataZero;
	output wire SLData8;
	output wire OffsetSel;
	output wire CompareOp;
	output wire ReverseOp;
	output wire [2:0] SextSel;
	output wire [1:0] WriteRegSel;
	output wire RegWriteEnable;


	assign SavePC = (~opcode[4]) & (~opcode[3]) & opcode[2] & opcode[1]; // only true for JAL or JALR
	
	assign MemToReg = opcode[4] & (~opcode[3]) & (~opcode[2]) & (~opcode[1]) & opcode[0]; // only true for LD
	
	assign MemRead = opcode[4] & (~opcode[3]) & (~opcode[2]) & (~opcode[1]) & opcode[0]; // only true for LD
	
	assign MemWrite = opcode[4] & (~opcode[3]) & (~opcode[2]) & (~(opcode[1] ^ opcode[0]));
						// only true for ST (5'b10000) or STU (5'b10011)
						
	assign ALUSrcB = ~(opcode[4] & opcode[3] & (|opcode[2:0]));
						// 1 iff using immediate value at ALU, 0 iff using read data 2 at ALU
						// the only instructions we need read data 2 at ALU are those with a 1 in the two
						// most significant bits of the opcode field, except LBI (5'b11000). So use a NAND gate.
						
	assign SetDataZero = opcode[4] & opcode[3] & (~opcode[2]) & (~opcode[1]) & (~opcode[0]);
						// only true for LBI
	
	assign SLData8 = opcode[4] & (~opcode[3]) & (~opcode[2]) & opcode[1] & (~opcode[0]);
						// only true for SLBI
						
	assign OffsetSel = (~opcode[4]) & (~opcode[3]) & opcode[2] & opcode[0];
						// 0 iff using immediate value to incr PC. 1 iff using read data 1 to incr PC
						// we incr PC with read data 1 in JALR, JR only
	
	assign CompareOp = (&opcode[4:2]); // 1 iff SEQ, SLT, SLE, or SCO.	
						
	assign ReverseOp = opcode[4] & opcode[3] & (~opcode[2]) & (~opcode[1]) & opcode[0];// only true for BTR
	
	
	// SextSel logic ////////////////////////////////////////////
	assign SextSel[2] = opcode[4] & (~opcode[3]) & (~opcode[2]) & opcode[1] & (~opcode[0]);
						// only true for SLBI
						
	assign SextSel[1] = (  (~opcode[4]) & opcode[3] & opcode[2]  ) |
						(  opcode[4] & opcode[3] & (~opcode[2])  ) |
						(  (~opcode[4]) & (~opcode[3]) & opcode[2]  );
						// only true for instructions with 3'b011, 3'b110, or 3'b001 in opcode[4:2]
						
	assign SextSel[0] = (  (~opcode[4]) & opcode[3] & (~opcode[2]) & opcode[1]  ) |//opcode[4:1]==4'b0101
						(  (~opcode[4]) & opcode[3] & opcode[2]  ) | // opcode[4:2]==3'b011
						(  opcode[4] & opcode[3] & (~opcode[2])  ) | // opcode[4:2]==3'b110 
						(  (~opcode[4]) & (~opcode[3]) & opcode[2] & opcode[0]  ); //JR or JALR
						// only true if opcode[4:1]==4'b0101 | opcode[4:2]==3'b011 | opcode[4:2]==3'b110 
						// or JR or JALR
	//////////////////////////////////////////////////////////////
	
	// WriteRegSel logic ////////////////////////////////////////////
	assign WriteRegSel[1] = (  opcode[4] & opcode[3] & (~opcode[2]) & (~opcode[1]) & (~opcode[0]) ) |
							(  (~opcode[4]) & (~opcode[3]) & opcode[2]  ) |
							(  opcode[4] & (~opcode[3]) & (~opcode[2]) & opcode[1] );
							// only 1 iff opcode==3'b11000  or opcode[4:2]==3'b001 or opcode[4:1]==3'b1001
							
	assign WriteRegSel[0] = (  opcode[4] & opcode[3] & (|opcode[2:0])) | 
							(  (~opcode[4]) & (~opcode[3]) & opcode[2] & opcode[1]  );
							
							// only 1 iff (opcode[4:3]==2'b11 and opcode[2:0]!=000)  or opcode[4:1]==3'b0011
	//////////////////////////////////////////////////////////////
	
	assign RegWriteEnable = ~(	(  ~(|opcode[4:1])  ) | // NOP
								(  opcode[4] & (~(|opcode[3:0]))  ) | // ST
								(  (~opcode[4]) & opcode[3] & opcode[2]  ) | // opcode[4:2]==3'b011
								(  (~opcode[4]) & (~opcode[3]) & opcode[2] & (~opcode[1])  ) |  //opcode[4:1]==4'b0010
								(	(~opcode[4]) & (~opcode[3]) & (~opcode[2]) & opcode[1] & opcode[0]	) //NOP / RTI
							);
							// 0 iff NOP, ST, opcode[4:2]==3'b011, opcode[4:1]==4'b0010, NOP / RTI
	
endmodule
`default_nettype wire
