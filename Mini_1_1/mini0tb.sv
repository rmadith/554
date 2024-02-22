module MiniLab1_tb();


logic clk;
logic [3:0] KEY;
logic [9:0] LEDR;

logic resp_rdy, send_cmd, RX, TX;
logic [7:0] cmd, resp;


MiniLab1 iDUT(.clk(clk),.KEY(KEY),.LEDR(),.GPIO());

RemoteComm comms(.clk(clk), .rst_n(KEY[0]), .RX(RX), .TX(TX), .cmd(cmd), .send_cmd(send_cmd), .cmd_sent(cmd_sent), .resp_rdy(resp_rdy), .resp(resp), .baud(13'h01b2));


initial begin
  clk = 0;
  KEY = '1;
  @(posedge clk);
  KEY [0] = 0;  // Reset
  @(negedge clk);
  KEY [0] = 1;

  repeat (100000) @(posedge clk);
  $stop();
end


always
#5 clk = ~clk;
endmodule
