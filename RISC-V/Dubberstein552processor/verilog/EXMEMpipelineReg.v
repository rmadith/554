/*
    CS/ECE 552 Spring '23
    Eric Dubberstein
    Joash Shankar
*/
`default_nettype none
module EXMEMpipelineReg(
	clk, rst, err, Flush, Stall_disable,
	// inputs
	RegWriteEnable_IDEX_EXMEM,
	WriteRegSel_IDEX_EXMEM, Instruction_IDEX_EXMEM, PCplus2_IDEX_EXMEM, RegData2_EXMEM_in, 
	SavePC_IDEX_EXMEM, MemToReg_IDEX_EXMEM, MemRead_IDEX_EXMEM, CreateDump_IDEX_EXMEM, 
	MemWrite_IDEX_EXMEM, execute_rst_EXMEM_in, Err_EXMEM_in,
	
	// outputs
	RegWriteEnable_EXMEM_MEMWB,
	WriteRegSel_EXMEM_MEMWB, Instruction_EXMEM_MEMWB, PCplus2_EXMEM_MEMWB, RegData2_EXMEM_out, 
	SavePC_EXMEM_MEMWB, MemToReg_EXMEM_MEMWB, MemRead_EXMEM_MEMWB, CreateDump_EXMEM_out, 
	MemWrite_EXMEM_out, execute_rst_EXMEM_MEMWB, Err_EXMEM_out
);
	input wire clk, rst, Flush, Stall_disable;
	output wire err;
	
	// pipeline signals
	input wire RegWriteEnable_IDEX_EXMEM, SavePC_IDEX_EXMEM, MemToReg_IDEX_EXMEM, MemRead_IDEX_EXMEM, 
				CreateDump_IDEX_EXMEM, MemWrite_IDEX_EXMEM, Err_EXMEM_in;
				
	output wire RegWriteEnable_EXMEM_MEMWB, SavePC_EXMEM_MEMWB, MemToReg_EXMEM_MEMWB, MemRead_EXMEM_MEMWB, 
				CreateDump_EXMEM_out, MemWrite_EXMEM_out, Err_EXMEM_out;
	
	input wire [1:0] WriteRegSel_IDEX_EXMEM;
	output wire [1:0] WriteRegSel_EXMEM_MEMWB;

	input wire [15:0] Instruction_IDEX_EXMEM, PCplus2_IDEX_EXMEM, RegData2_EXMEM_in, execute_rst_EXMEM_in;
	output wire [15:0] Instruction_EXMEM_MEMWB, PCplus2_EXMEM_MEMWB, RegData2_EXMEM_out, execute_rst_EXMEM_MEMWB;

	// disable if we need to stall the pipeline.
	wire enable;
	assign enable = ~Stall_disable;

	// internal error signals
	wire [13:0] err_internal;
	assign err = | err_internal; // an error on any individual module is an overall err.

	// also reset if we have a flush as long as we're not also disabling the pipeline FFs.
	wire rst_f;
	assign rst_f = rst | (Flush & (~Stall_disable));
	
	// set the instruction to NOP if we have a flush.
	wire [15:0] next_instruction_val;
	assign next_instruction_val = (Flush) ? 16'b0000100000000000 : Instruction_IDEX_EXMEM;

	// pipeline registers
	nBitRegister #(.N(1)) RegWriteEnable (.D_O(RegWriteEnable_EXMEM_MEMWB), .err(err_internal[0]), .clk(clk), .rst(rst_f), .D(RegWriteEnable_IDEX_EXMEM), .C(enable));
	nBitRegister #(.N(2)) WriteRegSel (.D_O(WriteRegSel_EXMEM_MEMWB), .err(err_internal[1]), .clk(clk), .rst(rst_f), .D(WriteRegSel_IDEX_EXMEM), .C(enable));
	
	// We will use the normal rst signal for this register since we want to insert a NOP on a flush.
	nBitRegister #(.N(16)) Instruction (.D_O(Instruction_EXMEM_MEMWB), .err(err_internal[2]), .clk(clk), .rst(rst), .D(next_instruction_val), .C(enable));
	
	nBitRegister #(.N(16)) PCplus2 (.D_O(PCplus2_EXMEM_MEMWB), .err(err_internal[3]), .clk(clk), .rst(rst_f), .D(PCplus2_IDEX_EXMEM), .C(enable));
	nBitRegister #(.N(16)) RegData2 (.D_O(RegData2_EXMEM_out), .err(err_internal[4]), .clk(clk), .rst(rst_f), .D(RegData2_EXMEM_in), .C(enable));
	nBitRegister #(.N(1)) SavePC (.D_O(SavePC_EXMEM_MEMWB), .err(err_internal[5]), .clk(clk), .rst(rst_f), .D(SavePC_IDEX_EXMEM), .C(enable));
	nBitRegister #(.N(1)) MemToReg (.D_O(MemToReg_EXMEM_MEMWB), .err(err_internal[6]), .clk(clk), .rst(rst_f), .D(MemToReg_IDEX_EXMEM), .C(enable));
	
	
	nBitRegister #(.N(1)) CreateDump (.D_O(CreateDump_EXMEM_out), .err(err_internal[8]), .clk(clk), .rst(rst_f), .D(CreateDump_IDEX_EXMEM), .C(enable));
	
	//  
	nBitRegister #(.N(1)) MemRead (.D_O(MemRead_EXMEM_MEMWB), .err(err_internal[7]), .clk(clk), .rst(rst_f), .D(MemToReg_IDEX_EXMEM), .C(enable));
	nBitRegister #(.N(1)) MemWrite (.D_O(MemWrite_EXMEM_out), .err(err_internal[9]), .clk(clk), .rst(rst_f), .D(MemWrite_IDEX_EXMEM), .C(enable));
	
	nBitRegister #(.N(16)) execute_rst (.D_O(execute_rst_EXMEM_MEMWB), .err(err_internal[10]), .clk(clk), .rst(rst_f), .D(execute_rst_EXMEM_in), .C(enable));
	
	nBitRegister #(.N(1)) err_piped (.D_O(Err_EXMEM_out), .err(err_internal[13]), .clk(clk), .rst(rst_f), .D(Err_EXMEM_in), .C(enable));

endmodule
`default_nettype wire