import common_def::*;

module instruction_debug (
    // INPUTS //
    input wire logic [31:0] instruction,

    // OUTPUTS //
    output instruction_type inst_name
);

logic [9:0] funct3_and_opcode;

always_comb begin 
	case(instruction) inside    // used for debugging in the waveforms, the names of the instructions will show in the waves
		32'b000000000000000000000000000x00xx: inst_name = NOP;
        32'bxxxxxxxxxxxxxxxxxxxxxxxxx0110111: inst_name = LUI;
        32'bxxxxxxxxxxxxxxxxxxxxxxxxx0010111: inst_name = AUIPC;
        32'bxxxxxxxxxxxxxxxxxxxxxxxxx1101111: inst_name = JAL;
        32'bxxxxxxxxxxxxxxxxx000xxxxx1100111: inst_name = JALR;
        32'bxxxxxxxxxxxxxxxxx000xxxxx1100011: inst_name = BEQ;
        32'bxxxxxxxxxxxxxxxxx001xxxxx1100011: inst_name = BNE;
        32'bxxxxxxxxxxxxxxxxx100xxxxx1100011: inst_name = BLT;
        32'bxxxxxxxxxxxxxxxxx101xxxxx1100011: inst_name = BGE;
        32'bxxxxxxxxxxxxxxxxx110xxxxx1100011: inst_name = BLTU;
        32'bxxxxxxxxxxxxxxxxx111xxxxx1100011: inst_name = BGEU;
        32'bxxxxxxxxxxxxxxxxx000xxxxx0000011: inst_name = LB;
        32'bxxxxxxxxxxxxxxxxx001xxxxx0000011: inst_name = LH;
        32'bxxxxxxxxxxxxxxxxx010xxxxx0000011: inst_name = LW;
        32'bxxxxxxxxxxxxxxxxx100xxxxx0000011: inst_name = LBU;
        32'bxxxxxxxxxxxxxxxxx101xxxxx0000011: inst_name = LHU;
        32'bxxxxxxxxxxxxxxxxx000xxxxx0100011: inst_name = SB;
        32'bxxxxxxxxxxxxxxxxx001xxxxx0100011: inst_name = SH;
        32'bxxxxxxxxxxxxxxxxx010xxxxx0100011: inst_name = SW;
        32'bxxxxxxxxxxxxxxxxx000xxxxx0010011: inst_name = ADDI;
        32'bxxxxxxxxxxxxxxxxx010xxxxx0010011: inst_name = SLTI;
        32'bxxxxxxxxxxxxxxxxx011xxxxx0010011: inst_name = SLTIU;
        32'bxxxxxxxxxxxxxxxxx100xxxxx0010011: inst_name = XORI;
        32'bxxxxxxxxxxxxxxxxx110xxxxx0010011: inst_name = ORI;
        32'bxxxxxxxxxxxxxxxxx111xxxxx0010011: inst_name = ANDI;
        32'b0000000xxxxxxxxxx001xxxxx0010011: inst_name = SLLI;
        32'b0000000xxxxxxxxxx101xxxxx0010011: inst_name = SRLI;
        32'b0100000xxxxxxxxxx101xxxxx0010011: inst_name = SRAI;
        32'b0000000xxxxxxxxxx000xxxxx0110011: inst_name = ADD;
        32'b0100000xxxxxxxxxx000xxxxx0110011: inst_name = SUB;
        32'b0000000xxxxxxxxxx001xxxxx0110011: inst_name = SLL;
        32'b0000000xxxxxxxxxx010xxxxx0110011: inst_name = SLT;
        32'b0000000xxxxxxxxxx011xxxxx0110011: inst_name = SLTU;
        32'b0000000xxxxxxxxxx100xxxxx0110011: inst_name = XOR;
        32'b0000000xxxxxxxxxx101xxxxx0110011: inst_name = SRL;
        32'b0100000xxxxxxxxxx101xxxxx0110011: inst_name = SRA;
        32'b0000000xxxxxxxxxx110xxxxx0110011: inst_name = OR;
        32'b0000000xxxxxxxxxx111xxxxx0110011: inst_name = AND;
        32'h00000073: inst_name = ECALL;
        default: inst_name = INVALID;
	endcase
end

endmodule