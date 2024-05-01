 /*
    CS/ECE 554 Spring '24
    Eric Dubberstein
*/
`default_nettype none
module HazardDetection(
	input wire [31:0] Instruction_IFID_in, // The instruction that is currently in the fetch stage.
	input wire MemRead_IDEX_in,
	input wire ECALL_IFID_in,

	// The signals from the instructions that are currently in the EX and MEM stages.
	input wire [31:0] Instruction_IDEX_EXMEM, 
	input wire [31:0] Instruction_IFID_IDEX, 
	input wire RegWriteEnable_IDEX_EXMEM, 
	input wire RegWriteEnable_IDEX_in,
	
	// The signal that is asserted when the later pipeline stage says that the branch should be taken.
	input wire TakeBranch_from_D,
	input wire jump,
	input wire branch,

	// signal used for detecting if an incorret branch prediction
	input wire predict_branch_taken_ID,

	output wire incorrect_b_prediction,
	output wire PC_enable, // goes directly to the enable of the PC
	
	// Flush. For the specific pipeline register (E.g. IDEX, MEMWB, etc.), set the current value in the instruction 
	//			pipeline register to be NOP and reset syncrhonously the rest of the pipeline registers.
	
	// Stall_disable. The enable for all pipeline registers in the specificed block is tied to ~Stall_disable for that
	//			block.
	output wire Flush_IFID, 
	output wire Flush_IDEX, 
	output wire Flush_EXMEM, 
	output wire Flush_MEMWB

);
	
	// result for if we need to stall due to RAW hazard for each stage.
	logic stall_load_to_use, stall_aluOp_to_Branch, stall_load_to_Branch;
	
	CheckForLoadToUse check_for_load_to_use(
		// inputs
		.InstructionInFetch(Instruction_IFID_in), .ReadReg1InFetch(Instruction_IFID_in[19:15]), .ReadReg2InFetch(Instruction_IFID_in[24:20]), 
		.InstructionInDecode(Instruction_IFID_IDEX), .RegWriteEnableInDecode(RegWriteEnable_IDEX_in), 
		.MemReadInDecode(MemRead_IDEX_in),
		// outputs
		.stall(stall_load_to_use)
	);
	
	CheckForControlToUse #(0) check_for_alu_op_to_branch(
		// inputs
		.InstructionInFetch(Instruction_IFID_in), .ReadReg1InFetch(Instruction_IFID_in[19:15]), .ReadReg2InFetch(Instruction_IFID_in[24:20]), 
		.InstructionDownPipeline(Instruction_IFID_IDEX), .RegWriteEnableDownPipeline(RegWriteEnable_IDEX_in), 
		// outputs
		.stall(stall_aluOp_to_Branch)
	);
	
	CheckForControlToUse #(1) check_for_load_to_branch(
		// inputs
		.InstructionInFetch(Instruction_IFID_in), .ReadReg1InFetch(Instruction_IFID_in[19:15]), .ReadReg2InFetch(Instruction_IFID_in[24:20]), 
		.InstructionDownPipeline(Instruction_IDEX_EXMEM), .RegWriteEnableDownPipeline(RegWriteEnable_IDEX_EXMEM), 
		// outputs
		.stall(stall_load_to_Branch)
	);
	
	// since we're using predict not taken, if the branch is taken, we've made the incorrect prediction.
	assign incorrect_b_prediction = TakeBranch_from_D != predict_branch_taken_ID & (branch | jump);
	
	// We need to stall (stop incrementing PC) if there is a RAW between either set of instructions
	wire stall;
	assign stall = stall_load_to_use | stall_aluOp_to_Branch | stall_load_to_Branch;
	
	assign PC_enable = incorrect_b_prediction | ~(stall | ECALL_IFID_in);
	
	// Tell each pipeline register whether it should flush and/or stall.
	assign Flush_IFID = incorrect_b_prediction | stall; 
	
	assign Flush_IDEX = 1'b0;
	
	assign Flush_EXMEM = 1'b0;
	
	assign Flush_MEMWB = 1'b0;

	
endmodule
`default_nettype wire
