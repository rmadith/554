/*
   CS/ECE 552 Spring '22
  
   Filename        : fetch.v
   Description     : This is the module for the overall fetch stage of the processor.
*/
`default_nettype none
module fetch (clk, rst, BranchPC_EXMEM_out, takeBranch_EXMEM_out, instructionIsHault, PCplus2, instruction, err, PC_enable, InstructionMemNotDone, InstructionMemStall);
	parameter N = 16; // The size of the register (number of bits it can store)
	
	input wire clk; 
	input wire rst;
	input wire [N-1:0] BranchPC_EXMEM_out;
	input wire takeBranch_EXMEM_out;
	input wire PC_enable; 
	
	output wire instructionIsHault;
	output wire [N-1:0] PCplus2;
	output wire [N-1:0] instruction;
	output wire InstructionMemNotDone; // to hazard detection unit
	output wire InstructionMemStall; // to hazard detection unit
	output wire err;
	
	

	// declare internal nets
	wire [N-1:0] NewPC;
	wire [N-1:0] pc; 
	wire im_stall, im_done;
	
	// Create a 2:1 mux for the source of the next PC value. 
	assign NewPC = takeBranch_EXMEM_out ? BranchPC_EXMEM_out : PCplus2;

	// instantiate register for the PC
	nBitRegister #(N) pc_reg(
		   // Outputs
		   .D_O(pc), .err(),
		   // Inputs
		   .clk(clk), .rst(rst), .D(NewPC), .C(PC_enable)
		   );
	
	
	// instantiate instruction memory. wr is 0 == read, 1 == write
	mem_system #(0) regFile0(.DataOut(instruction), .DataIn(), 
				.Addr(pc), .Rd(1'b1), .Wr(1'b0), 
				.createdump(instructionIsHault), .clk(clk), .rst(rst), .err(err), .Done(im_done), .Stall(im_stall), .CacheHit());

	// The hazard detection unit needs access to the done & stall signals for the IM.
	assign InstructionMemNotDone = (~im_done);
	
	assign InstructionMemStall = im_stall;
	
	// create comparator to check if the instruction is hault.
	assign instructionIsHault = ~(|instruction); // bitwise nor to check if the 
													// opcode is zero.
	
	
	
	// PC enable logic
	
	//assign enable = ~( ~(takeBranch_EXMEM_out & (im_done | ~im_stall)) & (stall | instructionIsHault));
	
	
	
	// instantiate CLA to increment PC by two
	cla16b #(N) pc_incrementer (.sum(PCplus2), .cOut(), .inA(pc), .inB(16'h0002), .cIn(1'b0));
	
	/////////// Extra signals for TB //////////////////
	wire [N-1:0] pcCurrent;
	assign pcCurrent = pc;
	
	wire [N-1:0] instr;
	assign instr = instruction;
   
endmodule
`default_nettype wire
