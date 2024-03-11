/*
    CS/ECE 552 Spring '23
    Eric Dubberstein
    Joash Shankar
*/
`default_nettype none
module CheckForControlToUse(
	// inputs
	InstructionInFetch, ReadReg1InFetch, InstructionDownPipeline, WriteRegSelDownPipeline, RegWriteEnableDownPipeline, 
	// outputs
	stall
);

	/// Inputs/ outputs ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	input wire [15:0] InstructionInFetch; // The instruction that is currently in the fetch stage.
	input wire [2:0] ReadReg1InFetch; // The two registers that need to be read for the instruction that is in the fetch stage.
	
	input wire [15:0] InstructionDownPipeline; // The instruction in a later phase that we are checking for a RAW dependency against.
	input wire RegWriteEnableDownPipeline; // is the instruction in a later phase writing to a register?
	input wire [1:0] WriteRegSelDownPipeline; // The register that is being written to for the instruction in a later phase.
	
	output wire stall; // the result if we need to stall (i.e. is there a RAW?)
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	parameter return_addr_reg = 3'h7;
	
	parameter load_to_branch_case = 1'b0;

	// Declare internal nets///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	wire WRS_RR1;
	wire isBranchInstruction;
	wire stall_intermediate_1;
	wire stall_intermediate_2;
	
	wire [2:0] w_reg_sel; // The register that the instruction farther down the pipeline will write to.
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // mux logic for determining write register for the instruction farther down the pipeline from the control signal.
	assign w_reg_sel = WriteRegSelDownPipeline==2'b00 ? InstructionDownPipeline[7:5] :
						WriteRegSelDownPipeline==2'b01 ? InstructionDownPipeline[4:2] :
						WriteRegSelDownPipeline==2'b10 ? InstructionDownPipeline[10:8] : return_addr_reg;

	// Check if the register that the instruction farther down the pipeline will write to the register that the instruction in fetch needs to read.
	assign WRS_RR1 = (ReadReg1InFetch == w_reg_sel);
	
	// Check if the instruction in fetch is a branch instruction (or jump instruction)
	assign isBranchInstruction = ((~InstructionInFetch[15]) & InstructionInFetch[14] & InstructionInFetch[13]) |
									( (~InstructionInFetch[15]) & (~InstructionInFetch[14]) & InstructionInFetch[13] );
	// There is only a RAW hazard if the register number matches between the instructions and the type of the instruction in fetch actually needs to read the value.
	assign stall_intermediate_1 = WRS_RR1 & isBranchInstruction;
	
	// We only have to stall if the instruction farther down the pipeline is actually writing to the destination register.
	assign stall_intermediate_2 = stall_intermediate_1 & RegWriteEnableDownPipeline;
	
	// For the case that we are trying to detect load to branch stalls, we need to make sure that the instruction farther down the pipeline is a load.
	assign stall = load_to_branch_case ? 
	
			// Is instruction a load?
			( InstructionDownPipeline[15] & (~InstructionDownPipeline[14]) & (~InstructionDownPipeline[13]) & (~InstructionDownPipeline[12]) & InstructionDownPipeline[11])  
			& stall_intermediate_2
			
			: stall_intermediate_2;

endmodule
`default_nettype wire
