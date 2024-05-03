`default_nettype none

module cpu(
	input wire clk, 
	input wire rst_n,

	input wire [31:0] boot_addr,
	input wire [31:0] boot_data,
	input wire debug,
	input wire turn_off_DBP,
	
	output wire [31:0] memMappedAddr,
	output wire [31:0] memMappedDataOut,
	input wire [31:0]  joystick_data,

	output wire halt 

);

	/////////////// fetch (outputs) //////////////////
	logic [31:0] PC_plus4_IFID_in;
	logic [31:0] instruction_IFID_in;
    logic [31:0] PC_IFID_in;
	logic ECALL_IFID_in;
	logic predict_branch_taken;

	/////////////// IFID pipeline register (outputs) //////////////////
	logic [31:0] PC_plus4_IFID_out;
	logic [31:0] instruction_IFID_IDEX;
    logic [31:0] PC_IFID_IDEX;
	logic ECALL_IFID_IDEX;
	logic predict_branch_taken_ID;

	////////////////// decode (outputs) //////////////////
	logic [31:0] regData1_IDEX_in;
	logic [31:0] regData2_IDEX_in;
	logic [31:0] sext_imm_IDEX_in;

	logic immSel_IDEX_in;
	logic PC_as_operand_IDEX_in;
	logic setDataZero_IDEX_in;
	logic [3:0] ALU_op_IDEX_in;
	logic memRead_IDEX_in; 
	logic [2:0] memType_IDEX_in; 
	logic memWrite_IDEX_in;
	logic addConstant4_IDEX_in;
	logic regWriteEnable_IDEX_in;

	logic [31:0] branch_PC;
	logic takeBranch;
	logic branch;
	logic jumpAL;
	logic jump;

	/////////////// IDEX pipeline register (outputs) //////////////////
	logic [31:0] regData1_IDEX_out;
	logic [31:0] regData2_IDEX_out;
	logic [31:0] sext_imm_IDEX_out;

	logic immSel_IDEX_out;
	logic PC_as_operand_IDEX_out;
	logic setDataZero_IDEX_out;
	logic [3:0] ALU_op_IDEX_out;
	logic memRead_IDEX_EXMEM; 
	logic [2:0] memType_IDEX_EXMEM; 
	logic memWrite_IDEX_EXMEM;
	logic addConstant4_IDEX_out;
	logic regWriteEnable_IDEX_EXMEM;

	logic [31:0] instruction_IDEX_EXMEM;
	logic [31:0] PC_IDEX_EXMEM;

	logic ECALL_IDEX_EXMEM;

	////////////////// execute (outputs) //////////////////
	logic [31:0] execute_result_EXMEM_in;


	/////////////// EXMEM pipeline register (outputs) //////////////////
	logic regWriteEnable_EXMEM_MEMWB;
    logic [31:0] instruction_EXMEM_MEMWB;
    logic [31:0] PC_EXMEM_MEMWB;
    logic [31:0] regData2_EXMEM_out;
    logic [2:0] memType_EXMEM_out;
    logic memRead_EXMEM_MEMWB;
    logic memWrite_EXMEM_out;
    logic [31:0] execute_result_EXMEM_MEMWB;
	logic ECALL_EXMEM_MEMWB;


	////////////////// memory (outputs) //////////////////
	logic [31:0] memReadRst_MEMWB_in;

	/////////////// MEMWB pipeline register (outputs) //////////////////
	logic regWriteEnable_MEMWB_out;
    logic [31:0] instruction_MEMWB_out;
    logic [31:0] PC_MEMWB_out;
    logic [31:0] execute_result_MEMWB_out;
    logic memRead_MEMWB_out;
    logic [31:0] memReadRst_MEMWB_out;
	logic ECALL_MEMWB_out;

	////////////////// writeback (outputs) //////////////////
	logic [31:0] writeBackData;


	////////////////// Forwarding unit to Execute stage (outputs) //////////////////
	logic [31:0] RegData1_after_forward_EX;
	logic [31:0] RegData2_after_forward_EX;

	////////////////// Forwarding unit to Decode stage (outputs) //////////////////
	logic [31:0] RegData1_after_forward_D;
	logic [31:0] RegData2_after_forward_D;

	////////////////// Forwarding unit to Memory stage (outputs) //////////////////
	logic [31:0] RegData2_after_forward_M;


	////////////////// Hazard detection unit (outputs) //////////////////
	logic incorrect_b_prediction;
	logic PC_enable; 
	logic Flush_IFID;
	logic Flush_IDEX;
	logic Flush_EXMEM;
	logic Flush_MEMWB;


	// Instantiate the modules for each stage of (what will be) the pipeline.
	fetch iFetch(
		///// INPUTS  /////
		.clk(clk),
		.rst_n(rst_n),

		.PC_enable(PC_enable), 
		.takeBranch(takeBranch),
		.branch_PC(branch_PC),
		.branch(branch),
		.jumpAL(jumpAL),
		.turn_off_DBP(turn_off_DBP), 
		.incorrect_b_prediction(incorrect_b_prediction),
		.PC_IFID_IDEX(PC_IFID_IDEX),
		.PC_plus4_IFID_out(PC_plus4_IFID_out),

		///// OUTPUTS /////
		.PC_plus4_IFID_in(PC_plus4_IFID_in),
		.instruction_IFID_in(instruction_IFID_in),
		.PC_IFID_in(PC_IFID_in), 
		.ECALL(ECALL_IFID_in),
		.predict_branch_taken(predict_branch_taken),

		//// Bootloader /////
		.debug(debug),
		.boot_addr(boot_addr),
		.boot_data(boot_data)
    );

	IFIDpipelineReg iIFID_pipeline_reg(
		///// INPUTS  /////
		.clk(clk),
		.rst_n(rst_n),
		.stall_disable(1'b0),
		.flush(Flush_IFID),

		///// PIPELINE INPUTS  /////
		.PC_plus4_IFID_in(PC_plus4_IFID_in),
		.instruction_IFID_in(instruction_IFID_in),
		.PC_IFID_in(PC_IFID_in),
		.ECALL_IFID_in(ECALL_IFID_in),
		.predict_branch_taken(predict_branch_taken),

		///// PIPELINE OUTPUTS  /////
		.PC_plus4_IFID_out(PC_plus4_IFID_out),
		.instruction_IFID_IDEX(instruction_IFID_IDEX),
		.PC_IFID_IDEX(PC_IFID_IDEX), 
		.ECALL_IFID_IDEX(ECALL_IFID_IDEX),
		.predict_branch_taken_ID(predict_branch_taken_ID)
	);
	

	decode iDecode(
		///// INPUTS  /////
		.clk(clk),
		.rst_n(rst_n),

		.instruction_IFID_IDEX(instruction_IFID_IDEX),
		.PC_IFID_IDEX(PC_IFID_IDEX),
		.PC_plus4_IFID_out(PC_plus4_IFID_out),

		.instruction_MEMWB_out(instruction_MEMWB_out),
		.writeBackData(writeBackData),

		.regWriteEnable_MEMWB_out(regWriteEnable_MEMWB_out),

		.RegData1_after_forward_D(RegData1_after_forward_D),
		.RegData2_after_forward_D(RegData2_after_forward_D),
		

		///// OUTPUTS /////
		.regData1_IDEX_in(regData1_IDEX_in),
		.regData2_IDEX_in(regData2_IDEX_in),
		.sext_imm_IDEX_in(sext_imm_IDEX_in),

		.immSel_IDEX_in(immSel_IDEX_in),
		.PC_as_operand_IDEX_in(PC_as_operand_IDEX_in),
		.setDataZero_IDEX_in(setDataZero_IDEX_in),
		.ALU_op_IDEX_in(ALU_op_IDEX_in),
		.memRead_IDEX_in(memRead_IDEX_in),
		.memType_IDEX_in(memType_IDEX_in),
		.memWrite_IDEX_in(memWrite_IDEX_in),
		.addConstant4_IDEX_in(addConstant4_IDEX_in),
		.regWriteEnable_IDEX_in(regWriteEnable_IDEX_in),

		.branch_PC(branch_PC),
		.takeBranch(takeBranch),
		.branch(branch),
		.jumpAL(jumpAL),
		.jump(jump)
	);

	IDEXpipelineReg iIDEX_pipeline_reg(
		///// INPUTS  /////
		.clk(clk),
		.rst_n(rst_n),
		
		.stall_disable(1'b0),
		.flush(Flush_IDEX),

		///// PIPELINE INPUTS  /////
		.regData1_IDEX_in(regData1_IDEX_in),
		.regData2_IDEX_in(regData2_IDEX_in),
		.sext_imm_IDEX_in(sext_imm_IDEX_in),

		.immSel_IDEX_in(immSel_IDEX_in),
		.PC_as_operand_IDEX_in(PC_as_operand_IDEX_in),
		.setDataZero_IDEX_in(setDataZero_IDEX_in),
		.ALU_op_IDEX_in(ALU_op_IDEX_in),
		.memRead_IDEX_in(memRead_IDEX_in), 
		.memType_IDEX_in(memType_IDEX_in), 
		.memWrite_IDEX_in(memWrite_IDEX_in),
		.addConstant4_IDEX_in(addConstant4_IDEX_in),
		.regWriteEnable_IDEX_in(regWriteEnable_IDEX_in),

		.instruction_IFID_IDEX(instruction_IFID_IDEX),
		.PC_IFID_IDEX(PC_IFID_IDEX),
		.ECALL_IFID_IDEX(ECALL_IFID_IDEX),


		///// PIPELINE OUTPUTS  /////
		.regData1_IDEX_out(regData1_IDEX_out),
		.regData2_IDEX_out(regData2_IDEX_out),
		.sext_imm_IDEX_out(sext_imm_IDEX_out),

		.immSel_IDEX_out(immSel_IDEX_out),
		.PC_as_operand_IDEX_out(PC_as_operand_IDEX_out),
		.setDataZero_IDEX_out(setDataZero_IDEX_out),
		.ALU_op_IDEX_out(ALU_op_IDEX_out),
		.memRead_IDEX_EXMEM(memRead_IDEX_EXMEM), 
		.memType_IDEX_EXMEM(memType_IDEX_EXMEM), 
		.memWrite_IDEX_EXMEM(memWrite_IDEX_EXMEM),
		.addConstant4_IDEX_out(addConstant4_IDEX_out),
		.regWriteEnable_IDEX_EXMEM(regWriteEnable_IDEX_EXMEM),

		.instruction_IDEX_EXMEM(instruction_IDEX_EXMEM),
		.PC_IDEX_EXMEM(PC_IDEX_EXMEM), 

		.ECALL_IDEX_EXMEM(ECALL_IDEX_EXMEM)

	);

	


	execute iExecute(
		///// INPUTS  /////
		.setDataZero_IDEX_out(setDataZero_IDEX_out),
		.PC_as_operand_IDEX_out(PC_as_operand_IDEX_out),
		.regData1_IDEX_out(RegData1_after_forward_EX),
		.regData2_IDEX_out(RegData2_after_forward_EX),
		.immSel_IDEX_out(immSel_IDEX_out),
		.sext_imm_IDEX_out(sext_imm_IDEX_out),
		.ALU_op_IDEX_out(ALU_op_IDEX_out),
		.PC_IDEX_EXMEM(PC_IDEX_EXMEM),
		.memRead_IDEX_EXMEM(memRead_IDEX_EXMEM),
		.memWrite_IDEX_EXMEM(memWrite_IDEX_EXMEM),
		.addConstant4_IDEX_out(addConstant4_IDEX_out),

		///// OUTPUTS  /////
		.execute_result_EXMEM_in(execute_result_EXMEM_in)
	);

	EXMEMpipelineReg iEXMEM_pipeline_reg(
		///// INPUTS  /////
		.clk(clk),
		.rst_n(rst_n),
		
		.stall_disable(1'b0),
		.flush(Flush_EXMEM),

		///// PIPELINE INPUTS  /////
		.regWriteEnable_IDEX_EXMEM(regWriteEnable_IDEX_EXMEM),
		.instruction_IDEX_EXMEM(instruction_IDEX_EXMEM),
		.PC_IDEX_EXMEM(PC_IDEX_EXMEM),
		.regData2_EXMEM_in(RegData2_after_forward_EX), // NOTE: will be connected to output of forwarding unit eventually.
		.memType_IDEX_EXMEM(memType_IDEX_EXMEM),
		.memRead_IDEX_EXMEM(memRead_IDEX_EXMEM),
		.memWrite_IDEX_EXMEM(memWrite_IDEX_EXMEM),
		.execute_result_EXMEM_in(execute_result_EXMEM_in),
		.ECALL_IDEX_EXMEM(ECALL_IDEX_EXMEM),

		///// PIPELINE OUTPUTS  /////
		.regWriteEnable_EXMEM_MEMWB(regWriteEnable_EXMEM_MEMWB),
		.instruction_EXMEM_MEMWB(instruction_EXMEM_MEMWB),
		.PC_EXMEM_MEMWB(PC_EXMEM_MEMWB),
		.regData2_EXMEM_out(regData2_EXMEM_out),
		.memType_EXMEM_out(memType_EXMEM_out),
		.memRead_EXMEM_MEMWB(memRead_EXMEM_MEMWB),
		.memWrite_EXMEM_out(memWrite_EXMEM_out),
		.execute_result_EXMEM_MEMWB(execute_result_EXMEM_MEMWB), 
		.ECALL_EXMEM_MEMWB(ECALL_EXMEM_MEMWB)

    );

	logic re,we,dm_we;
	logic [31:0] dataMem;
	assign re = |execute_result_EXMEM_MEMWB[31:15] & memRead_EXMEM_MEMWB;
	assign we = |execute_result_EXMEM_MEMWB[31:15] & memWrite_EXMEM_out; 
	assign dm_we = ~|execute_result_EXMEM_MEMWB[31:15] & memWrite_EXMEM_out;

	memory iMemory(
		///// INPUTS  /////
		.clk(clk),
		.rst_n(rst_n),
		.execute_result_EXMEM_MEMWB(execute_result_EXMEM_MEMWB),
		.memWrite_EXMEM_out(dm_we),
		.memRead_EXMEM_MEMWB(memRead_EXMEM_MEMWB),
		.regData2_EXMEM_out(RegData2_after_forward_M),
		.memType_EXMEM_out(memType_EXMEM_out),

		///// OUTPUTS  /////
		.memReadRst_MEMWB_in(memReadRst_MEMWB_in),

		//// Bootloader /////
		.debug(debug),
		.boot_addr(boot_addr),
		.boot_data(boot_data)

	
	);

	assign memMappedDataOut = (we) ? RegData2_after_forward_M: 'b1;
	assign memMappedAddr = (we) ? execute_result_EXMEM_MEMWB : 'b1;

	assign dataMem  = re ? joystick_data : memReadRst_MEMWB_in;

	MEMWBpipelineReg iMEMWB_pipeline_reg(
		///// INPUTS  /////
		.clk(clk),
		.rst_n(rst_n),
		
		.stall_disable(1'b0),
		.flush(Flush_MEMWB),

		///// PIPELINE INPUTS  /////
		.regWriteEnable_EXMEM_MEMWB(regWriteEnable_EXMEM_MEMWB),
		.instruction_EXMEM_MEMWB(instruction_EXMEM_MEMWB),
		.PC_EXMEM_MEMWB(PC_EXMEM_MEMWB),
		.execute_result_EXMEM_MEMWB(execute_result_EXMEM_MEMWB),
		.memRead_EXMEM_MEMWB(memRead_EXMEM_MEMWB),
		.memReadRst_MEMWB_in(dataMem),
		.ECALL_EXMEM_MEMWB(ECALL_EXMEM_MEMWB),

		///// PIPELINE OUTPUTS  /////
		.regWriteEnable_MEMWB_out(regWriteEnable_MEMWB_out),
		.instruction_MEMWB_out(instruction_MEMWB_out),
		.PC_MEMWB_out(PC_MEMWB_out),
		.execute_result_MEMWB_out(execute_result_MEMWB_out),
		.memRead_MEMWB_out(memRead_MEMWB_out),
		.memReadRst_MEMWB_out(memReadRst_MEMWB_out),
		.ECALL_MEMWB_out(ECALL_MEMWB_out)

	);

    assign halt = ECALL_MEMWB_out;

	wb iWB(
        ///// INPUTS  /////
        .memReadRst_MEMWB_out(memReadRst_MEMWB_out),
        .memRead_MEMWB_out(memRead_MEMWB_out),
        .execute_result_MEMWB_out(execute_result_MEMWB_out),

        ///// OUTPUTS  /////
        .writeBackData(writeBackData)

        );


	forwardToEX iForwardToEX(
		///// INPUTS  /////
		.Instruction_IDEX_EXMEM(instruction_IDEX_EXMEM),
		
		.RegWriteEnable_EXMEM_MEMWB(regWriteEnable_EXMEM_MEMWB),
		.Instruction_EXMEM_MEMWB(instruction_EXMEM_MEMWB),
		
		.RegWriteEnable_MEMWB_out(regWriteEnable_MEMWB_out),
		.Instruction_MEMWB_out(instruction_MEMWB_out),
		
		.execute_result_EXMEM_MEMWB(execute_result_EXMEM_MEMWB),
		.writebackData(writeBackData),

		.RegData1_IDEX_out(regData1_IDEX_out),
		.RegData2_IDEX_out(regData2_IDEX_out),
		
		///// OUTPUTS  /////
		.RegData1_after_forward_EX(RegData1_after_forward_EX),
		.RegData2_after_forward_EX(RegData2_after_forward_EX)
	);


	forwardToD iForwardToD(
		///// INPUTS  /////
		.Instruction_IFID_IDEX(instruction_IFID_IDEX),
		
		.RegWriteEnable_EXMEM_MEMWB(regWriteEnable_EXMEM_MEMWB),
		.Instruction_EXMEM_MEMWB(instruction_EXMEM_MEMWB),
		
		.RegWriteEnable_MEMWB_out(regWriteEnable_MEMWB_out),
		.Instruction_MEMWB_out(instruction_MEMWB_out),
		
		.execute_result_EXMEM_MEMWB(execute_result_EXMEM_MEMWB),
		.writebackData(writeBackData),

		.RegData1_IDEX_out(regData1_IDEX_in),
		.RegData2_IDEX_out(regData2_IDEX_in),
		
		///// OUTPUTS  /////
		.RegData1_after_forward_EX(RegData1_after_forward_D),
		.RegData2_after_forward_EX(RegData2_after_forward_D)
	);

	forwardToMEM iForwardToMEM(
		// allows us to determine the registers we are reading in MEM stage.
		.Instruction_EXMEM_MEMWB(instruction_EXMEM_MEMWB),
		.memWrite_EXMEM_out(memWrite_EXMEM_out), // and if it's a store instruction.
		
		// allows us to determine write reg in WB stage and if it's a LOAD instruction.
		.RegWriteEnable_MEMWB_out(regWriteEnable_MEMWB_out),
		.Instruction_MEMWB_out(instruction_MEMWB_out),
		.memRead_MEMWB_out(memRead_MEMWB_out),
		
		// the data that will get forwarded
		.memReadRst_MEMWB_out(memReadRst_MEMWB_out),
		
		// the data we will use if we do not forward.
		.RegData2_EXMEM_out(regData2_EXMEM_out),
		
		// forwarded outputs
		.RegData2_after_forward_M(RegData2_after_forward_M)
	);

	HazardDetection iHazardDetect(
		///// INPUTS  /////
		.Instruction_IFID_in(instruction_IFID_in), // The instruction that is currently in the fetch stage.
		.MemRead_IDEX_in(memRead_IDEX_in),
		.ECALL_IFID_in(ECALL_IFID_in),

		.predict_branch_taken_ID(predict_branch_taken_ID),
		.Instruction_IDEX_EXMEM(instruction_IDEX_EXMEM), 
		.Instruction_IFID_IDEX(instruction_IFID_IDEX), 
		.RegWriteEnable_IDEX_EXMEM(regWriteEnable_IDEX_EXMEM), 
		.RegWriteEnable_IDEX_in(regWriteEnable_IDEX_in),
		
		.TakeBranch_from_D(takeBranch),
		.jump(jump),
		.branch(branch),

		///// OUTPUTS  /////
		.incorrect_b_prediction(incorrect_b_prediction),

		.PC_enable(PC_enable), // goes directly to the enable of the PC
	
		.Flush_IFID(Flush_IFID), 
		.Flush_IDEX(Flush_IDEX), 
		.Flush_EXMEM(Flush_EXMEM), 
		.Flush_MEMWB(Flush_MEMWB)

	);

endmodule

`default_nettype wire
