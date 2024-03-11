/*
   CS/ECE 552 Spring '22
  
   Filename        : memory.v
   Description     : This module contains all components in the Memory stage of the 
                     processor.
*/
`default_nettype none
module memory (clk, rst, MemWrite_input, MemRead_input, instructionIsHault, execute_rst, RegData2, MemReadRst, Err_EXMEM_out, DataMemStall, global_err, 
				Stall_disable_EXMEM, err);

	parameter N = 16;

	// control signals inputs
	input wire clk, rst;
	input wire MemWrite_input;
	input wire MemRead_input;
	input wire instructionIsHault;
	input wire Err_EXMEM_out;
	input wire global_err; // used to ensure that we don't perform an extra write to memory when the error signal is asserted.
	input wire Stall_disable_EXMEM; // used to ensure that we don't perform an extra write to memory when we're stalled because
									// 		of an earlier stage of the pipeline. 

	input wire [N-1:0] execute_rst;
	input wire [N-1:0] RegData2;

	//outputs
	output wire [N-1:0] MemReadRst;
	output wire DataMemStall;
	output wire err;

	// declare internal nets
	wire memory_module_err;
	wire mem_access_done;

	
				
	mem_system #(1) data_mem(.DataOut(MemReadRst), .DataIn(RegData2), 
				.Addr(execute_rst), .Rd(MemRead_input), .Wr(MemWrite_input), 
				.createdump(instructionIsHault), .clk(clk), .rst(rst), .err(memory_module_err), .Done(mem_access_done), .Stall(), .CacheHit());
	
	// We need to stall if it is a read or write op and the access isn't done.
	assign DataMemStall = (MemRead_input | MemWrite_input) & (~mem_access_done);
	
	// Extra nets for TB ///////////////////////////////////
	wire memRead, memWrite; 
	
	// we can only read or right if we don't have a global err at that time and the pipeline isn't stalled because of an earlier instruction.
	assign memRead = MemRead_input & (~global_err) & (~Stall_disable_EXMEM);
	assign memWrite = MemWrite_input & (~global_err) & (~Stall_disable_EXMEM);
	
	wire memReadorWrite;
	assign memReadorWrite = MemRead_input | MemWrite_input;
	
	wire [N-1:0] aluResult;
	assign aluResult = execute_rst;
	
	wire [N-1:0] writeData;
	assign writeData = RegData2;
	
	wire [N-1:0] memDataOut;
	assign memDataOut = MemReadRst;
	
	// We can only assert the halt that the testbench sees when we also aren't stalling (load may still be in progress).
	
	wire halt;
	assign halt = MemWrite_input ? (instructionIsHault & mem_access_done) : instructionIsHault; 
	
	
	/////////////////////////////////////////////////////////
	
	//assign err = (~(clk===1 | clk===0)) | (~(rst===1 | rst===0)) | (~(MemWrite===1 | MemWrite===0)) | (~(MemRead===1 | MemRead===0)) |
				//	(~(instructionIsHault===1 | instructionIsHault===0)) | (~(execute_rst===1 | execute_rst===0)) | (~(RegData2===1 | RegData2===0));
				
	assign err = memory_module_err | Err_EXMEM_out;
   
endmodule
`default_nettype wire
