/*
   CS/ECE 552 Spring '22
  
   Filename        : decode.v
   Description     : This is the module for the overall decode stage of the processor.
*/
`default_nettype none
module decode 	(
				instruction, clk, rst, writebackData, Instruction_MEMWB_out, 
				WriteRegSel_MEMWB_out,SavePC, MemToReg, 
				MemRead, MemWrite, ALUSrcB, SetDataZero, SLData8, CompareOp, 
				ReverseOp, RegData1, RegData2, sext_imm, err, WriteRegSel_IDEX_in, 
				RegWriteEnable_IDEX_in, RegWriteEnable_MEMWB_out, PCplus2, BranchPC_IDEX_in,
				takeBranch_IDEX_in, RegData1_after_forward_D
				);

	parameter N = 16;
	parameter return_addr_reg = 3'h7;
	
	// Inputs and outputs //////////////////////////////////////////////////////////////
	// inputs
	input wire clk, rst;
	
	input wire [N-1:0] instruction;
	
	input wire [N-1:0] writebackData; // data from WB stage
	input wire [N-1:0] Instruction_MEMWB_out; // instruction for WB stage
	input wire [1:0] WriteRegSel_MEMWB_out; // write reg sel for WB stage
	input wire RegWriteEnable_MEMWB_out; // reg write enable for WB stage
	input wire [15:0] PCplus2;
	input wire [15:0] RegData1_after_forward_D;
	
	// control signal outputs
	output wire SavePC;
	output wire MemToReg;
	output wire MemRead;
	output wire MemWrite;
	output wire ALUSrcB;
	output wire SetDataZero;
	output wire SLData8;
	output wire CompareOp;
	output wire ReverseOp;
	output wire [1:0] WriteRegSel_IDEX_in;
	output wire RegWriteEnable_IDEX_in;
	
	// data outputs
	output wire [N-1:0] RegData1;
	output wire [N-1:0] RegData2;
	output wire [N-1:0] sext_imm;
	output wire [N-1:0] BranchPC_IDEX_in;
	output wire takeBranch_IDEX_in;
	
	output wire err;
	////////////////////////////////////////////////////////////////////////////////////
	
	
	// Declare internal nets ////////////////////////////////////////////////////////////
	// Internal control signals
	wire [2:0] SextSel;
	
	wire [2:0] w_reg_sel;
	
	// sign extend results
	wire [N-1:0] imm5SE, imm5ZE, imm11SE, imm8SE, imm8ZE;
	
	wire err_regFile0;
	
	////////////////////////////////////////////////////////////////////////////////////
	
	
	// Branch Logic ////////////////////////////////////////////////////////////////////
	wire [N-1:0] ALU_b_in;
	wire OffsetSel;
	
	// mux to select offset for branch
	assign ALU_b_in = OffsetSel ? RegData1_after_forward_D : PCplus2;
	
	// instantiate cla to compute branch result
	cla16b iCLA(.sum(BranchPC_IDEX_in), .cOut(), .inA(ALU_b_in), .inB(sext_imm), .cIn(1'b0));
	
	// instantiate logic block to decide if the branch is taken.
	b_j_logic b_j_i (.opcode(instruction[15:11]), .RsVal(RegData1_after_forward_D), .takeBranch(takeBranch_IDEX_in));
	
	////////////////////////////////////////////////////////////////////////////////////
	
	
	// instantiate control module
	control control_instance(.opcode(instruction[15:11]), .SavePC(SavePC), .MemToReg(MemToReg),
								.MemRead(MemRead), .MemWrite(MemWrite), .ALUSrcB(ALUSrcB), 
								.SetDataZero(SetDataZero), .SLData8(SLData8), .OffsetSel(OffsetSel),
								.CompareOp(CompareOp), .ReverseOp(ReverseOp), .SextSel(SextSel), 
								.WriteRegSel(WriteRegSel_IDEX_in), .RegWriteEnable(RegWriteEnable_IDEX_in));
								
	// Instantiate register file
	rf_bypass regFile0 (
           // Outputs
           .read1OutData(RegData1), .read2OutData(RegData2), .err(err_regFile0),
           // Inputs
           .clk(clk), .rst(rst), .read1RegSel(instruction[10:8]), 
		   .read2RegSel(instruction[7:5]), .writeRegSel(w_reg_sel), 
		   .writeInData(writebackData), .writeEn(RegWriteEnable_MEMWB_out)
           );
	
	
	// 4:1 mux for writeback reg select
							
	assign w_reg_sel = 	WriteRegSel_MEMWB_out==2'b00 ? Instruction_MEMWB_out[7:5] :
						WriteRegSel_MEMWB_out==2'b01 ? Instruction_MEMWB_out[4:2] :
						WriteRegSel_MEMWB_out==2'b10 ? Instruction_MEMWB_out[10:8] : return_addr_reg;
							
	// sign extension
	//imm5SE, imm5ZE, imm11SE, imm8SE, imm8ZE;
	assign imm5SE = {{11{instruction[4]}}, instruction[4:0]};
	assign imm5ZE = {{11{1'b0}}, instruction[4:0]};
	
	assign imm11SE = {{5{instruction[10]}}, instruction[10:0]};
	
	assign imm8SE = {{8{instruction[7]}}, instruction[7:0]};
	assign imm8ZE = {{8{1'b0}}, instruction[7:0]};
	
	// mux for sign extension 
	imm_sel_mux i_imm_sel_mux(	.sel(SextSel), .in0(imm5SE), .in1(imm5ZE), .in2(imm11SE), 
								.in3(imm8SE), .in4(imm8ZE), .out(sext_imm));
								
	//Extra signals for TB ////////////////////////////////////
	wire write;
	assign write = RegWriteEnable_IDEX_in;
	
	wire [2:0] writeregsel;
	assign writeregsel = w_reg_sel;
	
	wire [N-1:0] writedata;
	assign writedata = writebackData;
	//////////////////////////////////////////////////////////
	
	assign err = (~(instruction===1 | instruction===0)) | (~(clk===1 | clk===0)) | (~(rst===1 | rst===0)) | (~(writebackData===1 | writebackData===0)) 
					| err_regFile0;
	
endmodule
`default_nettype wire
