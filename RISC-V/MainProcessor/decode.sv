module decode(
	// Inputs
	clk,rst_n,instruction,currPC,dataIn,PC_plus4,
	// Outputs
	updatePC,addConstant4,memType,setDataZero,alu_op,memRead,memWrite,pc_operand,
	immSel,SrcA,SrcB,immValue,memWrData
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
output [31:0] SrcA,SrcB,immValue,memWrData;

//////////////////////////////////////////
/////////////// Variables ///////////////
////////////////////////////////////////

logic [2:0] immType;
logic regWriteEnable; // remove this later for pipelining
logic branch,jump;
logic [4:0] dstRegAddr; // remove this late for pipelining
logic flush;	// remove this later for pipelineing (add to output)
logic takeBranch;
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

assign dstRegAddr = (instruction[6:0] == 7'b1100011 | instruction[6:0] == 7'b0100011) ? 5'bz : instruction[11:7]; // need to fix this 

rf iRF(.clk(clk),.p0_addr(instruction[19:15]),.p1_addr(instruction[24:20]),.p0(SrcA),.p1(SrcB),.re0(1'b1),.re1(1'b1),
	.dst_addr(dstRegAddr),.dst(dataIn),.we(regWriteEnable));

branch_unit iBU(
	//Inputs
	.branch(branch),.jump(jump),.currPC(currPC),.PC_plus4(PC_plus4),.immediate(immValue),.SrcA(SrcA),.SrcB(SrcB),.funct3(instruction[14:12]),
	.opcode(instruction[6:0]),
	//Outputs
	.newPC(updatePC),.takeBranch(takeBranch)
	);

assign flush = (takeBranch | jump) & (updatePC != PC_plus4);
assign memWrData = SrcB;


endmodule
