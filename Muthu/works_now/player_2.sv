module player_2(
	output TX,
	input RX,
	input clk, rst_n,

	input [9:0] joystick_data,
	output done
);

wire tx_done;
wire cmd_sent;

reg send_cmd;

typedef enum reg{IDLE, SENT} state_t;
state_t state, nxt_state;

//UART iUART(.clk(clk),.rst_n(rst_n),.RX(RX),.TX(TX),.rx_rdy(done),.clr_rx_rdy(),.rx_data(),.trmt(trmt),.tx_data(tx_data),.tx_done(tx_done), .baud('h01b2));

RemoteComm iRemote(.clk(clk), .rst_n(rst_n), .RX(RX), .TX(TX), .cmd({6'b0,joystick_data}), .send_cmd(send_cmd), .cmd_sent(cmd_sent), .resp_rdy(done), .resp());

always_ff @(posedge clk, negedge rst_n)
	if(!rst_n)
		state <= IDLE;
	else
		state <= nxt_state;


// It takes 2^12 clocks to get a valid Spi transaction
reg [11:0] counter;
always @(posedge clk, negedge rst_n)
	if(!rst_n)
		counter <= 'b0;
	else
		counter <= counter + 1;


always_comb begin
	nxt_state = state;
	send_cmd = 0;
	case(state)
		default: if(done) begin
					send_cmd = 1;
					nxt_state = SENT;
		      	end
		SENT:	begin 
				if(cmd_sent) nxt_state = IDLE;
				//else trmt = 1;
			end
	endcase	      
end

endmodule