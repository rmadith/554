import sys

def sign_extend(value, bits):
    sign_bit = 1 << (bits - 1)
    return (value & (sign_bit - 1)) - (value & sign_bit)

class RISCVEmulator:
    def __init__(self):
        self.registers = [0] * 32  # RISC-V has 32 registers
        self.memory = [0] * 1024  # Simplified memory model
        self.pc = 0  # Program Counter

    def load_program(self, filename, base_for_instruction):
        with open(filename, 'r') as file:
            for line in file:
                instruction = int(line.strip(), base_for_instruction)
                self.memory[self.pc] = instruction
                self.pc += 1
        self.pc = 0  # Reset PC to start execution from the beginning

    def decode_execute(self, instruction):
        opcode = instruction & 0x7F
        rd = (instruction >> 7) & 0x1F
        funct3 = (instruction >> 12) & 0x7
        rs1 = (instruction >> 15) & 0x1F
        rs2 = (instruction >> 20) & 0x1F
        imm_i = sign_extend((instruction >> 20), 12)
        imm_s = sign_extend(((instruction >> 25) << 5) | ((instruction >> 7) & 0x1F), 12)
        imm_b = sign_extend(((instruction >> 31) << 12) | ((instruction & (0x7F << 25)) >> (25 - 5)) | ((instruction & (0x1F << 8)) >> (8 - 1)) | ((instruction & 0xF00) >> (25 - 11)), 13)
        imm_u = instruction & 0xFFFFF000
        imm_j = sign_extend(((instruction >> 31) << 20) | ((instruction & (0x3FF << 21)) >> (21 - 1)) | ((instruction & (0x1 << 20)) >> (20 - 11)) | ((instruction & 0xFF000)), 21)
        imm = sign_extend((instruction >> 20), 12)  # For I-type instructions
        shamt = rs2  # For shift instructions, the shift amount is in rs2
        pc_next = self.pc + 1  # Default next PC

        if opcode == 0x37:  # LUI
            self.registers[rd] = imm_u
        elif opcode == 0x17:  # AUIPC
            self.registers[rd] = self.pc + imm_u
        elif opcode == 0x6F:  # JAL
            self.registers[rd] = pc_next
            pc_next = self.pc + imm_j
        elif opcode == 0x67:  # JALR
            self.registers[rd] = pc_next
            pc_next = (self.registers[rs1] + imm_i) & ~1
        elif opcode == 0x63:  # Branch instructions (BEQ, BNE, BLT, BGE, BLTU, BGEU)
            if (funct3 == 0 and self.registers[rs1] == self.registers[rs2]) or \
            (funct3 == 1 and self.registers[rs1] != self.registers[rs2]) or \
            (funct3 == 4 and self.registers[rs1] < self.registers[rs2]) or \
            (funct3 == 5 and self.registers[rs1] >= self.registers[rs2]) or \
            (funct3 == 6 and self.registers[rs1] < self.registers[rs2]) or \
            (funct3 == 7 and self.registers[rs1] >= self.registers[rs2]):
                pc_next = self.pc + imm_b // 4

        if opcode in [0x37, 0x17, 0x6F, 0x67, 0x63]:
            self.pc = pc_next

            # Define the operation function for simplicity
        def operation(op, rd, rs1, operand2, is_imm=False):
            if op == 'add':
                self.registers[rd] = self.registers[rs1] + operand2
            elif op == 'sub':
                self.registers[rd] = self.registers[rs1] - operand2
            elif op == 'sll':
                self.registers[rd] = self.registers[rs1] << operand2
            elif op == 'slt':
                self.registers[rd] = int(self.registers[rs1] < operand2)
            elif op == 'sltu':
                self.registers[rd] = int((self.registers[rs1] & 0xFFFFFFFF) < (operand2 & 0xFFFFFFFF))
            elif op == 'xor':
                self.registers[rd] = self.registers[rs1] ^ operand2
            elif op == 'srl':
                self.registers[rd] = (self.registers[rs1] & 0xFFFFFFFF) >> operand2
            elif op == 'sra':
                self.registers[rd] = self.registers[rs1] >> operand2
            elif op == 'or':
                self.registers[rd] = self.registers[rs1] | operand2
            elif op == 'and':
                self.registers[rd] = self.registers[rs1] & operand2
        
            # Print the operation
            op_type = "I" if is_imm else "R"
            print(f"{op.upper()} ({op_type}-Type): x{rd} = x{rs1} ({self.registers[rs1]}) {'immediate' if is_imm else 'x'+str(rs2)} ({operand2}) -> x{rd} = {self.registers[rd]}")

        # Immediate operations (I-type)
        if opcode == 0x13:  # This includes ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI
            if funct3 == 0x0:  # ADDI
                operation('add', rd, rs1, imm, is_imm=True)
            elif funct3 == 0x2:  # SLTI
                operation('slt', rd, rs1, imm, is_imm=True)
            elif funct3 == 0x3:  # SLTIU
                operation('sltu', rd, rs1, imm, is_imm=True)
            elif funct3 == 0x4:  # XORI
                operation('xor', rd, rs1, imm, is_imm=True)
            elif funct3 == 0x6:  # ORI
                operation('or', rd, rs1, imm, is_imm=True)
            elif funct3 == 0x7:  # ANDI
                operation('and', rd, rs1, imm, is_imm=True)
            elif funct3 == 0x1:  # SLLI
                operation('sll', rd, rs1, shamt, is_imm=True)
            elif funct3 == 0x5:  # SRLI and SRAI are distinguished by a bit in the instruction
                if instruction >> 30 == 0b0:
                    operation('srl', rd, rs1, shamt, is_imm=True)
                else:
                    operation('sra', rd, rs1, shamt, is_imm=True)

        # Register-Register operations (R-type)
        elif opcode == 0x33:
            if funct3 == 0x0:
                if instruction >> 30 == 0b0:  # ADD
                    operation('add', rd, rs1, self.registers[rs2])
                else:  # SUB
                    operation('sub', rd, rs1, self.registers[rs2])
            elif funct3 == 0x1:  # SLL
                operation('sll', rd, rs1, self.registers[rs2])
            elif funct3 == 0x2:  # SLT
                operation('slt', rd, rs1, self.registers[rs2])
            elif funct3 == 0x3:  # SLTU
                operation('sltu', rd, rs1, self.registers[rs2])
            elif funct3 == 0x4:  # XOR
                operation('xor', rd, rs1, self.registers[rs2])
            elif funct3 == 0x5:
                if instruction >> 30 == 0b0:  # SRL
                    operation('srl', rd, rs1, self.registers[rs2])
                else:  # SRA
                    operation('sra', rd, rs1, self.registers[rs2])
            elif funct3 == 0x6:  # OR
                operation('or', rd, rs1, self.registers[rs2])
            elif funct3 == 0x7:  # AND
                operation('and', rd, rs1, self.registers[rs2])

            # Load operations
        if opcode == 0x03:  # Load instructions have opcode 0x03
            address = self.registers[rs1] + imm_i  # Calculate address
            if funct3 == 0x0:  # LB
                value = self.memory[address] & 0xFF
                self.registers[rd] = sign_extend(value, 8)  # Sign-extend 8-bit value
                print(f"LB: x{rd} = MEM[{address}] ({self.registers[rd]})")
            elif funct3 == 0x1:  # LH
                value = self.memory[address] & 0xFFFF
                self.registers[rd] = sign_extend(value, 16)  # Sign-extend 16-bit value
                print(f"LH: x{rd} = MEM[{address}] ({self.registers[rd]})")
            elif funct3 == 0x2:  # LW
                value = self.memory[address]
                self.registers[rd] = sign_extend(value, 32)  # 32-bit value
                print(f"LW: x{rd} = MEM[{address}] ({self.registers[rd]})")
            elif funct3 == 0x4:  # LBU
                self.registers[rd] = self.memory[address] & 0xFF  # Unsigned load, no sign extension
                print(f"LBU: x{rd} = MEM[{address}] ({self.registers[rd]})")
            elif funct3 == 0x5:  # LHU
                self.registers[rd] = self.memory[address] & 0xFFFF  # Unsigned load, no sign extension
                print(f"LHU: x{rd} = MEM[{address}] ({self.registers[rd]})")

        # Store operations
        elif opcode == 0x23:  # Store instructions have opcode 0x23
            address = self.registers[rs1] + imm_s  # Calculate address
            if funct3 == 0x0:  # SB
                self.memory[address] = self.registers[rs2] & 0xFF  # Store lowest 8 bits
                print(f"SB: MEM[{address}] = x{rs2} ({self.registers[rs2] & 0xFF})")
            elif funct3 == 0x1:  # SH
                self.memory[address] = self.registers[rs2] & 0xFFFF  # Store lowest 16 bits
                print(f"SH: MEM[{address}] = x{rs2} ({self.registers[rs2] & 0xFFFF})")
            elif funct3 == 0x2:  # SW
                self.memory[address] = self.registers[rs2] 
                print(f"SW: MEM[{address}] = x{rs2} ({self.registers[rs2]})")


        self.pc += 1  # Advance program counter for the next instruction

    def run(self):
        while self.pc < len(self.memory) and self.memory[self.pc] != 0:
            instruction = self.memory[self.pc]
            self.decode_execute(instruction)
            #self.pc += 1

if __name__ == "__main__":
    emulator = RISCVEmulator()

    #################### PARSE COMMAND LINE ARGUMENTS #########################
    # Check if the number of command-line arguments is correct
    if len(sys.argv) != 5 or sys.argv[1] != "--file_name" or sys.argv[3] != "--base":
        print("Usage: python script_name.py --file_name <file_name> --base <integer_argument>")
        sys.exit(1)

    # Extract the file name and base arguments
    file_name = sys.argv[2]
    base_arg = sys.argv[4]

    try:
        # Attempt to parse the base argument as an integer
        base_for_instruction = int(base_arg)
    except ValueError:
        # Handle the case where the base argument is not a valid integer
        print("Error: Base argument is not a valid integer")
        sys.exit(1)

    
    ############################################################################

    emulator.load_program(file_name, base_for_instruction)  # Load the program
    emulator.run()  # Run the program
