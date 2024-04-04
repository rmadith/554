module bootloader(clk, rst_n, RX, TX, in_data, out_data, debug, write_to_UART, in_debug);

input clk, rst_n, RX, TX;
input [15:0] in_data;			// data to UART
output [15:0] out_data;			// data from uart 
input debug;				// Debug (Self explanatory)
input write_to_UART;			// Write signal to send to UART
output in_debug; 			// Indicate that the write of 32 bits is done


// Transmission state machine
typedef enum reg[1:0] {IDLE, HIGH, LOW} send_byte;
send_byte send_state, nxt_send_state;

// Transmission related
wire [15:0] tx_data;
reg [15:0] stored_tx_data;
reg [7:0] send_tx_data;
reg trmt, store;
wire tx_q_empty;


// Recieveing state machine
typedef enum reg[2:0] {IDLE, BYTE1, BYTE2, BYTE3, BYTE4, WRITE} rec_byte;
rec_byte rec_state, nxt_rec_state;

// Recieveing related
wire [7:0] rx_data;


// UART
wire rx_rdy;


circular_queue iTxQueue(.clk(clk),.rst_n(rst_n),.data_in(in_data),.add(write_to_UART),.remove(store),.data_out(tx_data),.q_full(),.q_empty(tx_q_empty), .remaining(), .containing());

circular_queue   #(.Q_SIZE = 16) iRxQueue(.clk(clk),.rst_n(rst_n),.data_in(rx_data),.add(rx_rdy),.remove(),.data_out(),.q_full(),.q_empty(), .remaining(), .containing());

UART iUART(.clk(clk),.rst_n(rst_n),.RX(RX),.TX(TX),.rx_rdy(rx_rdy),.clr_rx_rdy(inter_add1),.rx_data(rx_data),.trmt(trmt),.tx_data(send_tx_data),.tx_done(tx_done), .baud('h1b2));

// Double flopping for delayed cleared 
reg inter_add, inter_add1;
always_ff @(posedge clk, negedge rst_n)
	if(!rst_n) begin
		inter_add <= 0;
		inter_add1 <= 0;
	end else begin
		inter_add <= rx_rdy;
		inter_add1 <= inter_add;
	end


/////////////////////////////////////////////////////////////////////////
// 						Recieveing  								/////
////////////////////////////////////////////////////////////////////////







/////////////////////////////////////////////////////////////////////////
// 						Transmission								/////
////////////////////////////////////////////////////////////////////////
always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
		stored_tx_data <= 'b0;
    else if(store)
		stored_tx_data <= tx_data;

always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
		send_state <= IDLE;
    else
		send_state <= nxt_send_state;

always_comb begin
   trmt = 0;
   store = 0;
   nxt_send_state = send_state;
   case(send_state)
	default: if(!tx_q_empty) begin
				store = 1;
				nxt_send_state = HIGH;
		 	end
	HIGH:   begin
				send_tx_data = stored_tx_data[15:8];
				trmt = 1;
		 		if(tx_done) nxt_send_state = LOW;
			end
	LOW:	begin
				send_tx_data = stored_tx_data[7:0];
				trmt = 1;
				if(tx_done) nxt_send_state = IDLE;
			end
	endcase
end

   


endmodule
