/*
    CS/ECE 552 Spring '23
    Eric Dubberstein
    Joash Shankar
*/
`default_nettype none
module IDEXpipelineReg(
	clk, rst, err, Flush, Stall_disable,
	// inputs
	RegWriteEnable_IDEX_in, WriteRegSel_IDEX_in, Instruction_IFID_IDEX, 
	CreateDump_IFID_IDEX, MemToReg_IDEX_in, SavePC_IDEX_in, MemWrite_IDEX_in, 
	MemRead_IDEX_in, PCplus2_IFID_IDEX, SetDataZero_IDEX_in, 
	SLData8_IDEX_in, RegData1_IDEX_in, ALUSrcB_IDEX_in, RegData2_IDEX_in, 
	ReverseOp_IDEX_in, CompareOp_IDEX_in, sext_imm_IDEX_in, Err_IDEX_in,
	takeBranch_IDEX_in, BranchPC_IDEX_in,
	
	// outputs
	RegWriteEnable_IDEX_EXMEM, WriteRegSel_IDEX_EXMEM, Instruction_IDEX_EXMEM, 
	CreateDump_IDEX_EXMEM, MemToReg_IDEX_EXMEM, SavePC_IDEX_EXMEM, MemWrite_IDEX_EXMEM, 
	MemRead_IDEX_EXMEM, PCplus2_IDEX_EXMEM, SetDataZero_IDEX_out, 
	SLData8_IDEX_out, RegData1_IDEX_out, ALUSrcB_IDEX_out, RegData2_IDEX_EXMEM, 
	ReverseOp_IDEX_out, CompareOp_IDEX_out, sext_imm_IDEX_out, Err_IDEX_out,
	takeBranch_IDEX_out, BranchPC_IDEX_out
);

	input wire clk, rst, Flush, Stall_disable;
	output wire err;

	// pipelined signals
	input wire RegWriteEnable_IDEX_in, CreateDump_IFID_IDEX, MemToReg_IDEX_in, SavePC_IDEX_in, MemWrite_IDEX_in, 
		MemRead_IDEX_in, SetDataZero_IDEX_in, SLData8_IDEX_in, ALUSrcB_IDEX_in, 
		ReverseOp_IDEX_in, CompareOp_IDEX_in, Err_IDEX_in, takeBranch_IDEX_in;
		
	output wire RegWriteEnable_IDEX_EXMEM, CreateDump_IDEX_EXMEM, MemToReg_IDEX_EXMEM, SavePC_IDEX_EXMEM, MemWrite_IDEX_EXMEM, 
		MemRead_IDEX_EXMEM, SetDataZero_IDEX_out, SLData8_IDEX_out, ALUSrcB_IDEX_out, 
		ReverseOp_IDEX_out, CompareOp_IDEX_out, Err_IDEX_out, takeBranch_IDEX_out;

	input wire [1:0] WriteRegSel_IDEX_in;
	output wire [1:0] WriteRegSel_IDEX_EXMEM;
	
	input wire [15:0] Instruction_IFID_IDEX, PCplus2_IFID_IDEX, RegData1_IDEX_in, RegData2_IDEX_in, sext_imm_IDEX_in, BranchPC_IDEX_in;
	output wire [15:0] Instruction_IDEX_EXMEM, PCplus2_IDEX_EXMEM, RegData1_IDEX_out, RegData2_IDEX_EXMEM, sext_imm_IDEX_out, BranchPC_IDEX_out;

	// internal error signals
	wire [20:0] err_internal;
	assign err = | err_internal; // an error on any individual module is an overall err.

	// also reset if we have a flush as long as we're not also disabling the pipeline FFs.
	wire rst_f;
	assign rst_f = rst | (Flush & (~Stall_disable));
	
	// set the instruction to NOP if we have a flush.
	wire [15:0] next_instruction_val;
	assign next_instruction_val = (Flush) ? 16'b0000100000000000 : Instruction_IFID_IDEX;
	
	// disable if we need to stall the pipeline.
	wire enable;
	assign enable = ~Stall_disable;
	
	// Pipeline registers
	nBitRegister #(.N(1)) RegWriteEnable (.D_O(RegWriteEnable_IDEX_EXMEM), .err(err_internal[0]), .clk(clk), .rst(rst_f), .D(RegWriteEnable_IDEX_in), .C(enable));
	nBitRegister #(.N(2)) WriteRegSel (.D_O(WriteRegSel_IDEX_EXMEM), .err(err_internal[1]), .clk(clk), .rst(rst_f), .D(WriteRegSel_IDEX_in), .C(enable));
	
	// We will use the normal rst signal for this register since we want to insert a NOP on a flush.
	nBitRegister #(.N(16)) Instruction (.D_O(Instruction_IDEX_EXMEM), .err(err_internal[2]), .clk(clk), .rst(rst), .D(next_instruction_val), .C(enable));
	
	
	nBitRegister #(.N(1)) CreateDump (.D_O(CreateDump_IDEX_EXMEM), .err(err_internal[3]), .clk(clk), .rst(rst_f), .D(CreateDump_IFID_IDEX), .C(enable));
	nBitRegister #(.N(1)) MemToReg (.D_O(MemToReg_IDEX_EXMEM), .err(err_internal[4]), .clk(clk), .rst(rst_f), .D(MemToReg_IDEX_in), .C(enable));
	nBitRegister #(.N(1)) SavePC (.D_O(SavePC_IDEX_EXMEM), .err(err_internal[5]), .clk(clk), .rst(rst_f), .D(SavePC_IDEX_in), .C(enable));
	nBitRegister #(.N(1)) MemWrite (.D_O(MemWrite_IDEX_EXMEM), .err(err_internal[6]), .clk(clk), .rst(rst_f), .D(MemWrite_IDEX_in), .C(enable));
	nBitRegister #(.N(1)) MemRead (.D_O(MemRead_IDEX_EXMEM), .err(err_internal[7]), .clk(clk), .rst(rst_f), .D(MemRead_IDEX_in), .C(enable));
	nBitRegister #(.N(16)) PCPlus2 (.D_O(PCplus2_IDEX_EXMEM), .err(err_internal[8]), .clk(clk), .rst(rst_f), .D(PCplus2_IFID_IDEX), .C(enable));
	nBitRegister #(.N(1)) SetDataZero (.D_O(SetDataZero_IDEX_out), .err(err_internal[10]), .clk(clk), .rst(rst_f), .D(SetDataZero_IDEX_in), .C(enable));
	nBitRegister #(.N(1)) SLData8 (.D_O(SLData8_IDEX_out), .err(err_internal[11]), .clk(clk), .rst(rst_f), .D(SLData8_IDEX_in), .C(enable));
	nBitRegister #(.N(16)) RegData1 (.D_O(RegData1_IDEX_out), .err(err_internal[12]), .clk(clk), .rst(rst_f), .D(RegData1_IDEX_in), .C(enable));
	nBitRegister #(.N(1)) ALUSrcB (.D_O(ALUSrcB_IDEX_out), .err(err_internal[13]), .clk(clk), .rst(rst_f), .D(ALUSrcB_IDEX_in), .C(enable));
	nBitRegister #(.N(16)) RegData2 (.D_O(RegData2_IDEX_EXMEM), .err(err_internal[14]), .clk(clk), .rst(rst_f), .D(RegData2_IDEX_in), .C(enable));
	nBitRegister #(.N(1)) ReverseOp (.D_O(ReverseOp_IDEX_out), .err(err_internal[15]), .clk(clk), .rst(rst_f), .D(ReverseOp_IDEX_in), .C(enable));
	nBitRegister #(.N(1)) CompareOp (.D_O(CompareOp_IDEX_out), .err(err_internal[16]), .clk(clk), .rst(rst_f), .D(CompareOp_IDEX_in), .C(enable));
	nBitRegister #(.N(16)) sext_imm (.D_O(sext_imm_IDEX_out), .err(err_internal[17]), .clk(clk), .rst(rst_f), .D(sext_imm_IDEX_in), .C(enable));
	nBitRegister #(.N(1)) err_piped (.D_O(Err_IDEX_out), .err(err_internal[18]), .clk(clk), .rst(rst_f), .D(Err_IDEX_in), .C(enable));
	
	nBitRegister #(.N(1)) takeBranch (.D_O(takeBranch_IDEX_out), .err(err_internal[19]), .clk(clk), .rst(rst_f), .D(takeBranch_IDEX_in), .C(enable));
	nBitRegister #(.N(16)) BranchPC (.D_O(BranchPC_IDEX_out), .err(err_internal[20]), .clk(clk), .rst(rst_f), .D(BranchPC_IDEX_in), .C(enable));

endmodule
`default_nettype wire

