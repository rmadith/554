//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    spart
// Project Name:
// Target Devices: DE1_SOC board
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module spart(
    input clk,                          // 50MHz clk
    input rst_n,                        // asynch active low reset
    input iocs_n,                       // active low chip select (decode address range)
    input iorw_n,                       // high for read, low for write
    output tx_q_full,           // indicates transmit queue is full
    output rx_q_empty,          // indicates receive queue is empty
    input [1:0] ioaddr,         // Read/write 1 of 4 internal 8-bit registers
    inout logic [7:0] databus,        // bi-directional data bus
    output TX,                          // UART TX line
    input RX                            // UART RX line
    );

logic add_tx,remove_rx;
logic rx_rdy;
logic tx_q_empty;
logic rx_q_full;
logic tx_done;

logic [12:0] DB;
logic [12:0] inter_DB;
logic [7:0] rx_data, tx_data;
logic [4:0] tx_queue, rx_queue;
logic [7:0] inter_databus;
logic [1:0] inter_ioaddr;

circular_queue iTxQueue(.clk(clk),.rst_n(rst_n),.data_in(inter_databus),.add(add_tx),.remove(tx_done),.data_out(tx_data),.q_full(tx_q_full),.q_empty(tx_q_empty), .remaining(tx_queue));
circular_queue iRxQueue(.clk(clk),.rst_n(rst_n),.data_in(rx_data),.add(rx_rdy),.remove(remove_rx),.data_out(inter_databus),.q_full(rx_q_full),.q_empty(rx_q_empty), .containing(rx_queue));

UART iUART(.clk(clk),.rst_n(rst_n),.RX(RX),.TX(TX),.rx_rdy(rx_rdy),.clr_rx_rdy(),.rx_data(rx_data),.trmt(!tx_q_empty),.tx_data(tx_data),.tx_done(tx_done), .baud(DB));


assign inter_ioaddr = (!iocs_n) ? ioaddr : 2'bz;
assign databus = (iorw_n && !iocs_n) ? inter_databus : 8'bz;

always @(posedge clk, negedge rst_n) 
     if(!rst_n)
	DB = 'h1b2;
     else
	DB = inter_DB;


always_comb begin
    add_tx = 0;
    remove_rx = 0;
    inter_databus = 8'bz;

    case(inter_ioaddr) inside
        00: if(iorw_n) remove_rx = 1;
            else add_tx = 1;
        01: inter_databus = {tx_queue, rx_queue};
        10: if(iorw_n) inter_databus = DB[7:0];
            else inter_DB[7:0] = databus;
        11: if(iorw_n) inter_databus = DB[12:8];
            else inter_DB[12:8] = databus;
        default: inter_databus = 8'bzzzzzzz;
     endcase
end


endmodule
