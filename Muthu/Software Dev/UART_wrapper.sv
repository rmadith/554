module UART_wrapper( 

input clk, rst_n, // 50MHz clock & asynch active low reset
input RX, // Receive line from Bluetooth module (19200 baud)
output reg cmd_rdy, output reg [15:0] cmd, // When cmd_rdy is asserted cmd is 16-bit command received
input clr_cmd_rdy,  // Used to knock down cmd_rdy. Bookkeeping for consumer.
input trmt, input [7:0] resp, // resp is sent to Bluetooth module upon a pulse on trmt
output tx_done, // Asserted when resp has been sent
output TX); // Transmit line to Bluetooth module (19200 baud)

logic rx_rdy;
logic clr_rx_rdy;
logic [7:0] rx_data;
logic [7:0] tx_data;

// Instantiating UART DUT
UART uart( .clk(clk), .rst_n(rst_n), .RX(RX), .TX(TX), .rx_rdy(rx_rdy), .clr_rx_rdy(clr_rx_rdy), .rx_data(rx_data), .trmt(trmt), .tx_data(resp),.tx_done(tx_done));

// Defining states
typedef enum reg{IDLE, LOW}state_t;
state_t state, nxt_state;

logic set_cmd_rdy;
logic en_hld;
logic [7:0] hold_reg; 
logic [7:0] high;

// Hold register for top 8 bytes
always_ff @(posedge clk) begin
  if(en_hld) 
    high <= rx_data;
end

// Assert Done
always_ff@(posedge clk, negedge rst_n)begin
  if(!rst_n)
    cmd_rdy <= 1'b0;
  else if(clr_cmd_rdy)
    cmd_rdy <= 1'b0;
  else if(set_cmd_rdy)
    cmd_rdy <= 1'b1;
end

// state reset flip flop
always_ff @(posedge clk, negedge rst_n) begin
  if(!rst_n)
    state <= IDLE;
  else 
    state <= nxt_state;
end

// UART WRAPPER STATE MACHINE
always_comb begin
  nxt_state = state;
  set_cmd_rdy = 0;
  clr_rx_rdy = 0;
  en_hld = 0;

  case(state)

    LOW: 
    if(rx_rdy) begin
      set_cmd_rdy = 1;
      clr_rx_rdy = 1;
      nxt_state = IDLE;
    end

    default: // IDLE
    if (rx_rdy) begin
      en_hld = 1;
      clr_rx_rdy = 1;
      nxt_state = LOW;
    end

  endcase
end

// assigning current and incoming bits to cmd
assign cmd = {high, rx_data};

endmodule