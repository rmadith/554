module UART_rx(clk, rst_n, RX, clr_rdy, rx_data, rdy, baud);

// declaring input/output signals
input clk, rst_n, RX, clr_rdy;
output reg rdy;
output [7:0]rx_data;

input [12:0] baud;

logic start, shift, set_rdy, receiving, enable;
reg double_flop1, double_flop2, edge_detect;
reg [3:0]bit_cnt;
reg [12:0]baud_cnt;
logic [8:0]rx_shift_reg;
typedef enum reg{INIT, RECEIVING}state_t;
state_t state, nxt_state;

//Double flopping RX to prevent metastability
always_ff@(posedge clk, negedge rst_n)begin
  if(!rst_n)begin //preset
    double_flop1 <= '1;
    double_flop2 <= '1;
    edge_detect  <= '1;
  end

  else begin
    double_flop1 <= RX;
    double_flop2 <= double_flop1;
    edge_detect <= double_flop2;
  end
end

//enable on negedge RX
assign enable = (edge_detect & ~double_flop2);

// Bit Counter
always_ff@(posedge clk)begin
  if(start)
    bit_cnt <= '0;
  else if(shift)
    bit_cnt <= bit_cnt + 1;
end

// Baud Counter
always_ff@(posedge clk) begin
  if (!rst_n)
    baud_cnt <= baud;	
  if(start|shift)
    baud_cnt <= (start) ? baud[12:1] : baud;
  else if(receiving)
    baud_cnt <= baud_cnt - 1;
end

assign shift = (baud_cnt == 12'h0) ? 1'b1 : 1'b0;

// Shift Register
always_ff@(posedge clk)begin
  if(shift)
    rx_shift_reg <= {double_flop2, rx_shift_reg[8:1]};
end

assign rx_data = rx_shift_reg[7:0];

// Assert Done
always_ff@(posedge clk, negedge rst_n)begin
  if(!rst_n)
    rdy <= 1'b0;
  else if(clr_rdy | start)
    rdy <= 1'b0;
  else if(set_rdy)
    rdy <= 1'b1;
  else 
    rdy <= 1'b0;
end

// state reset flip flop
always_ff @(posedge clk, negedge rst_n) begin
  if(!rst_n)
    state = INIT;
  else 
    state = nxt_state;
end

// STATE MACHINE
always_comb begin
  nxt_state = state;
  receiving = 0;
  set_rdy = 0;
  start = 0;

  case(state)

    RECEIVING: 
    if(bit_cnt != 4'hA) 
      receiving = 1;
    else begin
      set_rdy = 1;
      nxt_state = INIT;
    end

    default: //INIT
    if(enable) begin
      start = 1;
      nxt_state = RECEIVING;
    end
    
endcase
end

endmodule
