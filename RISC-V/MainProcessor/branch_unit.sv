`default_nettype none
module branch_unit(
	//Inputs
	branch,jump,currPC,PC_plus4,immediate,SrcA,SrcB,funct3,opcode,
	//Outputs
	branch_PC, takeBranch
	);

///////////////////////////////////////
/////////////// Inputs ///////////////
/////////////////////////////////////
input logic [31:0] currPC,immediate,SrcA,SrcB,PC_plus4;
input logic branch,jump;
input logic [2:0] funct3;
input logic [6:0] opcode;
////////////////////////////////////////
/////////////// Outputs ///////////////
//////////////////////////////////////
output logic [31:0] branch_PC;
output logic takeBranch;
//////////////////////////////////////////
/////////////// Variables ///////////////
////////////////////////////////////////
logic [31:0] branchSum,jumpSum,jalrSum;
logic jumpFlag;
logic branch_internal; 
////////////////////////////////////////
///////////////////////////////////////
//////////////////////////////////////


always @(*) begin 
	branch_internal = 0;
	jumpFlag = 0;
	case(funct3) 
		3'b000:	branch_internal = (SrcA === SrcB);// BEQ
		3'b001: branch_internal = (SrcA !== SrcB);// BNE
		3'b100: branch_internal = ($signed(SrcA) < $signed(SrcB)); // BLT
		3'b101: branch_internal = ($signed(SrcA) >= $signed(SrcB)); // BGE
		3'b110: branch_internal = (SrcA < SrcB);// BLTU
		3'b111: branch_internal =  (SrcA >= SrcB); // BGEU
		default:branch_internal = 0;
	endcase
	
	case(opcode) // Jump Opcodes
		7'b1101111: jumpFlag = 0;
		7'b1100111: jumpFlag = 1;
		default: jumpFlag = 0;
	endcase
end 

assign branchSum = currPC + immediate; // ?? 
assign jumpSum = currPC + immediate;
assign jalrSum = SrcA + immediate;

assign branch_PC = (jump & jumpFlag) ? jalrSum : 
		(branch & branch_internal) ? branchSum : 
		(jump & ~jumpFlag) ? jumpSum : PC_plus4;

assign takeBranch = jump | branch_internal;

endmodule

`default_nettype wire
