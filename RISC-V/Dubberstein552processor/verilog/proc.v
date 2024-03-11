/* $Author: sinclair $ */
/* $LastChangedDate: 2020-02-09 17:03:45 -0600 (Sun, 09 Feb 2020) $ */
/* $Rev: 46 $ */
`default_nettype none
module proc (/*AUTOARG*/
   // Outputs
   err, 
   // Inputs
   clk, rst
   );

   input wire clk;
   input wire rst;

   output wire err;

   // None of the above lines can be modified

   // OR all the err ouputs for every sub-module and assign it as this
   // err output
   
   // As desribed in the homeworks, use the err signal to trap corner
   // cases that you think are illegal in your statemachines
   
   
   /* your code here -- should include instantiations of fetch, decode, execute, mem and wb modules */
   parameter N = 16;
   // Declare internal nets. Declarations are grouped by the output of each module. ///////////////////////////////   
   
	//fetch (outputs)
	wire CreateDump_IFID_in;
	wire [N-1:0] PCplus2_IFID_in;
	wire [N-1:0] Instruction_IFID_in;
	wire Err_IFID_in;
	wire InstructionMemNotDone;
	wire InstructionMemStall;

	
	//IFID pipeline reg (outputs)
	wire CreateDump_IFID_IDEX;
	wire [N-1:0] PCplus2_IFID_IDEX;
	wire [N-1:0] Instruction_IFID_IDEX;
	wire Err_IFID_IDEX;
	
	
	
	
	// decode (outputs)
	wire RegWriteEnable_IDEX_in;
	wire [1:0] WriteRegSel_IDEX_in;
	wire SavePC_IDEX_in;
	wire MemToReg_IDEX_in;
	wire MemRead_IDEX_in;
	wire MemWrite_IDEX_in;
	wire ALUSrcB_IDEX_in;
	wire SetDataZero_IDEX_in;
	wire SLData8_IDEX_in;
	wire CompareOp_IDEX_in;
	wire ReverseOp_IDEX_in;
	wire [N-1:0] RegData1_IDEX_in;
	wire [N-1:0] RegData2_IDEX_in;
	wire [N-1:0] sext_imm_IDEX_in;
	wire [N-1:0] BranchPC_IDEX_in;
	wire takeBranch_IDEX_in;
	
	wire err_decode;
	


	
	//IDEX pipeline reg (outputs)
	wire RegWriteEnable_IDEX_EXMEM;
	wire [1:0] WriteRegSel_IDEX_EXMEM;
	wire [N-1:0] Instruction_IDEX_EXMEM;
	wire CreateDump_IDEX_EXMEM;
	wire MemToReg_IDEX_EXMEM;
	wire SavePC_IDEX_EXMEM;
	wire MemWrite_IDEX_EXMEM;
	wire MemRead_IDEX_EXMEM;
	wire [N-1:0] PCplus2_IDEX_EXMEM;
	wire SetDataZero_IDEX_out;
	wire SLData8_IDEX_out;
	wire [N-1:0] RegData1_IDEX_out;
	wire ALUSrcB_IDEX_out;
	wire [N-1:0] RegData2_IDEX_EXMEM;
	wire ReverseOp_IDEX_out;
	wire CompareOp_IDEX_out;
	wire [N-1:0] sext_imm_IDEX_out;
	wire Err_IDEX_EXMEM;
	wire takeBranch_IDEX_out;
	wire [N-1:0] BranchPC_IDEX_out;
	
	wire err_IDEX_reg;
	

	
	// execute (outputs)
	wire [N-1:0] execute_rst_EXMEM_in;
	wire err_execute;
	
	
	
	//EXMEM pipeline reg (outputs)
	wire RegWriteEnable_EXMEM_MEMWB;
	wire [1:0] WriteRegSel_EXMEM_MEMWB;
	wire [N-1:0] Instruction_EXMEM_MEMWB;
	wire [N-1:0] PCplus2_EXMEM_MEMWB;
	wire [N-1:0] RegData2_EXMEM_out;
	wire SavePC_EXMEM_MEMWB;
	wire MemToReg_EXMEM_MEMWB;
	wire MemRead_EXMEM_MEMWB;
	wire CreateDump_EXMEM_out;
	wire MemWrite_EXMEM_out;
	wire [N-1:0] execute_rst_EXMEM_MEMWB;
	wire Err_EXMEM_out;
	wire err_EXMEM_reg;
	
	
	
	// memory (outputs)
	wire [N-1:0] MemReadRst_MEMWB_in;
	wire DataMemStall;
	wire err_memory;
	

	
	//MEMWB pipeline reg (outputs)
	wire RegWriteEnable_MEMWB_out;
	wire [1:0] WriteRegSel_MEMWB_out;
	wire [N-1:0] Instruction_MEMWB_out;
	wire [N-1:0] PCplus2_MEMWB_out;
	wire [N-1:0] execute_rst_MEMWB_out;
	wire MemToReg_MEMWB_out;
	wire SavePC_MEMWB_out;
	wire [N-1:0] MemReadRst_MEMWB_out;
	wire MemRead_MEMWB_out;
	wire Err_MEMWB_out;
	wire err_MEMWB_reg;
	
	// wb (outputs)
	wire [N-1:0] writebackData;
	wire err_wb;
	
	// hazard detection unit (outputs)
	wire PC_enable;
	wire Flush_IFID, Stall_disable_IFID;
	wire Flush_IDEX, Stall_disable_IDEX;
	wire Flush_EXMEM, Stall_disable_EXMEM;
	wire Flush_MEMWB, Stall_disable_MEMWB;
	
	// forwarding0 unit (outputs)
	wire [N-1:0] RegData1_after_forward;
	wire [N-1:0] RegData2_after_forward;
	
	// forwarding1 unit (outputs)
	wire [N-1:0] RegData1_after_forward_D;
	
	// forwarding2 unit (outputs)
	wire [N-1:0] RegData2_after_forward_M;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	// Instantiate the modules for each stage of (what will be) the pipeline ///////////////////////////
	
	
	fetch fetch0( 
					.clk(clk), .rst(rst), .BranchPC_EXMEM_out(BranchPC_IDEX_out), 
					.takeBranch_EXMEM_out(takeBranch_IDEX_out), .instructionIsHault(CreateDump_IFID_in),
					.PCplus2(PCplus2_IFID_in), .instruction(Instruction_IFID_in), .err(Err_IFID_in), .PC_enable(PC_enable),
					.InstructionMemNotDone(InstructionMemNotDone), .InstructionMemStall(InstructionMemStall)
	);
				
	IFIDpipelineReg IFIDpipelineReg0(
		.clk(clk), .rst(rst), .err(), .Flush(Flush_IFID),
		.CreateDump_IFID_in(CreateDump_IFID_in), .PCplus2_IFID_in(PCplus2_IFID_in), .Instruction_IFID_in(Instruction_IFID_in),
		.CreateDump_IFID_IDEX(CreateDump_IFID_IDEX), .PCplus2_IFID_IDEX(PCplus2_IFID_IDEX), .Instruction_IFID_IDEX(Instruction_IFID_IDEX),
		.Err_IFID_in(Err_IFID_in), .Err_IFID_out(Err_IFID_IDEX), .Stall_disable(Stall_disable_IFID)
	);
	
	
	decode decode0(
				.instruction(Instruction_IFID_IDEX), .clk(clk), .rst(rst), .writebackData(writebackData), 
				.Instruction_MEMWB_out(Instruction_MEMWB_out), .WriteRegSel_MEMWB_out(WriteRegSel_MEMWB_out),
				.SavePC(SavePC_IDEX_in), .MemToReg(MemToReg_IDEX_in), .MemRead(MemRead_IDEX_in), .MemWrite(MemWrite_IDEX_in), 
				.ALUSrcB(ALUSrcB_IDEX_in), .SetDataZero(SetDataZero_IDEX_in), .SLData8(SLData8_IDEX_in), 
				.CompareOp(CompareOp_IDEX_in), .ReverseOp(ReverseOp_IDEX_in), 
				.RegData1(RegData1_IDEX_in), .RegData2(RegData2_IDEX_in), .sext_imm(sext_imm_IDEX_in), .err(err_decode),
				.WriteRegSel_IDEX_in(WriteRegSel_IDEX_in), .RegWriteEnable_IDEX_in(RegWriteEnable_IDEX_in),
				.RegWriteEnable_MEMWB_out(RegWriteEnable_MEMWB_out), .PCplus2(PCplus2_IFID_IDEX), .BranchPC_IDEX_in(BranchPC_IDEX_in),
				.takeBranch_IDEX_in(takeBranch_IDEX_in), .RegData1_after_forward_D(RegData1_after_forward_D)
	);
				
	IDEXpipelineReg IDEXpipelineReg0(
		.clk(clk), .rst(rst), .err(err_IDEX_reg), .Flush(Flush_IDEX), .Stall_disable(Stall_disable_IDEX),
		// inputs
		.WriteRegSel_IDEX_in(WriteRegSel_IDEX_in), .Instruction_IFID_IDEX(Instruction_IFID_IDEX), .CreateDump_IFID_IDEX(CreateDump_IFID_IDEX), 
		.MemToReg_IDEX_in(MemToReg_IDEX_in), .SavePC_IDEX_in(SavePC_IDEX_in), .MemWrite_IDEX_in(MemWrite_IDEX_in), .MemRead_IDEX_in(MemRead_IDEX_in), 
		.PCplus2_IFID_IDEX(PCplus2_IFID_IDEX), .SetDataZero_IDEX_in(SetDataZero_IDEX_in), .SLData8_IDEX_in(SLData8_IDEX_in), 
		.RegData1_IDEX_in(RegData1_IDEX_in), .ALUSrcB_IDEX_in(ALUSrcB_IDEX_in), .RegData2_IDEX_in(RegData2_IDEX_in), 
		.ReverseOp_IDEX_in(ReverseOp_IDEX_in), .CompareOp_IDEX_in(CompareOp_IDEX_in), .sext_imm_IDEX_in(sext_imm_IDEX_in),
		.RegWriteEnable_IDEX_in(RegWriteEnable_IDEX_in), .Err_IDEX_in(Err_IFID_IDEX), 
		.takeBranch_IDEX_in(takeBranch_IDEX_in), .BranchPC_IDEX_in(BranchPC_IDEX_in),
		// outputs
		.RegWriteEnable_IDEX_EXMEM(RegWriteEnable_IDEX_EXMEM),
		.WriteRegSel_IDEX_EXMEM(WriteRegSel_IDEX_EXMEM), .Instruction_IDEX_EXMEM(Instruction_IDEX_EXMEM), .CreateDump_IDEX_EXMEM(CreateDump_IDEX_EXMEM), 
		.MemToReg_IDEX_EXMEM(MemToReg_IDEX_EXMEM), .SavePC_IDEX_EXMEM(SavePC_IDEX_EXMEM), .MemWrite_IDEX_EXMEM(MemWrite_IDEX_EXMEM), 
		.MemRead_IDEX_EXMEM(MemRead_IDEX_EXMEM), .PCplus2_IDEX_EXMEM(PCplus2_IDEX_EXMEM), 
		.SetDataZero_IDEX_out(SetDataZero_IDEX_out), .SLData8_IDEX_out(SLData8_IDEX_out), .RegData1_IDEX_out(RegData1_IDEX_out), 
		.ALUSrcB_IDEX_out(ALUSrcB_IDEX_out), .RegData2_IDEX_EXMEM(RegData2_IDEX_EXMEM), .ReverseOp_IDEX_out(ReverseOp_IDEX_out), 
		.CompareOp_IDEX_out(CompareOp_IDEX_out), .sext_imm_IDEX_out(sext_imm_IDEX_out), .Err_IDEX_out(Err_IDEX_EXMEM),
		.takeBranch_IDEX_out(takeBranch_IDEX_out), .BranchPC_IDEX_out(BranchPC_IDEX_out)
	);
	
	
	execute execute0 (	
			.instruction(Instruction_IDEX_EXMEM), .clk(clk), .rst(rst), .PCplus2(PCplus2_IDEX_EXMEM), 
			.SetDataZero(SetDataZero_IDEX_out), .SLData8(SLData8_IDEX_out), .ALUSrcB (ALUSrcB_IDEX_out),
			.ReverseOp(ReverseOp_IDEX_out), .CompareOp(CompareOp_IDEX_out), .RegData1(RegData1_after_forward), .RegData2(RegData2_after_forward),
			.sext_imm(sext_imm_IDEX_out), .execute_rst(execute_rst_EXMEM_in),
			.err(err_execute)
	);
	
	EXMEMpipelineReg EXMEMpipelineReg0(
		.clk(clk), .rst(rst), .err(), .Flush(Flush_EXMEM), .Stall_disable(Stall_disable_EXMEM),
		// inputs
		.RegWriteEnable_IDEX_EXMEM(RegWriteEnable_IDEX_EXMEM),
		.WriteRegSel_IDEX_EXMEM(WriteRegSel_IDEX_EXMEM), .Instruction_IDEX_EXMEM(Instruction_IDEX_EXMEM), 
		.PCplus2_IDEX_EXMEM(PCplus2_IDEX_EXMEM), .RegData2_EXMEM_in(RegData2_after_forward), 
		.SavePC_IDEX_EXMEM(SavePC_IDEX_EXMEM), .MemToReg_IDEX_EXMEM(MemToReg_IDEX_EXMEM), 
		.MemRead_IDEX_EXMEM(MemRead_IDEX_EXMEM), .CreateDump_IDEX_EXMEM(CreateDump_IDEX_EXMEM), 
		.MemWrite_IDEX_EXMEM(MemWrite_IDEX_EXMEM), .execute_rst_EXMEM_in(execute_rst_EXMEM_in),
		.Err_EXMEM_in(Err_IDEX_EXMEM),
		
		
		// outputs
		.RegWriteEnable_EXMEM_MEMWB(RegWriteEnable_EXMEM_MEMWB),
		.WriteRegSel_EXMEM_MEMWB(WriteRegSel_EXMEM_MEMWB), .Instruction_EXMEM_MEMWB(Instruction_EXMEM_MEMWB), 
		.PCplus2_EXMEM_MEMWB(PCplus2_EXMEM_MEMWB), .RegData2_EXMEM_out(RegData2_EXMEM_out), 
		.SavePC_EXMEM_MEMWB(SavePC_EXMEM_MEMWB), .MemToReg_EXMEM_MEMWB(MemToReg_EXMEM_MEMWB), 
		.MemRead_EXMEM_MEMWB(MemRead_EXMEM_MEMWB), .CreateDump_EXMEM_out(CreateDump_EXMEM_out), 
		.MemWrite_EXMEM_out(MemWrite_EXMEM_out), .execute_rst_EXMEM_MEMWB(execute_rst_EXMEM_MEMWB),
		.Err_EXMEM_out(Err_EXMEM_out)
	);
	
	memory memory0 (	.clk(clk), .rst(rst), .err(err_memory), .MemWrite_input(MemWrite_EXMEM_out), .MemRead_input(MemRead_EXMEM_MEMWB), 
						.instructionIsHault(CreateDump_EXMEM_out), .execute_rst(execute_rst_EXMEM_MEMWB), .RegData2(RegData2_after_forward_M), 
						.MemReadRst(MemReadRst_MEMWB_in), .Err_EXMEM_out(Err_EXMEM_out), .DataMemStall(DataMemStall), .global_err(err),
						.Stall_disable_EXMEM(Stall_disable_EXMEM)
	);
   

	MEMWBpipelineReg MEMWBpipelineReg0(
		.clk(clk), .rst(rst), .err(), .Flush(Flush_MEMWB), .Stall_disable(Stall_disable_MEMWB),
		
		// inputs
		.RegWriteEnable_EXMEM_MEMWB(RegWriteEnable_EXMEM_MEMWB),
		.WriteRegSel_EXMEM_MEMWB(WriteRegSel_EXMEM_MEMWB), .Instruction_EXMEM_MEMWB(Instruction_EXMEM_MEMWB), 
		.PCplus2_EXMEM_MEMWB(PCplus2_EXMEM_MEMWB), .execute_rst_EXMEM_MEMWB(execute_rst_EXMEM_MEMWB), 
		.MemToReg_EXMEM_MEMWB(MemToReg_EXMEM_MEMWB), .SavePC_EXMEM_MEMWB(SavePC_EXMEM_MEMWB), 
		.MemReadRst_MEMWB_in(MemReadRst_MEMWB_in), .Err_MEMWB_in(err_memory), .MemRead_EXMEM_MEMWB(MemRead_EXMEM_MEMWB),
		
		// outputs
		.RegWriteEnable_MEMWB_out(RegWriteEnable_MEMWB_out),
		.WriteRegSel_MEMWB_out(WriteRegSel_MEMWB_out), .Instruction_MEMWB_out(Instruction_MEMWB_out), 
		.PCplus2_MEMWB_out(PCplus2_MEMWB_out), .execute_rst_MEMWB_out(execute_rst_MEMWB_out), 
		.MemToReg_MEMWB_out(MemToReg_MEMWB_out), .SavePC_MEMWB_out(SavePC_MEMWB_out), 
		.MemReadRst_MEMWB_out(MemReadRst_MEMWB_out), .Err_MEMWB_out(Err_MEMWB_out), .MemRead_MEMWB_out(MemRead_MEMWB_out)
	);
	
	wb wb0 (
			.MemToReg(MemToReg_MEMWB_out), .SavePC(SavePC_MEMWB_out), .MemReadRst(MemReadRst_MEMWB_out), .execute_rst(execute_rst_MEMWB_out), 
			.PCplus2(PCplus2_MEMWB_out), .writebackData(writebackData), .err(err_wb)
	);
    
   ///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   HazardDetection HazardDetection0 (
		// inputs
		.TakeBranch_from_D(takeBranch_IDEX_out), .Instruction_IFID_in(Instruction_IFID_in), 
		.RegWriteEnable_IDEX_EXMEM(RegWriteEnable_IDEX_EXMEM), .WriteRegSel_IDEX_EXMEM(WriteRegSel_IDEX_EXMEM),
		.RegWriteEnable_IDEX_in(RegWriteEnable_IDEX_in), .WriteRegSel_IDEX_in(WriteRegSel_IDEX_in),	
		.Instruction_IDEX_EXMEM(Instruction_IDEX_EXMEM), .Instruction_IFID_IDEX(Instruction_IFID_IDEX),
		.MemRead_IDEX_in(MemRead_IDEX_in),
		.InstructionMemNotDone(InstructionMemNotDone), .DataMemStall(DataMemStall), .InstructionMemStall(InstructionMemStall),
		.CreateDump_IFID_in(CreateDump_IFID_in),
		// outputs
		.PC_enable(PC_enable),
		.Flush_IFID(Flush_IFID), .Stall_disable_IFID(Stall_disable_IFID),
		.Flush_IDEX(Flush_IDEX), .Stall_disable_IDEX(Stall_disable_IDEX),
		.Flush_EXMEM(Flush_EXMEM), .Stall_disable_EXMEM(Stall_disable_EXMEM),
		.Flush_MEMWB(Flush_MEMWB), .Stall_disable_MEMWB(Stall_disable_MEMWB)
	);
	
	forwardToEX forwarding0(
		////////// INPUTS ///////////
		// allows us to determine the registers we are reading in EX stage.
		.Instruction_IDEX_EXMEM(Instruction_IDEX_EXMEM),
		
		// allows us to determine write reg in MEM stage.
		.RegWriteEnable_EXMEM_MEMWB(RegWriteEnable_EXMEM_MEMWB),
		.WriteRegSel_EXMEM_MEMWB(WriteRegSel_EXMEM_MEMWB),
		.Instruction_EXMEM_MEMWB(Instruction_EXMEM_MEMWB),
		
		// allows us to determine write reg in WB stage.
		.RegWriteEnable_MEMWB_out(RegWriteEnable_MEMWB_out),
		.WriteRegSel_MEMWB_out(WriteRegSel_MEMWB_out),
		.Instruction_MEMWB_out(Instruction_MEMWB_out),
		
		// the data that will get forwarded
		.execute_rst_EXMEM_MEMWB(execute_rst_EXMEM_MEMWB),
		.writebackData(writebackData),
		
		// the data we will use if we do not forward.
		.RegData1_IDEX_out(RegData1_IDEX_out),
		.RegData2_IDEX_out(RegData2_IDEX_EXMEM),
		
		////////// OUTPUTS ///////////
		// forwarded outputs
		.RegData1_after_forward(RegData1_after_forward),
		.RegData2_after_forward(RegData2_after_forward) 
	);
	
	forwardToD forwarding1(
		////////// INPUTS ///////////
		// allows us to determine the registers we are reading in EX stage.
		.Instruction_IFID_IDEX(Instruction_IFID_IDEX),
		
		// allows us to determine write reg in MEM stage.
		.RegWriteEnable_EXMEM_MEMWB(RegWriteEnable_EXMEM_MEMWB),
		.WriteRegSel_EXMEM_MEMWB(WriteRegSel_EXMEM_MEMWB),
		.Instruction_EXMEM_MEMWB(Instruction_EXMEM_MEMWB),
		
		// allows us to determine write reg in WB stage.
		.RegWriteEnable_MEMWB_out(RegWriteEnable_MEMWB_out),
		.WriteRegSel_MEMWB_out(WriteRegSel_MEMWB_out),
		.Instruction_MEMWB_out(Instruction_MEMWB_out),
		
		// the data that will get forwarded
		.execute_rst_EXMEM_MEMWB(execute_rst_EXMEM_MEMWB),
		.writebackData(writebackData),
		
		// the data we will use if we do not forward.
		.RegData1_IDEX_in(RegData1_IDEX_in),
		
		////////// OUTPUTS ///////////
		// forwarded outputs
		.RegData1_after_forward_D(RegData1_after_forward_D)
	);
	
	
	forwardToM forwarding2 (
		////////// INPUTS ///////////
		// allows us to determine the registers we are reading in MEM stage.
		.Instruction_EXMEM_MEMWB(Instruction_EXMEM_MEMWB),
		.MemWrite_EXMEM_out(MemWrite_EXMEM_out), // and if it's a ST.
		
		// allows us to determine write reg in WB stage and if it's a LD.
		.RegWriteEnable_MEMWB_out(RegWriteEnable_MEMWB_out),
		.WriteRegSel_MEMWB_out(WriteRegSel_MEMWB_out),
		.Instruction_MEMWB_out(Instruction_MEMWB_out),
		.MemRead_MEMWB_out(MemRead_MEMWB_out),
		
		// the data that will get forwarded
		.MemReadRst_MEMWB_out(MemReadRst_MEMWB_out),
		
		// the data we will use if we do not forward.
		.RegData2_EXMEM_out(RegData2_EXMEM_out),
		
		////////// OUTPUTS ///////////
		// forwarded outputs
		.RegData2_after_forward_M(RegData2_after_forward_M)
	);
   
  
   //assign err = 0;//err_fetch | err_IFID_reg | err_decode  | err_IDEX_reg | err_execute | err_EXMEM_reg | err_memory | err_MEMWB_reg | err_wb;
   assign err = Err_MEMWB_out;//err_memory;
    
endmodule // proc
`default_nettype wire
// DUMMY LINE FOR REV CONTROL :0:
