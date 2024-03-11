module spart_tb();

// global signals
logic clk, rst_n;

// DUT input/output signals
logic DUT_iocs_n, DUT_iorw_n, DUT_tx_q_full, DUT_rx_q_empty, DUT_TX, DUT_RX;
wire [7:0] DUT_databus;
logic [7:0] TB_databus;
logic [1:0] DUT_ioaddr;

// UART_Test TX signals.
logic UART_Test_TX, UART_Test_tx_done, UART_Test_trmt;
logic [7:0] UART_Test_tx_data;

// UART_Test RX signal
logic UART_Test_RX, UART_Test_clr_rdy, UART_Test_rdy;
logic [7:0] UART_Test_rx_data;
logic [12:0] UART_Test_baudrate; 


//////////////////////////////
// Instiante DUT under test //
////////////////////////////// 
spart iDUT(
    .clk(clk),				
    .rst_n(rst_n),		            // asynch active low reset
    .iocs_n(DUT_iocs_n),			    // active low chip select (decode address range)
    .iorw_n(DUT_iorw_n),			    // high for read, low for write
    .tx_q_full(DUT_tx_q_full),		// indicates transmit queue is full
    .rx_q_empty(DUT_rx_q_empty),	// indicates receive queue is empty
    .ioaddr(DUT_ioaddr),		      // Read/write 1 of 4 internal 8-bit registers
    .databus(DUT_databus),	      // bi-directional data bus
    .TX(DUT_TX),			            // UART TX line
    .RX(DUT_RX)				            // UART RX line
    );

/////////////////////////////////////////////////////////
// Instiante UART_tx for testing of RX buffer in spart //
/////////////////////////////////////////////////////////
UART_tx iTX2(.clk(clk),.rst_n(rst_n),.TX(UART_Test_TX),.trmt(UART_Test_trmt),.tx_data(UART_Test_tx_data),.tx_done(UART_Test_tx_done),.baudrate(UART_Test_baudrate));

/////////////////////////////////////////////////////////
// Instiante UART RX for testing of TX buffer in spart //
/////////////////////////////////////////////////////////
UART_rx iRX(.clk(clk), .rst_n(rst_n), .RX(UART_Test_RX), .clr_rdy(UART_Test_clr_rdy), .rx_data(UART_Test_rx_data), .rdy(UART_Test_rdy), .baudrate(UART_Test_baudrate));

// Connecting TX and RX from DUT to the testbench TX and RX UART modules 
assign DUT_RX = UART_Test_TX;
assign UART_Test_RX = DUT_TX;

// DUT_databus must be wire to connect to inout port on DUT, but we need logic to drive signal in testbench. 
assign DUT_databus = TB_databus; 

initial begin
  clk = 0;
  rst_n = 0;
  
  UART_Test_baudrate = 13'h01b2;
  #2 rst_n = 1;

  ///////////////////////////////////////////////////////////////////
  // Test: Filling the TX Queue //
  ///////////////////////////////////////////////////////////////////

  //// part 0: Fill the TX queue. 
  DUT_iocs_n = 1'b0;
  DUT_ioaddr = 2'b00;
  DUT_iorw_n = 1'b0;
  TB_databus = 8'haa;

  repeat(10)@(posedge clk);    // wait for the TX Queue to fill

  //// part 1: Test to see if SPART says that the TX Queue is full. 
  if(DUT_tx_q_full)begin                       //check that the tx buffer is full
    $display("GOOD1: TX Buffer is full");
  end
  else begin
    $display("ERROR: TX Buffer is not full");
    $stop();
  end

  DUT_iocs_n = 1'b1; // disable DUT

  //// part 2: Test to see if the output is correct. 
  @(posedge UART_Test_rdy);    // wait for the rx to be ready with the DUT TX output setup to be an input to the RX Test module

  if(((UART_Test_rx_data == DUT_databus)))begin      //check that the rx_data for the RX Test module and databus are the same
    $display("GOOD2: Test rx_data and databus are the same");
  end
  else begin
    $display("ERROR: Test rx_data and databus are not the same");
    $stop();
  end

  repeat(10)@(posedge clk);    //wait
  
  
  ///////////////////////////////////////////////////////////////////
  // Test: Input and Output of RX Queue  //
  ///////////////////////////////////////////////////////////////////

  //// part 0: Add one data entries to the RX queue. 
  
  DUT_ioaddr = 2'b00;
  UART_Test_tx_data = 8'hbb;
  TB_databus = 8'hzz;
  UART_Test_trmt = 1'b1;

  repeat(2)@(negedge clk);
  UART_Test_trmt = 1'b0;
  @(posedge UART_Test_tx_done);   // wait for the transmit to finish. 

  //// part 1: Read the data from the RX Buffer.
  DUT_iocs_n = 1'b0; // enable DUT
  DUT_iorw_n = 1'b1;

  @(posedge clk); // wait for data to be valid on bus

  DUT_iocs_n = 1'b1; // disable DUT

  //@(posedge DUT_rx_q_empty);    //wait for databus to be valid

  if((DUT_databus == UART_Test_tx_data))begin       //check to see if the output is the same as the input 
    $display("GOOD3: databus is the same as tx_data");
  end
  else begin
    $display("ERROR: databus is not the same as tx_data");
    $stop();
  end

  repeat(10)@(negedge clk);    //wait
 
  DUT_iorw_n = 1'b0;
  
  ///////////////////////////////////////////////////////////////////
  // Test: Status register //
  ///////////////////////////////////////////////////////////////////
  
  //// part 0: Add six data entries to the RX queue. 
  DUT_ioaddr = 2'b00;
  UART_Test_tx_data = 8'hbb;
  TB_databus = 8'hzz;

  repeat (6) begin
    UART_Test_trmt = 1'b1;
    repeat(2)@(negedge clk);
    UART_Test_trmt = 1'b0;
    @(posedge UART_Test_tx_done);   // wait for the transmit to finish. 
  end

  //// part 1: Fill up TX queue. 
  DUT_iocs_n = 1'b0; // enable DUT
  DUT_ioaddr = 2'b00;
  DUT_iorw_n = 1'b0;
  TB_databus = 8'haa;
  repeat(100)@(negedge clk);      


  // part 2: Read the status register.
  TB_databus = 8'hzz; // stop driving the databus.
  DUT_ioaddr = 2'b01;
  DUT_iorw_n = 1'b1;
  repeat(5)@(posedge clk);

  if(DUT_databus== 8'h06) begin
    $display("GOOD4: Status register value is correct");
  end
  else begin
    $display("Status register value is: %h instead of 0x06", DUT_databus);
    $stop();
  end  
 
  DUT_iorw_n = 1'b0;    // turn off reading form RX so we can 
  DUT_iocs_n = 1'b1;    // disable DUT

  ///////////////////////////////////////////////////////////////////
  // Test: Config Baudrate //
  ///////////////////////////////////////////////////////////////////

  DUT_iocs_n = 1'b0; // enable DUT

  //// part 0: Config baudrate in DUT to be 0x1458 which is currently hard set for the test UART 
  repeat(2)@(negedge clk);
  DUT_ioaddr = 2'b10;
  TB_databus = 8'h58;
  repeat(2)@(negedge clk);
  DUT_ioaddr = 2'b11;
  TB_databus = 8'h14;
  repeat(2)@(negedge clk);

  UART_Test_baudrate = 13'h1458;

  //// part 1: Add one data entry to the RX queue. 
  DUT_ioaddr = 2'b00;
  UART_Test_tx_data = 8'hbb;
  UART_Test_trmt = 1'b1;
  TB_databus = 8'hzz;
  @(negedge clk);
  UART_Test_trmt = 1'b0;

  @(posedge UART_Test_tx_done);    //wait for the UART test to send the data in the the SPART RX Buffer

  DUT_iorw_n = 1'b1;                // read from the SPART RX Buffer

  @(posedge clk); // wait for data to be valid on bus

  if((DUT_databus == UART_Test_tx_data))begin       //check to see if the output is the same as the input 
    $display("GOOD5: DUT_databus is the same as tx_data with the config baudrate");
  end
  else begin
    $display("ERROR: DUT_databus is not the same as tx_data with the config baudrate");
    $stop();
  end

  @(posedge DUT_rx_q_empty); // make sure to empty out the recieve queue.

  DUT_iocs_n = 1'b1; // disable DUT
  ///////////////////////////////////////////////////////////////////
  
  ///////////////////////////////////////////////////////////////////
  // Test: Queue Wrap-Around #1 . //
  ///////////////////////////////////////////////////////////////////

  //// part 0: Add five data entries to the RX queue. 
  DUT_ioaddr = 2'b00;
  UART_Test_tx_data = 8'hbb;
  TB_databus = 8'hzz;
  DUT_iorw_n = 1'b0;

  repeat (5) begin
    UART_Test_trmt = 1'b1;
    repeat(2)@(negedge clk);
    UART_Test_trmt = 1'b0;
    @(posedge UART_Test_tx_done);   // wait for the transmit to finish. 
  end

  //// part 1: Read four data entries from the RX queue. 
  DUT_iocs_n = 1'b0; // enable DUT
  DUT_iorw_n = 1'b1;
  repeat(4)@(posedge clk);

  DUT_iocs_n = 1'b1; // disable DUT

  //// part 2: Add six data entries to the RX queue. 
  DUT_ioaddr = 2'b00;
  UART_Test_tx_data = 8'hcc;
  TB_databus = 8'hzz;
  DUT_iorw_n = 1'b0;

  repeat (6) begin
    UART_Test_trmt = 1'b1;
    repeat(2)@(negedge clk);
    UART_Test_trmt = 1'b0;
    @(posedge UART_Test_tx_done);   // wait for the transmit to finish. 
  end

  // part 3: Read the status register.
  DUT_iocs_n = 1'b0; // enable DUT
  TB_databus = 8'hzz; // stop driving the databus.
  DUT_ioaddr = 2'b01;
  DUT_iorw_n = 1'b1;
  repeat(5)@(posedge clk);

  if(DUT_databus[3:0] == 4'h7) begin
    $display("GOOD6: Status register value is correct with first wrap around");
  end
  else begin
    $display("Status register value is: %h instead of 0x07", DUT_databus);
    $stop();
  end 

  DUT_iocs_n = 1'b1; // disable DUT
  ///////////////////////////////////////////////////////////////////

  ///////////////////////////////////////////////////////////////////
  // Test: Queue Wrap-Around #2 . //
  ///////////////////////////////////////////////////////////////////

  // Do 6 reads, and 6 writes. Should have 7 items present at the end

  //// part 0: Read six data entries from the RX queue. 
  DUT_iocs_n = 1'b0; // enable DUT
  DUT_ioaddr = 2'b00;
  DUT_iorw_n = 1'b1;
  repeat(6)@(posedge clk);
  DUT_iocs_n = 1'b1; // disable DUT

  //// part 0: Add six data entries to the RX queue. 
  DUT_ioaddr = 2'b00;
  UART_Test_tx_data = 8'hdd;
  TB_databus = 8'hzz;
  DUT_iorw_n = 1'b0;

  repeat (6) begin
    UART_Test_trmt = 1'b1;
    repeat(2)@(negedge clk);
    UART_Test_trmt = 1'b0;
    @(posedge UART_Test_tx_done);   // wait for the transmit to finish. 
  end

  // part 2: Read the status register.
  DUT_iocs_n = 1'b0; // enable DUT
  TB_databus = 8'hzz; // stop driving the databus.
  DUT_ioaddr = 2'b01;
  DUT_iorw_n = 1'b1;
  repeat(5)@(posedge clk);

  if(DUT_databus[3:0] == 4'h7) begin
    $display("GOOD7: Status register value is correct with second wrap around");
  end
  else begin
    $display("Status register value is: %h instead of 0x07", DUT_databus);
    $stop();
  end 

  // cleanup at end of test: empty RX queue.
  DUT_ioaddr = 2'b00;
  @(posedge DUT_rx_q_empty);      // wait for the RX Queue to be empty 
  DUT_iorw_n = 1'b0;
  DUT_iocs_n = 1'b1; // disable DUT

  ///////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////
  // Test: Interleaved writes and reads at different baud rates //
  ////////////////////////////////////////////////////////////////

  DUT_iocs_n = 1'b0; // enable DUT
  //// part 0: Config baudrate in DUT to be 0x0a2c which is currently hard set for the test UART 
  repeat(2)@(negedge clk);
  DUT_ioaddr = 2'b10;
  TB_databus = 8'h2c;
  repeat(2)@(negedge clk);
  DUT_ioaddr = 2'b11;
  TB_databus = 8'h0a;
  UART_Test_baudrate = 13'h0a2c;
  repeat(2)@(negedge clk);

  DUT_iocs_n = 1'b1; // disable DUT

  //// part 1: Write then read from RX Queue and check if output is the expected. 
  DUT_ioaddr = 2'b00;
  UART_Test_tx_data = 8'hee;
  TB_databus = 8'hzz;

  UART_Test_trmt = 1'b1;
  repeat(2)@(negedge clk);
  UART_Test_trmt = 1'b0;
  @(posedge UART_Test_tx_done);   // wait for the transmit to finish. 
  

  DUT_iorw_n = 1'b1;
  DUT_iocs_n = 1'b0; // enable DUT
  @(posedge clk); // wait for data to be valid on bus

  if((DUT_databus == UART_Test_tx_data))begin       //check to see if the output is the same as the input 
    $display("GOOD8: databus is the same as tx_data");
  end
  else begin
    $display("ERROR: databus is not the same as tx_data");
    $stop();
  end

  DUT_iocs_n = 1'b1; // disable DUT

  //// part 2: Config baudrate in DUT to be 0x0036 which is currently hard set for the test UART 
  DUT_iocs_n = 1'b0; // enable DUT
  repeat(2)@(negedge clk);
  DUT_ioaddr = 2'b10;
  TB_databus = 8'h36;
  repeat(2)@(negedge clk);
  DUT_ioaddr = 2'b11;
  TB_databus = 8'h00;
  UART_Test_baudrate = 13'h0036;
  repeat(2)@(negedge clk);

  //// part 3: Write to TX Queue and check if output is the expected.
  DUT_ioaddr = 2'b00;
  DUT_iorw_n = 1'b0;
  TB_databus = 8'haa;

  @(negedge clk);
  DUT_iorw_n = 1'b0;
  TB_databus = 8'haa;
  DUT_iocs_n = 1'b1; // disable DUT

  @(posedge UART_Test_rdy);    // wait for the rx to be ready with the DUT TX output setup to be an input to the RX Test module

  if(((UART_Test_rx_data == DUT_databus)))begin      //check that the rx_data for the RX Test module and databus are the same
    $display("GOOD9: Test rx_data and databus are the same"); 
  end
  else begin
    $display("ERROR: Test rx_data and databus are not the same");
    $stop();
  end

  //// part 4: Config baudrate in DUT to be 0x006C which is currently hard set for the test UART 
  repeat(2)@(negedge clk);
  DUT_iocs_n = 1'b0; // enable DUT
  DUT_ioaddr = 2'b10;
  TB_databus = 8'h6c;
  repeat(2)@(negedge clk);
  DUT_ioaddr = 2'b11;
  TB_databus = 8'h00;
  UART_Test_baudrate = 13'h006c;
  repeat(2)@(negedge clk);
  DUT_iocs_n = 1'b1; // disable DUT

  //// part 5: Read from RX Queue and check if output is the expected given that we transmitted data on test TX module.
  DUT_ioaddr = 2'b00;
  UART_Test_tx_data = 8'hbb;
  TB_databus = 8'hzz;
  UART_Test_trmt = 1'b1;

  repeat(2)@(negedge clk);
  UART_Test_trmt = 1'b0;
  @(posedge UART_Test_tx_done);   // wait for the transmit to finish. 

  DUT_iorw_n = 1'b1;
  DUT_iocs_n = 1'b0; // enable DUT

  @(posedge clk); // wait for data to be valid on bus

  if((DUT_databus == UART_Test_tx_data))begin       //check to see if the output is the same as the input 
    $display("GOOD10: databus is the same as tx_data");
  end
  else begin
    $display("ERROR: databus is not the same as tx_data");
    $stop();
  end

  DUT_iocs_n = 1'b1; // disable DUT

  //// part 8: Config baudrate in DUT to be 0x00d9 which is currently hard set for the test UART 
  repeat(2)@(negedge clk);
  DUT_iocs_n = 1'b0; // enable DUT
  DUT_ioaddr = 2'b10;
  TB_databus = 8'hd9;
  repeat(2)@(negedge clk);
  DUT_ioaddr = 2'b11;
  TB_databus = 8'h00;
  UART_Test_baudrate = 13'h00d9;
  repeat(2)@(negedge clk);

  //// part 9: Write to TX Queue and check if the data recieved by the test module is as expected.
  DUT_ioaddr = 2'b00;
  DUT_iorw_n = 1'b0;
  TB_databus = 8'hf6;
  @(negedge clk);
  DUT_iocs_n = 1'b1; // disable DUT

  @(posedge UART_Test_rdy);    // wait for the rx to be ready with the DUT TX output setup to be an input to the RX Test module

  if(((UART_Test_rx_data == DUT_databus)))begin      //check that the rx_data for the RX Test module and databus are the same
    $display("GOOD11: Test rx_data and databus are the same");
  end
  else begin
    $display("ERROR: Test rx_data and databus are not the same");
    $stop();
  end
  
  ///////////////////////////////////////////////////////////////////

  // YAHOO!!
  $display("YAHOO!! all tests passed!\n");
  $stop();
  

end

always
  #1 clk = ~clk;


endmodule