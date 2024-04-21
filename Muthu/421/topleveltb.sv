module toplevelTB ();

logic clk, rst_n, debug_sig, send_cmd, cmd_sent, resp_rdy;
wire TX, RX;
logic [7:0] cmd, resp;
logic [7:0] cmd1, cmd2, cmd3, cmd4;
logic [31:0] cmd_super;
wire [35:0] GPIO;

DE1_SOC DE(.CLOCK2_50(clk), .KEY({2'b0, debug_sig, rst_n}), .GPIO(GPIO));

assign GPIO = {30'bz,RX,1'bz,TX,3'bz};

RemoteComm iREMOTE(.clk(clk), .rst_n(rst_n), .RX(GPIO[3]), .TX(RX), .cmd(cmd), .send_cmd(send_cmd), .cmd_sent(cmd_sent), .resp_rdy(resp_rdy), .resp(), .baud(13'h1b2));

reg [31:0] instr_mem[0:10];

initial begin
    $readmemh("muthu.hex", instr_mem);
end

initial begin
    clk = 0;
    rst_n = 1;
    debug_sig = 1;
    send_cmd = 0;
    cmd = 'b0;
    @(posedge clk) rst_n = 0;
    @(posedge clk) rst_n = 1;
    @(posedge clk) debug_sig = 0;
    @(posedge clk) debug_sig = 1;
    
    // In Debug mode
    for (int i = 0;i < 6 ; i++) begin
        cmd_super = instr_mem[i];
        @(posedge clk);
        cmd1 = cmd_super[7:0];
        cmd2 = cmd_super[15:8];
        cmd3 = cmd_super[23:16];
        cmd4 = cmd_super[31:24];
        @(posedge clk);
        cmd = cmd1;
        send_cmd = 1;
        @(posedge clk) send_cmd = 0;
        @(posedge cmd_sent) cmd = cmd2;
        @(posedge clk) send_cmd = 1;
        @(posedge clk) send_cmd = 0;
        @(posedge cmd_sent) cmd = cmd3;
        @(posedge clk) send_cmd = 1;
        @(posedge clk) send_cmd = 0;
        @(posedge cmd_sent) cmd = cmd4;
        @(posedge clk) send_cmd = 1;
        @(posedge clk) send_cmd = 0;
        @(posedge cmd_sent);
    end

    $stop();
    @(posedge clk);
    debug_sig = 1'b0;
    @(posedge clk) debug_sig = 1'b1; 

    @(posedge resp_rdy);
    @(posedge resp_rdy);
    @(posedge resp_rdy);
    @(posedge resp_rdy);

    $stop();



end
    

always
    #5 clk = ~clk;
endmodule