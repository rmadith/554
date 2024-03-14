module control_unit(
	//Inputs
	instr,
	//Outputs
	alu_op,immSel,immType,setDataZero,regWriteEnable,memRead,memWrite,branch,pc_operand,jump,
	addConstant4, memType
	);
`include "common_params.inc"
///////////////////////////////////////
/////////////// Inputs ///////////////
/////////////////////////////////////
input [31:0] instr;
////////////////////////////////////////
/////////////// Outputs ///////////////
//////////////////////////////////////
output reg [2:0] immType; // I-type=0(Sext),I-type=1(Zext),S-type=2,B-type=3,U-type=4,J-type=5
output reg [3:0] alu_op; // ?????? how many bits (4bits)
output reg immSel; //ALU Src B
output reg setDataZero;
output reg regWriteEnable;
output reg memRead;
output reg memWrite;
output reg branch;
output reg pc_operand;
output reg jump;
output reg addConstant4;
output reg [2:0] memType;
//////////////////////////////////////////
/////////////// Variables ///////////////
////////////////////////////////////////
logic [6:0] opcode;
logic [2:0] funct3;
logic [6:0] funct7;
logic [3:0] inter_alu_op; // ???? Set number of bits
logic [2:0] inter_memType; 
////////////////////////////////////////
///////////////////////////////////////
//////////////////////////////////////

assign opcode = instr[6:0];
assign funct3 = instr[14:12];
assign funct7 = instr[31:25];

always@(*) begin 
	case(funct3)
		3'b000: begin
			inter_alu_op = funct7[5]; // if 1 SUB, if 0 ADD 
			inter_memType = 0; // B
			end
		3'b001: begin
			inter_alu_op = 2; // SLLI,SLL
			inter_memType = 1; // H
			end
		3'b010: begin
			inter_alu_op = 3; // SLTI,SLT
			inter_memType = 2; // W
			end
		3'b011: inter_alu_op = 4; // SLTIU,SLTU
		3'b100: begin
			inter_alu_op = 5; // XORI,XOR
			inter_memType = 3; // BU
			end
		3'b101: begin
			inter_alu_op = (funct7[5]) ? 7 : 6;  // 7 - SRAI,SRA // 6 - SRLI,SRL
			inter_memType = 4; // HU
			end
		3'b110: inter_alu_op = 8; // ORI,OR
		3'b111: inter_alu_op = 9; // ANDI,AND			
	endcase
end


always@(*) begin
	setDataZero = 0;
	immSel = 0;
	immType = 0;
	regWriteEnable = 0;
	memRead = 0;
	memWrite = 0;
	branch = 0;
	pc_operand = 0;
	jump = 0;
	alu_op = 0;
	addConstant4 = 0;
	memType = 0;
   	case(opcode)
		7'b0110111: begin  // LUI 
				setDataZero = 1;
				immSel = 1;
				immType = 4; // U-type
				regWriteEnable = 1;
			    end
		7'b0010111: begin //AUIPC - add upper immediate to pc
				immSel = 1;
				immType = 4; //U-type
				regWriteEnable = 1;
				pc_operand = 1;
				alu_op = 0; // ADD here
				
			    end
		7'b1101111: begin // JAL rd<-PC + 4 and Jumps to (PC + immd) 
				immSel = 1;
				immType = 5; //J-Type
				regWriteEnable = 1;
				pc_operand = 1;
				addConstant4 = 1;
				jump = 1;
				alu_op = 0; // ADD here 
			    end
		7'b1100111: begin // JALR - ????
				regWriteEnable = 1;
				immSel = 1;
				immType = 0;
				pc_operand = 1;
				addConstant4 = 1;
				jump = 1;
				alu_op = 0; // ADD here
			    end
		7'b1100011: begin // BRANCH STUFF
				branch = 1;
				immSel = 1;
				immType = 3;
			    end
		7'b0000011: begin // LOAD
				regWriteEnable = 1;
				immSel = 1;
				immType = 0;
				memRead = 1;
				alu_op = 0; // ADD here
				memType = inter_memType; 
			    end
		7'b0100011: begin // STORE
				immSel = 1;
				immType = 2;
				memWrite = 1;
				alu_op = 0; // ADD here
				memType = inter_memType;
			    end
		7'b0010011: begin // ADDI,SLTI,SLTIU,XORI,ORI,ANDI,SLLI,SRLI,SRAI
				regWriteEnable = 1;
				immSel = 1;
				immType = 0; // Sext immediate for those
				alu_op = inter_alu_op;
			    end
		7'b0110011: begin // ADD,SUB,SLL,SLT,SLTU,XOR,SRL,SRA,OR,AND
				regWriteEnable = 1;				
				alu_op = inter_alu_op;
			    end
	endcase
    end
endmodule
