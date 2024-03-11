/*
    CS/ECE 552 Spring '23
	Eric Dubberstein
	Joash Shankar
*/
`default_nettype none
module IFIDpipelineReg(
	// Inputs
	clk, rst, Flush,
	CreateDump_IFID_in, PCplus2_IFID_in, Instruction_IFID_in, Err_IFID_in, Stall_disable,
	
	// Outputs
	CreateDump_IFID_IDEX, PCplus2_IFID_IDEX, Instruction_IFID_IDEX, Err_IFID_out,
	err
);

	input wire clk, rst;
	input wire Flush; // NOTE: Flushing is same thing as inserting a NOP.
	input wire Stall_disable;
	
	output wire err;

	// Pipelined signals
	input wire CreateDump_IFID_in, Err_IFID_in;
	input wire [15:0] PCplus2_IFID_in, Instruction_IFID_in;

	output wire CreateDump_IFID_IDEX, Err_IFID_out;
	output wire [15:0] PCplus2_IFID_IDEX, Instruction_IFID_IDEX;

	// declare internal error signals
	wire instruction_err, PC_plus_2_err, CreateDump_err;
	
	// also reset if we have a flush as long as we're not also disabling the pipeline FFs.
	wire rst_f;
	assign rst_f = rst | (Flush & (~Stall_disable));
	
	// If we need to insert a NOP (also when we flush), set the input to the instruction register to the NOP instruction and the CreateDump to zero. 
	wire [15:0] next_instruction_val;
	assign next_instruction_val = (Flush) ? 16'b0000100000000000 : Instruction_IFID_in;
	
	// disable if we need to stall the pipeline.
	wire enable;
	assign enable = ~Stall_disable;

	// We will use the normal rst signal for this register since we want to insert a NOP on a flush.
	nBitRegister #(.N(16)) instruction (.D_O(Instruction_IFID_IDEX), .err(instruction_err), .clk(clk), .rst(rst), .D(next_instruction_val), .C(enable));
	
	// use normal reset for PC_plus_2 because we never want to force this value to zero. It may be used in a branch later on.
	nBitRegister #(.N(16)) PC_plus_2 (.D_O(PCplus2_IFID_IDEX), .err(PC_plus_2_err), .clk(clk), .rst(rst), .D(PCplus2_IFID_in), .C(enable));
	
	nBitRegister #(.N(1)) CreateDump (.D_O(CreateDump_IFID_IDEX), .err(CreateDump_err), .clk(clk), .rst(rst_f), .D(CreateDump_IFID_in), .C(enable));
	nBitRegister #(.N(1)) err_pipelined (.D_O(Err_IFID_out), .err(), .clk(clk), .rst(rst_f), .D(Err_IFID_in), .C(enable));
	
	

endmodule
`default_nettype wire