module branch_unit(
	//Inputs
	branch,jump,currPC,PC_plus4,immediate,SrcA,SrcB,funct3,j_opcode,
	//Outputs
	newPC
	);

///////////////////////////////////////
/////////////// Inputs ///////////////
/////////////////////////////////////
input [31:0] currPC,immediate,SrcA,SrcB,PC_plus4;
input branch,jump;
input [2:0] funct3;
input [6:0] j_opcode;
////////////////////////////////////////
/////////////// Outputs ///////////////
//////////////////////////////////////
output [31:0] newPC;
//////////////////////////////////////////
/////////////// Variables ///////////////
////////////////////////////////////////
logic [31:0] branchSum,jumpSum,jalrSum;
logic branchFlag,jumpFlag;
////////////////////////////////////////
///////////////////////////////////////
//////////////////////////////////////

always @(*) begin 
	branchFlag = 0;
	jumpFlag = 0;
	case(funct3) 
		3'b000:	branchFlag = (SrcA == SrcB);// BEQ
		3'b001: branchFlag = (SrcA != SrcB);// BNE
		3'b100: branchFlag = ($signed(SrcA) < $signed(SrcB)); // BLT
		3'b101: branchFlag = ($signed(SrcA) >= $signed(SrcB)); // BGE
		3'b110: branchFlag = (SrcA < SrcB);// BLTU
		3'b111: branchFlag =  (SrcA >= SrcB); // BGEU
	endcase
	
	case(j_opcode)
		7'b1101111: jumpFlag = 0;
		7'b1100111: jumpFlag = 1;
	endcase
end 


assign branchSum = currPC + immediate; // ?? 
assign jumpSum = currPC + immediate;
assign jalrSum = SrcA + immediate;

assign newPC = (jump & jumpFlag) ? jalrSum : 
		(branch & branchFlag) ? branchSum : 
		(jump & ~jumpFlag) ? jumpSum : PC_plus4;

endmodule
