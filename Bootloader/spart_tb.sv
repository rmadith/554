module spart_tb();

logic clk, rst_n, RX, TX;


logic send_cmd, cmd_sent, resp_rdy;
logic [7:0] cmd, resp;

logic iocs_n, iorw_n, tx_q_full, rx_q_empty;
logic [1:0] ioaddr;
logic [7:0] databus;
wire [7:0] inter_databus;

logic [12:0] baud;

RemoteComm comms(.clk(clk), .rst_n(rst_n), .RX(RX), .TX(TX), .cmd(cmd), .send_cmd(send_cmd), .cmd_sent(cmd_sent), .resp_rdy(resp_rdy), .resp(resp), .baud(baud));

spart iDUT(.clk(clk), .rst_n(rst_n), .iocs_n(iocs_n), .iorw_n(iorw_n), .tx_q_full(tx_q_full), .rx_q_empty(rx_q_empty), .ioaddr(ioaddr), .databus(inter_databus), .TX(RX), .RX(TX));

assign inter_databus = (!iorw_n) ? databus : 8'bz;

integer count;

initial begin
    clk = 0;
    iocs_n = 1;
    iorw_n = 1;
    ioaddr = 2'b00;
    baud = 13'h01b2;

    // Reset Sequence //
    rst_n = 0;
    repeat (2) @(negedge clk);
    rst_n = 1;
    //////////////////


    // Unofficial Mini Tests
    
    // Changing Baud Rate
    // Low bits
    @(posedge clk);
    databus = 8'h36;
    ioaddr = 2'b10;
    iocs_n = 0;
    iorw_n = 0;

    repeat (2) @(posedge clk);
    // High Bits
    databus = 8'h01;
    ioaddr = 2'b11;

    // Deselecting chip
    @(posedge clk);
    iocs_n = 1;

    if(iDUT.DB === 13'h0136) begin
	$display("Mini Test 1: Baud Rate Update worked");
    end else begin
	$display("Baud Rate Update failed");
	$stop();
    end

    // Now that we know DB (Baud Rate has been set. We also need to check if the DB value we read back is right.
    @(posedge clk);
    ioaddr = 2'b10;
    iorw_n = 1;
    iocs_n = 0;
   
    @(posedge clk);
    if(inter_databus === 8'h36) begin
	$display("Lower bits of DB are correctly set");
    end else begin
	$display("Lower bits are set but is not correctly returned by databus");
	$stop();
    end


    @(posedge clk);
    ioaddr = 2'b11;

    @(posedge clk);
    if(inter_databus[4:0] === 5'h01) begin
	$display("Upper bits of DB are correctly set");
    end else begin
	$display("Upper bits are set but is not correctly returned by databus");
	$stop();
    end

   $display("Mini test 2: Databus correctly returns Upper and Lower bits of Baud Rate");

    // Deselecting Chip
    @(posedge clk);
    iocs_n = 0;


    // Right now both queues should be empty. Therefore the status
    // registers should return all 0s
    @(posedge clk);
    ioaddr = 2'b01;
    iorw_n = 1;
    iocs_n = 0;

    @(posedge clk);
    if(inter_databus === 8'h80) begin
	$display("Mini Test 3: Status Registers work as expected");
    end else begin
	$display("Status Registers didn't return right values");
	$stop();
    end



    $display("All mini tests work! SPART by itself should not have issues. Hopefully (!?)");
    
    


    // Official Test 1: Should test RX queue to near full

    // Reseting to start official tests Baud Rate should have reset to 01b2 for SPART and RemoteComm has been set to 01b2
    @(negedge clk) rst_n = 0;
    @(negedge clk) rst_n = 1;
    iocs_n = 1;

    cmd = 8'hB5;
    @(posedge clk) send_cmd = 1;
    @(posedge clk) send_cmd = 0;
    @(posedge cmd_sent);
    //@(posedge iDUT.rx_rdy);

    @(posedge clk);
    ioaddr = 2'b00;
    iocs_n = 0;
    iorw_n = 1;

    @(posedge clk);
    if(inter_databus == 8'hB5) begin
	$display("Remote Comm Sent value of 8'hB5 and SPART recieved it. RX, TX lines are hooked right");
    end else begin
	$display("Transmission from remote comm failed");
	$stop();
    end

    iocs_n = 1;

    count = 0;
    repeat(20) begin
        //iocs_n = 0;
        //iorw_n = 0;
        //$display("Hello");
        @(posedge clk);
	if(!iDUT.rx_q_full) begin
	    cmd = $random();
	    @(posedge clk) send_cmd = 1;
	    @(posedge clk) send_cmd = 0;
	    @(posedge cmd_sent);
            count = count + 1;
	end
        //iocs_n = 1;
    end


    @(posedge clk);
    if(count == 8) begin
	$display("Test 1: Sucess! Remote Comm sent values. SPART has recieved and stored only 8");
    end else begin
	$display("Test 1: Failed. Count is not equal to 8");
	$stop();
    end

    // Clearing Rx
    iocs_n = 0;
    iorw_n = 1;
    ioaddr = 2'b00;
    repeat(8) @(posedge clk);
    iocs_n = 1;
	

    // Official Test 2: Should test filling the TX queue to full
    count = 1;
    repeat (20) begin
	iocs_n = 0;
	iorw_n = 0;
        databus = count;
        @(posedge clk) 
	if(!tx_q_full) count = count + 1;
	iocs_n = 1;
	@(posedge clk);
    end


    if(count == 9) begin   // Because Count started at 1;
	$display("Test 2: Sucess! TX Queue populated");
    end else begin
	$display("Test 2: Failed. Count is not equal to 8");
	$stop();
    end


    // First 8Bit Test
    fork
	test1: begin
		@(posedge resp_rdy);
		if(resp === 1) begin
		     $display("Spart sent 1st 8 bits of data properly");
		end else begin
		     $display("Incorrect Data sent");
		     $stop();
	        end
		disable end1;
               end
	end1: begin
		repeat(100000) @(posedge clk);
		disable test1;
		$display("ERR: No Communication from SPART to Remote Comm");
		$stop();
	      end
    join


    // Second  8Bit Test (Sanity Check)
    fork
	test2: begin
		@(posedge resp_rdy);
		if(resp === 8'h02) begin
		     $display("Spart sent 2nd 8 bits of data properly");
		end else begin
		     $display("Incorrect Data sent");
		     $stop();
	        end
		disable end2;
               end
	end2: begin
		repeat(100000) @(posedge clk);
		disable test1;
		$display("ERR: No Communication from SPART to Remote Comm");
		$stop();
	      end
    join


    // Misc: Making sure only 8 bits come in
    count = 0;
    fork
        test3: begin
		repeat(20) begin
		    @(posedge resp_rdy) count = count + 1;
		end
	       end
	end3: begin
		repeat(30000) @(posedge clk);
		    if(count === 6) begin
			$display("Only 8 transactions were sent. No Garbage values");
		    end else begin
			$display("Err: Either count was too low or garbage bits were sent");
			$stop();
		    end
		disable test3;
	      end
    join

    $display("Official Test 3: At the same Baud Rate, SPART is sending data to RemoteComm");
    $display("Good, This means at the same Baud Rate, Bidirectional communication has been setup");
    $display("We will start different baud rates");


    // Testing different baud rates. First test 13'h0036
    @(posedge clk);
    databus = 8'h36;
    ioaddr = 2'b10;
    iocs_n = 0;
    iorw_n = 0;

    repeat (2) @(posedge clk);
    // High Bits
    databus = 8'h00;
    ioaddr = 2'b11;
    baud = 13'h0036;
    // Deselecting chip
    @(posedge clk);
    iocs_n = 1;

    // Sending data to SPART
    fork
	test4: begin
		@(posedge clk);
		cmd = 8'h05;
		ioaddr = 2'b01;
		iorw_n = 1;
		iocs_n = 0;
		@(posedge clk) send_cmd = 1;
		@(posedge clk) send_cmd = 0;
		@(posedge cmd_sent);
		@(posedge clk);
		if(inter_databus === 8'h81) begin
		   $display("Random Test: Status Registers return correct value");
		end else begin
		   $display("Status Registers working incorrectly. Got: %h", inter_databus);
		   $stop();
		end
                ioaddr = 2'b00;
		iorw_n = 1;
		@(posedge clk);
		if(inter_databus === 8'h05) begin
		   $display("Correct Data Recieved by spart");
		end else begin
		   $display("Incorrect Data recieved");
		   $stop();
		end
		iocs_n = 1;
		disable end4;
              end
	end4: begin
		repeat(20000) @(posedge clk);
		$display("Err: No Communication recieved");
		disable test4;
		$stop();
	      end
     join

    // Sending Data to RemoteComm
    fork
	test5: begin
		@(posedge clk);
		databus = 8'hDC;
		ioaddr = 2'b00;
		iorw_n = 0;
		iocs_n = 0;
		@(posedge clk);
		iocs_n = 1;
		@(posedge resp_rdy);
		if(resp === 8'hDC) begin
		    $display("Correct Data Recieved by RemoteComm!");
		end else begin
		    $display("Incorrect Data Recieved");
		    $stop();
		end
		disable end5;
	       end
	end5: begin
		repeat(20000) @(posedge clk);
		$display("Err: No Communication recieved to RemoteComm");
		$stop();
	        disable test5;
	      end
    join


    $display("First Baud Rate Change Works, Onto the next! Exciting!");

    // Slowest Baud Rate. Too slow ugh
    @(posedge clk);
    databus = 8'h58;
    ioaddr = 2'b10;
    iocs_n = 0;
    iorw_n = 0;

    repeat (2) @(posedge clk);
    // High Bits
    databus = 8'h14;
    ioaddr = 2'b11;
    baud = 13'h1458;
    // Deselecting chip
    @(posedge clk);
    iocs_n = 1;

    // Sending data to SPART
    fork
	test6: begin
		@(posedge clk);
		cmd = 8'h06;
		ioaddr = 2'b01;
		iocs_n = 0;
		iorw_n = 1;
		@(posedge clk) send_cmd = 1;
		@(posedge clk) send_cmd = 0;
		@(posedge cmd_sent);
		@(posedge clk);
		if(inter_databus === 8'h81) begin
		   $display("Random Test (not really anymore): Status Registers return correct value");
		end else begin
		   $display("Status Registers working incorrectly. Got: %h", inter_databus);
		   $stop();
		end
                ioaddr = 2'b00;
		iorw_n = 1;
		@(posedge clk);
		if(inter_databus === 8'h06) begin
		   $display("Correct Data Recieved by spart");
		end else begin
		   $display("Incorrect Data recieved");
		   $stop();
		end
		iocs_n = 1;
		disable end6;
              end
	end6: begin
		repeat(200000) @(posedge clk);
		$display("Err: No Communication recieved");
		disable test6;
		$stop();
	      end
     join

    // Sending Data to RemoteComm
    fork
	test7: begin
		@(posedge clk);
		databus = 8'hAC;
		ioaddr = 2'b00;
		iorw_n = 0;
		iocs_n = 0;
		@(posedge clk);
		iocs_n = 1;
		@(posedge resp_rdy);
		if(resp === 8'hAC) begin
		    $display("Correct Data Recieved by RemoteComm!");
		end else begin
		    $display("Incorrect Data Recieved");
		    $stop();
		end
		disable end7;
	       end
	end7: begin
		repeat(200000) @(posedge clk);
		$display("Err: No Communication recieved to RemoteComm");
		$stop();
	        disable test7;
	      end
    join

    $display("Good, Different Baud Rates work. Now let us try to interleave them. In practicallity, who is actually going to do this?");

    // Interleaving Baud Rates. Writing Data and sending data to RemoteComm at different speeds
    fork
	test8: begin
		@(posedge clk);
		databus = 8'hAC;
		ioaddr = 2'b00;
		iorw_n = 0;
		iocs_n = 0;
		@(posedge clk);
		databus = 8'hDC;
		ioaddr = 2'b00;
		@(posedge clk);
		iocs_n = 1;
		@(posedge resp_rdy);
		if(resp !== 8'hAC) begin
		    $display("Incorrect transmission");
		    $stop();
		end
		databus = 8'h6C;
		ioaddr = 2'b10;
		iorw_n = 0;
		iocs_n = 0;
		@(posedge clk);
		databus = 8'h00;
		ioaddr = 2'b11;
		baud = 13'h006C;
		@(posedge clk);
		iocs_n = 1;
		@(posedge resp_rdy);
		if(resp !== 8'hDC) begin
		    $display("Incorrect transmission (Different Baud Rate)");
		    $stop();
		end
		$display("Test Bench sent ACDC in hex (not ascii) on different baud rates. Yipee!");
		disable end8;
	      end
	end8: begin
		repeat (500000) @(posedge clk);
		$display("Test 8: Timeout :(");
		disable test8;
	        $stop();
	       end
     join

    $display("We have tested interleaving of different baud rates from SPART to RemoteComm,I think we are done for now. Don't jinx it!");
    $display("Yahoo! All test passed");
    $stop();
	    

end

always
    #5 clk = ~clk;

endmodule