module game_holder(
	output TX,
	input RX,
	input clk, rst_n,

	output reg [9:0] joystick_data,
	output reg ready,
	input send_done
);

wire [7:0] rx_data;
typedef enum reg[1:0] {IDLE, RX_L} state_t;

state_t state, nxt_state;

reg clr_rx_rdy, capture, shift;

UART iUART(.clk(clk),.rst_n(rst_n),.RX(RX),.TX(TX),.rx_rdy(rx_rdy),.clr_rx_rdy(clr_rx_rdy),.rx_data(rx_data),.trmt(send_done),.tx_data(8'b1),.tx_done(tx_done), .baud('h01b2));


always_ff @(posedge clk, negedge rst_n)
	if(!rst_n)
		state <= IDLE;
	else
		state <= nxt_state;

always_ff @(posedge clk, negedge rst_n) begin
	if(!rst_n)
		joystick_data <= 'b0;
	else if(capture)
		joystick_data <= {2'b0, rx_data};
	else if(shift)
		joystick_data <= {joystick_data[1:0],rx_data[7:0]};
end

always_comb begin
	nxt_state = state;
	clr_rx_rdy = 0;
	capture = 0;
	shift = 0;
	case(state)
		IDLE: if(rx_rdy) begin
			clr_rx_rdy = 1;
			capture = 1;
			nxt_state = RX_L;
		      end	
		RX_L : if(rx_rdy) begin
			clr_rx_rdy = 1;
			shift = 1;
			nxt_state = IDLE;
		       end
	endcase
end

always_ff @(posedge clk, negedge rst_n) begin
	if(!rst_n)
		ready <= 'b0;
	else if(send_done)
		ready <= 'b0;
	else if(shift)
		ready <= 'b1;
end

endmodule
