package common_def;

typedef enum { LUI, AUIPC, JAL, JALR, BEQ, BNE, BLT, BGE, BLTU, BGEU, LB, LH, LW, LBU, LHU, SB, SH, SW, ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI, ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND, INVALID, NOP, ECALL} instruction_type;

parameter NOP_INSTR_HEX = 32'h00000013;

parameter LUI_opcode_hex = 7'b0110111;

parameter AUIPC_opcode_hex = 7'b0010111;

parameter JAL_opcode_hex = 7'b1101111;

parameter BRANCH_opcode = 7'b1100111;

parameter SW_opcode = 7'b0100011;

parameter ALU_op_not_shift_opcode = 7'b0110011;

parameter LOAD_opcode = 7'b0000011;

parameter JALR_opcode = 7'b1100111;












endpackage