/*
    CS/ECE 552 Spring '23
    Eric Dubberstein
    Joash Shankar
*/
`default_nettype none

import common_def::*;

module CheckForControlToUse(
	// inputs
	InstructionInFetch, ReadReg1InFetch, ReadReg2InFetch, InstructionDownPipeline, RegWriteEnableDownPipeline, 
	// outputs
	stall
);

	/// Inputs/ outputs ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	input wire [31:0] InstructionInFetch; // The instruction that is currently in the fetch stage.
	input wire [4:0] ReadReg1InFetch; // The two registers that need to be read for the instruction that is in the fetch stage.
	input wire [4:0] ReadReg2InFetch;

	input wire [31:0] InstructionDownPipeline; // The instruction in a later phase that we are checking for a RAW dependency against.
	input wire RegWriteEnableDownPipeline; // is the instruction in a later phase writing to a register?
	
	output wire stall; // the result if we need to stall (i.e. is there a RAW?)
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// parameter is 1 when we're checking for load to branch hazard.
	parameter load_to_branch_case = 1'b0;

	// Declare internal nets///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	wire WRS_RR1, WRS_RR2;
	wire isBranchInstruction;
	wire stall_intermediate_1;
	wire stall_intermediate_2;
	
	wire [4:0] w_reg_sel; // The register that the instruction farther down the pipeline will write to.
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // mux logic for determining write register for the instruction farther down the pipeline from the control signal.
	assign w_reg_sel = InstructionDownPipeline[11:7];

	// Check if the register that the instruction farther down the pipeline will write to the register that the instruction in fetch needs to read.
	assign WRS_RR1 = (ReadReg1InFetch == w_reg_sel && (| w_reg_sel));
	assign WRS_RR2 = (ReadReg2InFetch == w_reg_sel && (| w_reg_sel));
	
	// Check if the instruction in fetch is a branch instruction (or jump instruction)
	assign isBranchInstruction = (InstructionInFetch[6:0] == BRANCH_opcode) | (InstructionInFetch[6:0] == JALR_opcode);

	// There is only a RAW hazard if the register number matches between the instructions and the type of the instruction in fetch actually needs to read the value.
	assign stall_intermediate_1 = (WRS_RR1 | WRS_RR2) & isBranchInstruction;
	
	// We only have to stall if the instruction farther down the pipeline is actually writing to the destination register.
	assign stall_intermediate_2 = stall_intermediate_1 & RegWriteEnableDownPipeline;
	
	// For the case that we are trying to detect load to branch stalls, we need to make sure that the instruction farther down the pipeline is a load.
	assign stall = load_to_branch_case ? ((InstructionDownPipeline[6:0] == LOAD_opcode) & stall_intermediate_2) : stall_intermediate_2;

endmodule
`default_nettype wire
