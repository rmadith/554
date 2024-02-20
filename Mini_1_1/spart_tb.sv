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

initial begin
    clk = 0;
    iocs_n = 1;
    iorw_n = 1;
    ioaddr = 2'b00;
    baud = 13'h0036;

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
    databus = 8'h00;
    ioaddr = 2'b11;

    // Deselecting chip
    @(posedge clk);
    iocs_n = 1;

    if(iDUT.DB === 13'h0036) begin
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
    if(inter_databus[4:0] === 5'h00) begin
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
    iocs_n = 1;

    if(inter_databus === 8'b0) begin
	$display("Mini Test 3: Status Registers work as expected");
    end else begin
	$display("Status Registers didn't return right values");
	$stop();
    end


    
    


    // Official Test 1: ? Should test filling the TX queue to full
    repeat(20) begin
	if(!tx_q_full) begin
	    cmd = $random();
	    @(posedge clk) send_cmd = 1;
	    @(posedge clk) send_cmd = 0;
	    @(posedge cmd_sent);
	end
    end


	    

end

always
    #5 clk = ~clk;

endmodule