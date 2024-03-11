/*
    CS/ECE 552 Spring '23
    Eric Dubberstein, Joash Shankar

    Increase the performance of our cache design by using LRU
    superior replacement policy
*/
`default_nettype none
module LRU(
    // inputs
    clk, rst, dataIn, index, write, 
    
    // output
    dataOut);

  input wire clk, rst, dataIn;
  input wire [7:0] index;
  input wire write;
  output wire dataOut;
  
  // Internal nets
  wire decoder_out;
  wire [255:0] q;

  // Instantiate decoder
  decoder8to256 decoder (
    .index(index),
    .enable(write),
    .decoder_out(decoder_out)
  );
  
  // Instantiate flip flops
  en_dff dff_inst[255:0] (
    .en(decoder_out),
	.q(q),
    .d(dataIn),
    .clk(clk),
    .rst(rst),
	.err()
  );
  
  // Instantiate mux
  LRUmux LRUmux (
    .index(index), 
    .data_out(dataOut), // output of overall module
    .stored_bits(q)
  );
  
endmodule
`default_nettype wire

// 256 bit vector using the index input
// assign decoderOut = (write) ? (256'h1 << index) : 256'h0;