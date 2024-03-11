/*
    CS/ECE 552 Spring '23
    Eric Dubberstein
    Joash Shankar
*/
`default_nettype none
module HazardDetection(
	// inputs
	Instruction_IFID_in, RegWriteEnable_IDEX_EXMEM, WriteRegSel_IDEX_EXMEM,
	RegWriteEnable_IDEX_in, WriteRegSel_IDEX_in, Instruction_IDEX_EXMEM, Instruction_IFID_IDEX,
	MemRead_IDEX_in,
	TakeBranch_from_D, InstructionMemNotDone, DataMemStall, InstructionMemStall, CreateDump_IFID_in,
	
	// outputs
	PC_enable, 
	Flush_IFID, Stall_disable_IFID,
	Flush_IDEX, Stall_disable_IDEX,
	Flush_EXMEM, Stall_disable_EXMEM,
	Flush_MEMWB, Stall_disable_MEMWB
	
);

	// Pipelined signals
	input wire [15:0] Instruction_IFID_in; // The instruction that is currently in the fetch stage.
	input wire MemRead_IDEX_in;
	input wire CreateDump_IFID_in;

	// The signals from the instructions that are currently in the EX and MEM stages.
	input wire [15:0] Instruction_IDEX_EXMEM, Instruction_IFID_IDEX; 
	input wire [1:0] WriteRegSel_IDEX_EXMEM, WriteRegSel_IDEX_in;
	input wire RegWriteEnable_IDEX_EXMEM, RegWriteEnable_IDEX_in;
	
	// The signal that is asserted when the later pipeline stage says that the branch should be taken.
	input wire TakeBranch_from_D; 
	
	input wire InstructionMemNotDone;
	input wire InstructionMemStall;
	input wire DataMemStall;

	output wire PC_enable; // goes directly to the enable of the PC
	
	// Flush. For the specific pipeline register (E.g. IDEX, MEMWB, etc.), set the current value in the instruction 
	//			pipeline register to be NOP and reset syncrhonously the rest of the pipeline registers.
	
	// Stall_disable. The enable for all pipeline registers in the specificed block is tied to ~Stall_disable for that
	//			block.
	output wire Flush_IFID, Stall_disable_IFID;
	output wire Flush_IDEX, Stall_disable_IDEX;
	output wire Flush_EXMEM, Stall_disable_EXMEM;
	output wire Flush_MEMWB, Stall_disable_MEMWB;
	
	
	// Check for RAW hazards between the current instruction and the instruction in EX and the instruction in MEM. //////////////
	
	// result for if we need to stall due to RAW hazard for each stage.
	wire stall_load_to_use, stall_aluOp_to_Branch, stall_load_to_Branch;
	
	
	CheckForLoadToUse check_for_load_to_use(
		// inputs
		.InstructionInFetch(Instruction_IFID_in), .ReadReg1InFetch(Instruction_IFID_in[10:8]), .ReadReg2InFetch(Instruction_IFID_in[7:5]), 
		.InstructionInDecode(Instruction_IFID_IDEX), .WriteRegSelInDecode(WriteRegSel_IDEX_in), .RegWriteEnableInDecode(RegWriteEnable_IDEX_in), 
		.MemReadInDecode(MemRead_IDEX_in),
		// outputs
		.stall(stall_load_to_use)
	);
	
	CheckForControlToUse #(0) check_for_alu_op_to_branch(
		// inputs
		.InstructionInFetch(Instruction_IFID_in), .ReadReg1InFetch(Instruction_IFID_in[10:8]), 
		.InstructionDownPipeline(Instruction_IFID_IDEX), .WriteRegSelDownPipeline(WriteRegSel_IDEX_in), .RegWriteEnableDownPipeline(RegWriteEnable_IDEX_in), 
		// outputs
		.stall(stall_aluOp_to_Branch)
	);
	
	CheckForControlToUse #(1) check_for_load_to_branch(
		// inputs
		.InstructionInFetch(Instruction_IFID_in), .ReadReg1InFetch(Instruction_IFID_in[10:8]), 
		.InstructionDownPipeline(Instruction_IDEX_EXMEM), .WriteRegSelDownPipeline(WriteRegSel_IDEX_EXMEM), .RegWriteEnableDownPipeline(RegWriteEnable_IDEX_EXMEM), 
		// outputs
		.stall(stall_load_to_Branch)
	);
	
	
	
	// We need to stall (stop incrementing PC) if there is a RAW betweesn either set of instructions or if the instruction or data memory needs a stall.
	wire stall;
	assign stall = stall_load_to_use | stall_aluOp_to_Branch | stall_load_to_Branch | InstructionMemNotDone | DataMemStall;
	
	// We need to detect the case when we are supposed to take the branch while the instruction memory is still in progress.
	wire branchAttemptDurringIMStall = (TakeBranch_from_D & InstructionMemNotDone);
	
	// The branch is successful if the branch result is still true and the instruction memory is ready. 
	// 		The instruction memory is ready if the done signal is asserted.
	wire successfulBranchAttempt;
	assign successfulBranchAttempt = TakeBranch_from_D & ~InstructionMemNotDone;
	
	assign PC_enable = successfulBranchAttempt | ~(stall | CreateDump_IFID_in);
	
	// Tell each pipeline register whether it should flush and/or stall.
	assign Flush_IFID = successfulBranchAttempt | stall;
	assign Stall_disable_IFID = DataMemStall | branchAttemptDurringIMStall;
	
	assign Flush_IDEX = successfulBranchAttempt;
	assign Stall_disable_IDEX = DataMemStall | branchAttemptDurringIMStall;
	
	assign Flush_EXMEM = 1'b0;
	assign Stall_disable_EXMEM = DataMemStall | branchAttemptDurringIMStall;
	
	assign Flush_MEMWB = 1'b0;
	assign Stall_disable_MEMWB = DataMemStall | branchAttemptDurringIMStall;
	
endmodule
`default_nettype wire
