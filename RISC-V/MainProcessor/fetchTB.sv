module fetchTB();


  logic rst_n,clk;
  wire [31:0] inst,PC,oldPC,temp_PC;
  reg [31:0] inst_i,oldPC_i;

  fetch ifetch(.clk(clk), .rst_n(rst_n), .PC_in(temp_PC), .PC_out(PC), .inst(inst), .old_PC(oldPC),.flush(0),
		.Branch_PC(0),.PC_en(1));
  decode idecode(
	// Inputs
	.clk(clk),.rst_n(rst_n),.instruction(inst),.currPC(oldPC),.dataIn(),.PC_plus4(PC),
	// Outputs
	.updatePC(temp_PC),.addConstant4(),.memType(),.setDataZero(),.alu_op(),.memRead(),.memWrite(),.pc_operand(),
	.immSel(),.SrcA(),.SrcB(),.immValue()
	);

  initial begin
    clk = 1;
    rst_n = 0;
    //temp_PC = 'hz;
    repeat (2) @(negedge clk);
    rst_n = 1;
    // $display("instruction = %h ,PC = %h",inst,PC);
    repeat(10) begin 
    @(negedge clk);
    $display("instruction = %h ,PC = %h",inst,PC);
    // temp_PC = PC;
    $display("temp_PC = %h",ifetch.PC_in);
    end
    //$dumpfile("test.vcd");
    // $dumpvars(0,fetchTB);
    $stop();
  end
  always #5 clk = ~clk;

  

endmodule
