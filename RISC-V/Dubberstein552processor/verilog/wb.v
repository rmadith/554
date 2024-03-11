/*
   CS/ECE 552 Spring '22
  
   Filename        : wb.v
   Description     : This is the module for the overall Write Back stage of the processor.
*/
`default_nettype none
module wb (MemToReg, SavePC, MemReadRst, execute_rst, PCplus2, writebackData, err);
	parameter N = 16;
	
	// inputs/outputs //////////
	input wire MemToReg;
	input wire SavePC;
	
	input wire [N-1:0] MemReadRst;
	input wire [N-1:0] execute_rst;
	input wire [N-1:0] PCplus2;
	
	output wire [N-1:0] writebackData;
	output wire err;
	
	///////////////////////////////
	
	// declare internal nets
	wire [N-1:0] MemOrExRst;
	
	// mux to choose if result is from memory or execute stage
	assign MemOrExRst = MemToReg ? MemReadRst : execute_rst;
	
	// mux to choose if we want to save the current PC to a register
	assign writebackData = SavePC ? PCplus2 : MemOrExRst;
	
	assign err = (~(MemToReg===1 | MemToReg===0)) | (~(SavePC===1 | SavePC===0)) | (~(MemReadRst===1 | MemReadRst===0)) | (~(execute_rst===1 | execute_rst===0)) |
					(~(PCplus2===1 | PCplus2===0));
	
   
endmodule
`default_nettype wire
