/*
  NOT REQUIRED FOR PROJECT

  Was used for self checking the mini1.hex, a smaller
  version of HelloWorld.hex

*/


module MiniLab1_tb();

// declare nets for testing
reg clk,RST_n;
logic [9:0] SW;
logic [9:0] LED;
logic RX;
logic TX;

// UART_Test TX signals.
logic UART_Test_TX, UART_Test_tx_done, UART_Test_trmt;
logic [7:0] UART_Test_tx_data;

// UART_Test RX signal
logic UART_Test_RX, UART_Test_clr_rdy, UART_Test_rdy;
logic [7:0] UART_Test_rx_data;
logic [12:0] UART_Test_baudrate; 

//////////////////////
// Instantiate DUT //
////////////////////
MiniProject1 iDUT (.clk(clk), .RST_n(RST_n), .SW(SW), .LED(LED), .RX(RX), .TX(TX));

/////////////////////////////////////////////////////////
// Instiante UART_tx for testing of RX buffer in spart //
/////////////////////////////////////////////////////////
UART_tx iTX2(.clk(clk),.rst_n(RST_n),.TX(UART_Test_TX),.trmt(UART_Test_trmt),.tx_data(UART_Test_tx_data),.tx_done(UART_Test_tx_done),.baudrate(UART_Test_baudrate));

/////////////////////////////////////////////////////////
// Instiante UART RX for testing of TX buffer in spart //
/////////////////////////////////////////////////////////
UART_rx iRX(.clk(clk), .rst_n(RST_n), .RX(UART_Test_RX), .clr_rdy(UART_Test_clr_rdy), .rx_data(UART_Test_rx_data), .rdy(UART_Test_rdy), .baudrate(UART_Test_baudrate));

// Connecting TX and RX from DUT to the testbench TX and RX UART modules 
assign RX = UART_Test_TX;
assign UART_Test_RX = TX;

initial begin
  
  clk = 0;  
  RST_n = 0;
  UART_Test_baudrate = 13'h01b2;

  // Release initial reset
  #2 RST_n = 1;

  //// part 0: ASM code will load up the TX queue of SPART with one entry. 
  
  //Test to see if the data recieved by the test RX module matches. 
  @(posedge UART_Test_rdy);    // wait for the rx to be ready with the DUT TX output setup to be an input to the RX Test module

  if(((UART_Test_rx_data == 8'h15)))begin      //check that the rx_data for the RX Test module and databus are the same
    $display("GOOD2: Test cpu is transmiting the right number");
  end
  else begin
    $display("ERROR: Test rx_data and databus are not the same");
    $stop();
  end

  
  //// part 1: Try to have SPART recieve data. load the data into a register on the processor and then store it back to SPART to be retransmitted. 
  
  // part 1a transmit data from test TX to be recieved by SPART
  repeat(10)@(posedge clk);    
  UART_Test_tx_data = 8'h63;
  UART_Test_trmt = 1'b1;
  repeat(2)@(negedge clk);
  UART_Test_trmt = 1'b0;

  // part 1b wait until the data is recieved by SPART
  @(posedge UART_Test_tx_done);

  // part 1c ASM code will load the data back into the transmit buffer of SPART.

  // part 1d Test to see if the data recieved by the test RX module matches. 
  @(posedge UART_Test_rdy);    // wait for the rx to be ready with the DUT TX output setup to be an input to the RX Test module

  if(((UART_Test_rx_data == 8'h63)))begin      //check that the rx_data for the RX Test module and databus are the same
    $display("GOOD2: Test cpu is transmiting the right number");
  end
  else begin
    $display("ERROR: Test rx_data and databus are not the same");
    $stop();
  end

  
  // YAHOO!!
  $display("YAHOO!! all tests passed!\n");
  $stop();
  
  
end
  

  // Generate clock
always
  #1 clk = ~clk;
  
endmodule