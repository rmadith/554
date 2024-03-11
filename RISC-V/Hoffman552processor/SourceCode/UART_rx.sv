module UART_rx(clk,rst_n,RX,rdy,rx_data,clr_rdy,baudrate);

input [12:0] baudrate;
input clk,rst_n;			// clock and active low reset
input RX;					// rx is the asynch serial input (need to double flop)
input clr_rdy;			// rdy can be cleared by this or start of new byte
output rdy;				// signifies to core a byte has been received
output [7:0] rx_data;		// data that was received

typedef enum reg {IDLE, RX_STATE} asdf;
asdf state, nxt_state;    //state = state, nxt_state = nxt_state

reg [8:0] rx_shift_reg;   //rx_shift_reg
reg [3:0] bit_cnt;        //bit_cnt
reg [12:0] baud_cnt;       //baudrate
reg rdy;
reg RX_temp1, RX_temp2;   //used for metastability of RX

logic start, set_rdy, receiving;   //start = start, set_rdy = set_rdy, receiving = receiving 

wire shift;

// states
always_ff @(posedge clk or negedge rst_n)
  if (!rst_n)
    state <= IDLE;
  else
    state <= nxt_state;

// shift count for how bits have the transaction has been received 
always_ff @(posedge clk or negedge rst_n)
  if (!rst_n)
    bit_cnt <= 4'b0000;
  else if (start)
    bit_cnt <= 4'b0000;
  else if (shift)
    bit_cnt <= bit_cnt+1;

// count down till next shift
always_ff @(posedge clk or negedge rst_n)
  if (!rst_n)
    baud_cnt <= {1'b0,baudrate[12:1]};			
  else if (start)
    baud_cnt <= {1'b0,baudrate[12:1]};			
  else if (shift)
    baud_cnt <= baudrate;			
  else if (receiving)
    baud_cnt <= baud_cnt-1;		

// shifter of the rx_data
always_ff @(posedge clk)
  if (shift)
    rx_shift_reg <= {RX_temp2,rx_shift_reg[8:1]};

// tell when the transaction is ready to be read
always @(posedge clk or negedge rst_n)
  if (!rst_n)
    rdy <= 1'b0;
  else if (start || clr_rdy)
    rdy <= 1'b0;
  else if (set_rdy)
    rdy <= 1'b1;

// Metastabiltiy for RX
always_ff @(posedge clk or negedge rst_n)
  if (!rst_n)
    begin
      RX_temp1 <= 1'b1;
      RX_temp2 <= 1'b1;
    end
  else
    begin
      RX_temp1 <= RX;
      RX_temp2 <= RX_temp1;
    end


always_comb
  begin
    start         = 0;
    set_rdy    	  = 0;
    receiving     = 0;
    nxt_state     = IDLE;
    
    case (state)
      IDLE : begin
        if (!RX_temp2)        // wait for start condition 
          begin
            nxt_state = RX_STATE;
            start = 1;
          end
        else nxt_state = IDLE;
      end
      default : begin
        if (bit_cnt==4'b1010)
          begin
            set_rdy = 1;
            nxt_state = IDLE;
          end
        else
          nxt_state = RX_STATE;
        receiving = 1;
      end
    endcase
  end

///////////////////////////////////
// Continuous assignment follow //
/////////////////////////////////
assign shift = ~|baud_cnt;            //when the baud_cnt hits 0 do next shift
assign rx_data = rx_shift_reg[7:0];   

endmodule
