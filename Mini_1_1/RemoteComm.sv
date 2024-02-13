`timescale 1ns/1ps
module RemoteComm(clk, rst_n, RX, TX, cmd, send_cmd, cmd_sent, resp_rdy, resp);

input clk, rst_n;		// clock and active low reset
input RX;				// serial data input
input send_cmd;			// indicates to tranmit 24-bit command (cmd)
input [15:0] cmd;		// 16-bit command

output TX;				// serial data output
output reg cmd_sent;		// indicates transmission of command complete
output resp_rdy;		// indicates 8-bit response has been received
output reg [7:0] resp;		// 8-bit response from DUT


// <<<  Your declaration stuff here >>>
logic trmt;
logic sel;
logic tx_done;
logic clr_rx_rdy;

logic set_cmd_snt, set_cmd_snt1, set_cmd_snt2;

logic [7:0] tx_data;
logic [7:0] low_byte;

// Declaring states
typedef enum reg [1:0] {IDLE, HIGH, LOW} state_t;
state_t state, nxt_state;

///////////////////////////////////////////////
// Instantiate basic 8-bit UART transceiver //
/////////////////////////////////////////////
UART iUART(.clk(clk), .rst_n(rst_n), .RX(RX), .TX(TX), .tx_data(tx_data), .trmt(trmt),
           .tx_done(tx_done), .rx_data(resp), .rx_rdy(resp_rdy), .clr_rx_rdy(resp_rdy));

//  <<< Your implementation here >>>

assign tx_data = (sel) ? cmd[15:8] : low_byte;

// Low byte FF
always_ff @(posedge clk) begin
  if(send_cmd)
    low_byte <= cmd[7:0];
end

// double flopping set_cmd_snt
always @(posedge clk) begin
    set_cmd_snt1 <= set_cmd_snt;
    set_cmd_snt2 <= set_cmd_snt1;
end

// final assignment SR flip flop
always @(posedge clk, negedge rst_n) begin
    if(!rst_n) 
        cmd_sent <= 1'b0;
    else if(send_cmd)
	cmd_sent <= 1'b0;
    else if(set_cmd_snt) 
	cmd_sent <= 1'b1;
end

// State machine flop
always_ff @(posedge clk, negedge rst_n) begin
    if(!rst_n) 
        state <= IDLE;
    else 
        state <= nxt_state;
end

// STATE MACHINE 
always_comb begin
  nxt_state = state;
  sel = 0;
  clr_rx_rdy = 0;
  trmt = 0;
  set_cmd_snt = 0;

		case(state)

			HIGH: 
				if(tx_done) begin
					trmt = 1;
					nxt_state = LOW;
				end

			LOW: begin
				if(tx_done) begin
					set_cmd_snt = 1;
					nxt_state = IDLE;
				end
			end

			default: // IDLE
				if(send_cmd) begin
					sel = 1;
					trmt = 1;
					clr_rx_rdy = 1;
					nxt_state = HIGH;
				end
		endcase
end
endmodule	
