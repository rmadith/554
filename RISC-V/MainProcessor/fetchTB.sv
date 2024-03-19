module fetchTB();


  logic rst_n,clk,setDataZero,addConstant4,pc_operand,memRead,memWrite,immSel;
  logic [2:0] memType;
  wire [31:0] inst,PC,oldPC,temp_PC;
  wire [31:0] SrcA,SrcB,memWrData,immValue;
  logic [3:0] alu_op;

  wire [31:0] alu_out,memDataOut,writeBackData;

  fetch iFetch(.clk(clk), .rst_n(rst_n), .PC_in(temp_PC), .PC_out(PC), .inst(inst), .old_PC(oldPC),.flush(0),
		.Branch_PC(0),.PC_en(1));
  decode iDecode(
	// Inputs
	.clk(clk),.rst_n(rst_n),.instruction(inst),.currPC(oldPC),.dataIn(writeBackData),.PC_plus4(PC),
	// Outputs
	.updatePC(temp_PC),.addConstant4(addConstant4),.memType(memType),.setDataZero(setDataZero),.alu_op(alu_op),.memRead(memRead),.memWrite(memWrite),.pc_operand(pc_operand),
	.immSel(immSel),.SrcA(SrcA),.SrcB(SrcB),.immValue(immValue),.memWrData(memWrData)
	);
  execute iExecute(
	// Inputs
	.setDataZero(setDataZero),.pc_operand(pc_operand),.currPC(oldPC),.SrcA(SrcA),.SrcB(SrcB),.alu_op(alu_op),.immValue(immValue),
	.immSel(immSel),.addConstant4(addConstant4),
	//Outputs
	.alu_out(alu_out)
	);
  memory iMemory(
	//Inputs
	.clk(clk),.memType(memType),.memAddr(alu_out),.memRead(memRead),.memWrite(memWrite),.memWrData(memWrData),
	//Outputs
	.memDataOut(memDataOut)
	); 
  wb iWB(.memRead(memRead), .memData(memDataOut), .ALUResIn(alu_out),.writeBackData(writeBackData));




initial begin
    clk = 1;
    rst_n = 0;
    //temp_PC = 'hz;
    repeat (2) @(negedge clk);
    rst_n = 1;
    // $display("instruction = %h ,PC = %h",inst,PC);
    repeat(10) begin 
    @(posedge clk);
    $display("instruction = %h ,PC = %h",inst,PC);
    // temp_PC = PC;
    //$display("PC = %h",iFetch.PC_in);
    end
    //$dumpfile("test.vcd");
    // $dumpvars(0,fetchTB);
    $stop();
  end
  always #5 clk = ~clk;

  

endmodule
