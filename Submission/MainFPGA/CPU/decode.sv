`default_nettype none
module decode(
	///// INPUTS  /////
	input wire clk,
    input wire rst_n,

	input wire [31:0] instruction_IFID_IDEX,
	input wire [31:0] PC_IFID_IDEX,
	input wire [31:0] PC_plus4_IFID_out,

	input wire [31:0] instruction_MEMWB_out,
	input wire [31:0] writeBackData,
	input wire regWriteEnable_MEMWB_out,

	input wire [31:0] RegData1_after_forward_D,
	input wire [31:0] RegData2_after_forward_D,
	

	///// OUTPUTS /////
	output logic [31:0] regData1_IDEX_in,
	output logic [31:0] regData2_IDEX_in,
	output logic [31:0] sext_imm_IDEX_in,

	output logic immSel_IDEX_in,
	output logic PC_as_operand_IDEX_in,
	output logic setDataZero_IDEX_in,
	output logic [3:0] ALU_op_IDEX_in,
	output logic memRead_IDEX_in, 
	output logic [2:0] memType_IDEX_in, 
	output logic memWrite_IDEX_in,
	output logic addConstant4_IDEX_in,
	output logic regWriteEnable_IDEX_in,

	output logic [31:0] branch_PC,
	output logic takeBranch,
	
	output logic jumpAL,	// assert if the instruction is a JAL
	output logic branch,	// assert if the instruction is a Branch
	output logic jump		// assert if the instrucion is a jump 
	);

	///////////////////////////// Declare internal nets //////////////////////////////////
	logic [2:0] immType;
	//////////////////////////////////////////////////////////////////////////////////////

	///////////////////////////// CONTROL UNIT //////////////////////////////////
	control_unit iControl_Unit(
		///// INPUTS /////
		.instr(instruction_IFID_IDEX),

		///// OUTPUTS /////
		.alu_op(ALU_op_IDEX_in),.immSel(immSel_IDEX_in),.immType(immType),.setDataZero(setDataZero_IDEX_in),.regWriteEnable(regWriteEnable_IDEX_in),
		.memRead(memRead_IDEX_in),.memWrite(memWrite_IDEX_in), .branch(branch),.pc_operand(PC_as_operand_IDEX_in),.jump(jump),
		.addConstant4(addConstant4_IDEX_in), .memType(memType_IDEX_in), .jumpAL(jumpAL)
	);

	///////////////////////////// SIGN EXTENSION UNIT ////////////////////////////////
	extension_unit iEU(
		///// INPUTS /////
		.immType(immType),.inst(instruction_IFID_IDEX),

		///// OUTPUTS /////
		.immediate(sext_imm_IDEX_in)
	);

	// Separate variable declared for ease of debugging.
	logic [4:0] reg_dst_addr;
	assign reg_dst_addr = instruction_MEMWB_out[11:7];

	///////////////////////////// REGISTER FILE ////////////////////////////////
	rf iRF(
		///// INPUTS /////
		.clk(clk),
		.rst_n(rst_n),
		.p0_addr(instruction_IFID_IDEX[19:15]),
		.p1_addr(instruction_IFID_IDEX[24:20]),
		.re0(1'b1),
		.re1(1'b1),
		.dst_addr(reg_dst_addr),
		.dst(writeBackData),
		.we(regWriteEnable_MEMWB_out),
		
		///// OUTPUTS /////
		.p0(regData1_IDEX_in),
		.p1(regData2_IDEX_in)
	);

	///////////////////////////// BRANCH UNIT ////////////////////////////////
	branch_unit iBU(
		///// INPUTS /////
		.branch(branch),
		.jump(jump),
		.currPC(PC_IFID_IDEX),
		.PC_plus4(PC_plus4_IFID_out),
		.immediate(sext_imm_IDEX_in),
		.SrcA(RegData1_after_forward_D),
		.SrcB(RegData2_after_forward_D),
		.funct3(instruction_IFID_IDEX[14:12]),
		.opcode(instruction_IFID_IDEX[6:0]),
		
		///// OUTPUTS /////
		.takeBranch(takeBranch),
		.branch_PC(branch_PC)
	);


endmodule

`default_nettype wire