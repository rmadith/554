module UART_tx(clk,rst_n,TX,trmt,tx_data,tx_done,baudrate);

/////////////////////////////////////////////////////////////////
// Intentionally obfuscated model of UART_tx with 115200 baud //
///////////////////////////////////////////////////////////////
input clk,rst_n;		// clock and active low reset
input trmt;				// trmt tells TX section to transmit tx_data
input [12:0] baudrate;
input [7:0] tx_data;	// byte to transmit
output TX, tx_done;		// tx_done asserted when transmission complete

reg state,nxt_state;      
reg [8:0] tx_shift_reg;
reg [3:0] bit_cnt;
reg [12:0] baud_cnt;
reg tx_done;

reg start, load;

wire shift;

localparam IDLE = 1'b0;
localparam TRANSMIT = 1'b1;

////////////////////////////
// Infer state flop next //
//////////////////////////
always @(posedge clk or negedge rst_n)
  if (!rst_n)
    state <= IDLE;
  else
    state <= nxt_state;


/////////////////////////
// Infer bit_cnt next //
///////////////////////
always @(posedge clk or negedge rst_n)
  if (!rst_n)
    bit_cnt <= 4'b0000;
  else if (start)
    bit_cnt <= 4'b0000;
  else if (shift)
    bit_cnt <= bit_cnt+1;

//////////////////////////
// Infer baud_cnt next //
////////////////////////
always @(posedge clk or negedge rst_n)
  if (!rst_n)
    baud_cnt <= baudrate;
  else if (start || shift)
    baud_cnt <= baudrate;
  else if (load)
    baud_cnt <= baud_cnt-1;

////////////////////////////////
// Infer shift register next //
//////////////////////////////
always @(posedge clk or negedge rst_n)
  if (!rst_n)
    tx_shift_reg <= 9'h1FF;
  else if (start)
    tx_shift_reg <= {tx_data,1'b0};
  else if (shift)
    tx_shift_reg <= {1'b1,tx_shift_reg[8:1]};

///////////////////////////////////////////////
// Easiest to make tx_done a set/reset flop //
/////////////////////////////////////////////
always @(posedge clk or negedge rst_n)
  if (!rst_n)
    tx_done <= 1'b0;
  else if (trmt)
    tx_done <= 1'b0;
  else if (bit_cnt==4'b1010)
    tx_done <= 1'b1;


always @(state,trmt,shift,bit_cnt)
  begin
    //////////////////////////////////////
    // Default assign all output of SM //
    ////////////////////////////////////
    start         = 0;
    load          = 0;
    nxt_state    = IDLE;
    
    case (state)
      IDLE : begin
        if (trmt)
          begin
            nxt_state = TRANSMIT;
            start = 1;
          end
        else nxt_state = IDLE;
      end
      default : begin
        if (bit_cnt==4'b1010)
          nxt_state = IDLE;
        else
          nxt_state = TRANSMIT;
        load = 1;
      end
    endcase
  end


assign shift = ~|baud_cnt;
assign TX = tx_shift_reg[0];

endmodule

