`default_nettype none

import common_def::*;

module CheckForLoadToUse(
	input wire [31:0] InstructionInFetch, // The instruction that is currently in the fetch stage.
	input wire [4:0] ReadReg1InFetch,
	input wire [4:0] ReadReg2InFetch, // The two registers that need to be read for the instruction that is in the fetch stage.
	
	input wire [31:0] InstructionInDecode, // The instruction in a later phase that we are checking for a RAW dependency against.
	input wire RegWriteEnableInDecode, // is the instruction in a later phase writing to a register?
	input wire MemReadInDecode, // is the instruction in decode reading from memory?
	
	output wire stall // the result if we need to stall (i.e. is there a RAW?)
);

	// Declare internal nets///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	wire WRS_RR1, WRS_RR2;
	wire isRR1, isRR2;
	wire WRS_isRR1, WRS_isRR2;
	wire stall_intermediate_1, stall_intermediate_2;
	
	wire [4:0] w_reg_sel; // The register that the instruction farther down the pipeline will write to.
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // write register for the instruction farther down the pipeline from the control signal.
	assign w_reg_sel = InstructionInDecode[11:7];

	// Check if the register that the instruction farther down the pipeline will write to the register that the instruction in fetch needs to read.
	assign WRS_RR1 = (ReadReg1InFetch == w_reg_sel);
	assign WRS_RR2 = (ReadReg2InFetch == w_reg_sel);
	
	// Check if the instruction in fetch is actually going to read R1 or R2 based on the opcode of the instruction. 
	assign isRR1 = ~(InstructionInFetch[6:0] == LUI_opcode_hex | InstructionInFetch[6:0] == AUIPC_opcode_hex | InstructionInFetch[6:0] == JAL_opcode_hex | InstructionInFetch == NOP_INSTR_HEX);
			// All need to read register 1 except LUI, AUIPC, JAL, and NOP

	assign isRR2 = InstructionInFetch[6:0] == BRANCH_opcode | InstructionInFetch[6:0] == SW_opcode | InstructionInFetch[6:0] == ALU_op_not_shift_opcode;
			// Only branch, store, and arithemtic (but not shift) instructions need source register 2.
	

	// There is only a RAW hazard if the register number matches between the instructions and the type of the instruction in fetch actually needs to read the value.
	assign WRS_isRR1 = WRS_RR1 & isRR1;
	assign WRS_isRR2 = WRS_RR2 & isRR2;
	
	// we will have to stall if there is a conflict for either register result 1 or 2.
	assign stall_intermediate_1 = WRS_isRR1 | WRS_isRR2;
	
	// We only have to stall if the instruction farther down the pipeline is actually writing to the destination register
	// 		// AND the instruction in decode is reading from memory.
	assign stall_intermediate_2 = stall_intermediate_1 & RegWriteEnableInDecode & MemReadInDecode;
	
	
	wire load_in_decode, store_in_fetch;
	// Check if the instruction in decode is a Load
	assign load_in_decode = InstructionInDecode[6:0] == LOAD_opcode;
	
	// Check if the instruction in fetch is a Store
	assign store_in_fetch = InstructionInFetch[6:0] == SW_opcode;

	// don't stall if we can use M->M forwarding.
	wire store_uses_load_rst_as_addr;
	
	assign store_uses_load_rst_as_addr = InstructionInFetch[10:8]==InstructionInDecode[11:7];
	
	assign stall = stall_intermediate_2 & (~(load_in_decode & store_in_fetch & (InstructionInFetch[24:20]==InstructionInDecode[11:7]) ));
	

endmodule
`default_nettype wire
