/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 16-bit register file.  It has 1 write port, 2 read
   ports, 3 register select inputs, a write enable, a reset, and a clock
   input.  All register state changes occur on the rising edge of the
   clock. 
*/
`default_nettype none
module rf (
           // Outputs
           read1OutData, read2OutData, err,
           // Inputs
           clk, rst, read1RegSel, read2RegSel, writeRegSel, writeInData, writeEn
           );

   parameter N = 16 ; // width of registers.
   
   input wire       clk, rst;
   input wire [2:0] read1RegSel;
   input wire [2:0] read2RegSel;
   input wire [2:0] writeRegSel;
   input wire [N-1:0] writeInData;
   input wire        writeEn;

   output wire [N-1:0] read1OutData;
   output wire [N-1:0] read2OutData;
   output wire        err;

   /* YOUR CODE HERE */
   // Delcare internal nets
   wire [7:0] reg_sig, reg_enable, err_reg;
   wire [N*8-1:0] reg_out;
   wire err_dec, err_input, err_all_reg, err_mux1, err_mux2;
   
   
   /////////////////
   
   
   /////// declare duplicate internal nets for autograder.
   wire write;
   assign write = writeEn;
   
   wire [N-1:0] writedata;
   assign writedata = writeInData;
   
   wire [2:0] writeregsel;
   assign writeregsel = writeRegSel;
   
   
   
   
   ///////////////////////////////////
   
   
   // decoder for choosing which register to write enable.
   dec3_8 dec0 (.Out(reg_sig), .err(err_dec),.sel(writeRegSel));
   
   // if write enable is 0, make sure that all reg_enables are zero.
   assign reg_enable = reg_sig & {8{writeEn}};
   
   // 8 N-bit registers
   nBitRegister #(N) registers [7:0] (.D_O(reg_out), .err(err_reg), .clk(clk), .rst(rst), .D(writeInData), .C(reg_enable));
   
   // multiplexors for data output
   mux8_1_Nbit #(N) mux1 [N-1:0] (.out(read1OutData), .err(err_mux1), .sel(read1RegSel), .in(reg_out));
   mux8_1_Nbit #(N) mux2 [N-1:0] (.out(read2OutData), .err(err_mux2), .sel(read2RegSel), .in(reg_out));
   
   // logic for error signal
   assign err_all_reg = | err_reg; 
   
   assign err_input = (~(clk === 0 | clk === 1)) | (~(rst === 0 | rst === 1)) | (~((^read1RegSel) === 0 | (^read1RegSel) === 1)) |
						(~((^read2RegSel) === 0 | (^read2RegSel) === 1)) | (~((^writeRegSel) === 0 | (^writeRegSel) === 1)) |
						(~((^writeInData) === 0 | (^writeInData) === 1)) | (~(writeEn === 0 | writeEn === 1));
   
   assign err = err_input | err_dec | err_all_reg | err_mux1 | err_mux2;
   

endmodule
`default_nettype wire
