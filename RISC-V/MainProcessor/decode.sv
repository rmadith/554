module decode(
	// Inputs
	clk,rst_n,instruction,currPC,dataIn,PC_plus4,
	// Outputs
	updatePC,addConstant4,memType,setDataZero,alu_op,memRead,memWrite,pc_operand,
	immSel,SrcA,SrcB,immValue
	);
///////////////////////////////////////
/////////////// Inputs ///////////////
/////////////////////////////////////
input clk,rst_n;
input [31:0] instruction,currPC,PC_plus4;
input [31:0] dataIn;
////////////////////////////////////////
/////////////// Outputs ///////////////
//////////////////////////////////////
output addConstant4;
output [2:0] memType;
output setDataZero;
output [3:0] alu_op;
// output regWriteEnable; // for pipeline
output memRead,memWrite;
output pc_operand;
output [31:0] updatePC;
output immSel;
output [31:0] SrcA,SrcB,immValue;

//////////////////////////////////////////
/////////////// Variables ///////////////
////////////////////////////////////////

logic [2:0] immType;
logic regWriteEnable; // remove this later for pipelining
logic branch,jump;
logic [4:0] dstRegAddr; // remove this late for pipelining
logic flush;	// remove this later for pipelineing (add to output)

////////////////////////////////////////
///////////////////////////////////////
//////////////////////////////////////
control_unit iCU(
	//Inputs
	.instr(instruction),
	//Outputs
	.alu_op(alu_op),.immSel(immSel),.immType(immType),.setDataZero(setDataZero),.regWriteEnable(regWriteEnable),.memRead(memRead),.memWrite(memWrite),
	.branch(branch),.pc_operand(pc_operand),.jump(jump),.addConstant4(addConstant4),.memType(memType)
	);


extension_unit iEU(
	//Input
	.immType(immType),.inst(instruction),
	//Outputs
	.immediate(immValue)
	);

assign dstRegAddr = instruction[11:7];

rf iRF(.clk(clk),.p0_addr(instruction[19:15]),.p1_addr(instruction[24:20]),.p0(SrcA),.p1(SrcB),.re0(1),.re1(1),
	.dst_addr(dstRegAddr),.dst(dataIn),.we(regWriteEnable));

branch_unit(
	//Inputs
	.branch(branch),.jump(jump),.currPC(currPC),.PC_plus4(PC_plus4),.immediate(immValue),.SrcA(SrcA),.SrcB(SrcB),.funct3(instruction[14:12]),
	.j_opcode(instruction[6:0]),
	//Outputs
	.newPC(updatePC)
	);

assign flush = (branch | jump) & (updatePC != PC_plus4);



endmodule
