/*
    CS/ECE 552 Spring '23
    Eric Dubberstein
    Joash Shankar
*/
`default_nettype none
module MEMWBpipelineReg (
	clk, rst, err, Flush, Stall_disable,
	// inputs
	RegWriteEnable_EXMEM_MEMWB, WriteRegSel_EXMEM_MEMWB, Instruction_EXMEM_MEMWB, 
	PCplus2_EXMEM_MEMWB, execute_rst_EXMEM_MEMWB, MemToReg_EXMEM_MEMWB, 
	SavePC_EXMEM_MEMWB, MemReadRst_MEMWB_in, Err_MEMWB_in, MemRead_EXMEM_MEMWB,
	
	// outputs
	RegWriteEnable_MEMWB_out, WriteRegSel_MEMWB_out, Instruction_MEMWB_out, 
	PCplus2_MEMWB_out, execute_rst_MEMWB_out, MemToReg_MEMWB_out, SavePC_MEMWB_out, 
	MemReadRst_MEMWB_out, Err_MEMWB_out, MemRead_MEMWB_out
);

	input wire clk, rst, Flush, Stall_disable;
	output wire err;
	
	// pipeline signals
	input wire RegWriteEnable_EXMEM_MEMWB, MemToReg_EXMEM_MEMWB, SavePC_EXMEM_MEMWB, Err_MEMWB_in, MemRead_EXMEM_MEMWB;
	output wire RegWriteEnable_MEMWB_out, MemToReg_MEMWB_out, SavePC_MEMWB_out, Err_MEMWB_out, MemRead_MEMWB_out;
	
	input wire [1:0] WriteRegSel_EXMEM_MEMWB;
	output wire [1:0] WriteRegSel_MEMWB_out;

	input wire [15:0] Instruction_EXMEM_MEMWB, PCplus2_EXMEM_MEMWB, execute_rst_EXMEM_MEMWB, MemReadRst_MEMWB_in;
	output wire [15:0] Instruction_MEMWB_out, PCplus2_MEMWB_out, execute_rst_MEMWB_out, MemReadRst_MEMWB_out;
	
	// internal error signals
	wire [9:0] err_internal;
	assign err = | err_internal; // an error on any individual module is an overall err.

    // also reset if we have a flush as long as we're not also disabling the pipeline FFs.
    wire rst_f;
	assign rst_f = rst | (Flush & (~Stall_disable));

    // If we need to insert a NOP (aka flush), set the input to the instruction register to the NOP instruction.
	wire [15:0] next_instruction_val;
	assign next_instruction_val = Flush ? 16'b0000100000000000 : Instruction_EXMEM_MEMWB;
	
	// If we are stalling, set the output for reg write enable to zero since we don't want multiple writes to memory
	wire RegWriteEnable_MEMWB_out_inter;
	assign RegWriteEnable_MEMWB_out = RegWriteEnable_MEMWB_out_inter & ~Stall_disable;

	// disable if we need to stall the pipeline.
	wire enable;
	assign enable = ~Stall_disable;

	// pipeline registers /////////////
	
	// Use normal reset for instruction pipeline register //
	nBitRegister #(.N(16)) Instruction (.D_O(Instruction_MEMWB_out), .err(err_internal[2]), .clk(clk), .rst(rst), .D(next_instruction_val), .C(enable));
	
	// Use reset that is also triggered on flush for the rest of the registers.
	nBitRegister #(.N(1)) RegWriteEnable (.D_O(RegWriteEnable_MEMWB_out_inter), .err(err_internal[0]), .clk(clk), .rst(rst_f), .D(RegWriteEnable_EXMEM_MEMWB), .C(enable));
	nBitRegister #(.N(2)) WriteRegSel (.D_O(WriteRegSel_MEMWB_out), .err(err_internal[1]), .clk(clk), .rst(rst_f), .D(WriteRegSel_EXMEM_MEMWB), .C(enable));
	nBitRegister #(.N(16)) PCplus2 (.D_O(PCplus2_MEMWB_out), .err(err_internal[3]), .clk(clk), .rst(rst_f), .D(PCplus2_EXMEM_MEMWB), .C(enable));
	nBitRegister #(.N(16)) execute_rst (.D_O(execute_rst_MEMWB_out), .err(err_internal[4]), .clk(clk), .rst(rst_f), .D(execute_rst_EXMEM_MEMWB), .C(enable));
	nBitRegister #(.N(1)) MemToReg (.D_O(MemToReg_MEMWB_out), .err(err_internal[5]), .clk(clk), .rst(rst_f), .D(MemToReg_EXMEM_MEMWB), .C(enable));
	nBitRegister #(.N(1)) SavePC (.D_O(SavePC_MEMWB_out), .err(err_internal[6]), .clk(clk), .rst(rst_f), .D(SavePC_EXMEM_MEMWB), .C(enable));
	nBitRegister #(.N(16)) MemReadRst (.D_O(MemReadRst_MEMWB_out), .err(err_internal[7]), .clk(clk), .rst(rst_f), .D(MemReadRst_MEMWB_in), .C(enable));
	nBitRegister #(.N(1)) Err (.D_O(Err_MEMWB_out), .err(err_internal[8]), .clk(clk), .rst(rst_f), .D(Err_MEMWB_in), .C(enable));
	nBitRegister #(.N(1)) MemRead (.D_O(MemRead_MEMWB_out), .err(err_internal[9]), .clk(clk), .rst(rst_f), .D(MemRead_EXMEM_MEMWB), .C(enable));
	
	


endmodule
`default_nettype wire