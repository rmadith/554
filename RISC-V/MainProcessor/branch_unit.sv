module branch_unit(
	//Inputs
	branch,jump,currPC,PC_plus4,immediate,SrcA,SrcB,funct3,opcode,
	//Outputs
	newPC, takeBranch
	);

///////////////////////////////////////
/////////////// Inputs ///////////////
/////////////////////////////////////
input [31:0] currPC,immediate,SrcA,SrcB,PC_plus4;
input branch,jump;
input [2:0] funct3;
input [6:0] opcode;
////////////////////////////////////////
/////////////// Outputs ///////////////
//////////////////////////////////////
output [31:0] newPC;
output reg takeBranch;
//////////////////////////////////////////
/////////////// Variables ///////////////
////////////////////////////////////////
logic [31:0] branchSum,jumpSum,jalrSum;
logic jumpFlag;
////////////////////////////////////////
///////////////////////////////////////
//////////////////////////////////////

always @(*) begin 
	takeBranch = 0;
	jumpFlag = 0;
	case(funct3) 
		3'b000:	takeBranch = (SrcA == SrcB);// BEQ
		3'b001: takeBranch = (SrcA != SrcB);// BNE
		3'b100: takeBranch = ($signed(SrcA) < $signed(SrcB)); // BLT
		3'b101: takeBranch = ($signed(SrcA) >= $signed(SrcB)); // BGE
		3'b110: takeBranch = (SrcA < SrcB);// BLTU
		3'b111: takeBranch =  (SrcA >= SrcB); // BGEU
	endcase
	
	case(opcode) // Jump Opcodes
		7'b1101111: jumpFlag = 0;
		7'b1100111: jumpFlag = 1;
	endcase
end 


assign branchSum = currPC + immediate; // ?? 
assign jumpSum = currPC + immediate;
assign jalrSum = SrcA + immediate;

assign newPC = (jump & jumpFlag) ? jalrSum : 
		(branch & takeBranch) ? branchSum : 
		(jump & ~jumpFlag) ? jumpSum : PC_plus4;

//assign flush = (takeBranch | jump) & (updatePC != PC_plus4);

endmodule
