/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #2
  
   This module creates a wrapper around the 8x16b register file, to do
   do the bypassing logic for RF bypassing.
*/
`default_nettype none
module rf_bypass (
                  // Outputs
                  read1OutData, read2OutData, err,
                  // Inputs
                  clk, rst, read1RegSel, read2RegSel, writeRegSel, writeInData, writeEn
                  );

   parameter N = 16;
   
   input wire       clk, rst;
   input wire [2:0] read1RegSel;
   input wire [2:0] read2RegSel;
   input wire [2:0] writeRegSel;
   input wire [15:0] writeInData;
   input wire        writeEn;

   output wire [15:0] read1OutData;
   output wire [15:0] read2OutData;
   output wire        err;

   /* YOUR CODE HERE */
   // Declare internal nets
   wire bypass_1, bypass_2, equal_1, equal_2;
   wire [N-1:0] out_1, out_2;
   
   
   ////////////////////

   // non-bypass register file
   rf reg_file (
           // Outputs
           .read1OutData(out_1), .read2OutData(out_2), .err(err),
           // Inputs
           .clk(clk), .rst(rst), .read1RegSel(read1RegSel), .read2RegSel(read2RegSel), .writeRegSel(writeRegSel), 
		   .writeInData(writeInData), .writeEn(writeEn)
           );
		   
	// bypass to read1OutData if read1RegSel == writeRegSel
	assign equal_1 = &(~(read1RegSel ^ writeRegSel));
	assign bypass_1 = equal_1 & writeEn;
	assign read1OutData = bypass_1 ? writeInData : out_1;
	
	// bypass to read2OutData if read2RegSel == writeRegSel
	assign equal_2 = &(~(read2RegSel ^ writeRegSel));
	assign bypass_2 = equal_2 & writeEn;
	assign read2OutData = bypass_2 ? writeInData : out_2;
	
	
	/////////////////
    
	/////// declare duplicate internal nets for autograder.
	wire write;
	assign write = writeEn;

	wire [N-1:0] writedata;
	assign writedata = writeInData;

	wire [2:0] writeregsel;
	assign writeregsel = writeRegSel;

	///////////////////////////////////

endmodule
`default_nettype wire
