module MiniProject1 (clk, RST_n, LED, SW, RX, TX);

input clk, RST_n; 
input RX;
input [9:0] SW;
output reg [9:0] LED; 
output TX;


wire rst_n;
reg [15:0]wdata, rdataSW, rdata;                //LED write data and switch read data
wire ex_we, ex_re;                              //external read and write enables
wire [15:0] addr;                               //address 
logic iocs_n, iorw_n, tx_q_full, rx_q_empty;    
wire [7:0] spart_databus;
logic [7:0] spart_databus_logic;

logic [1:0] ioaddr;

///////////////////
// Switch Input  //
///////////////////
assign rdataSW = {6'h00,SW};        // get the state of the switches

////////////////
// LED Output //
//////////////// 
always @(posedge clk, negedge rst_n) begin
    if (!rst_n) 
        LED <= '0;
    else if ((addr == 16'hC000) & ex_we)        //check to see if address is right and we are doing external write
        LED <= wdata[9:0];
end


assign rdata = (addr == 16'hC004 | addr == 16'hC005) ? ({8'h00,spart_databus}) : rdataSW;          // choose between the spart rdata and the switch read data
assign spart_databus_logic = (!iorw_n) ? wdata[7:0] : 8'hzz;                          // only assign to the spart databus when we are writing to the spart
assign iocs_n = !(ex_re | ex_we & (!iorw_n | addr == 16'hC005));                // chip read write/read enable only if we are dealing with SPART
assign iorw_n = !((addr == 16'hC004 & ex_we) | addr == 16'hC006 | addr == 16'hC007);      // write only if the dealing with the right SPART addresses

/*
always_comb begin           // case logic for choosing the right SPART ioaddr
    case(addr) 
        16'hC004: ioaddr = 2'b00;      // TX or RX buffer
                                         // Status Register
        16'hC006: ioaddr = 2'b10;      // Low Baudrate Write Buffer
        16'hC007: ioaddr = 2'b11;      // High Baudrate Write Buffer
        16'hC005: ioaddr = 2'b01;
    endcase
end
*/

assign ioaddr = (addr == 16'hC004) ? 2'b00 :
                (addr == 16'hC006) ? 2'b10 :
                (addr == 16'hC007) ? 2'b11 :
                2'b01;

///////////////////////
// Instantiate SPART //
///////////////////////

spart iSPART(
    .clk(clk),				
    .rst_n(rst_n),		        // asynch active low reset
    .iocs_n(iocs_n),			// active low chip select (decode address range)
    .iorw_n(iorw_n),			// high for read, low for write
    .tx_q_full(tx_q_full),		// indicates transmit queue is full
    .rx_q_empty(rx_q_empty),	// indicates receive queue is empty
    .ioaddr(ioaddr),		    // Read/write 1 of 4 internal 8-bit registers
    .databus(spart_databus),	// bi-directional data bus
    .TX(TX),			        // UART TX line
    .RX(RX)				        // UART RX line
);

assign spart_databus = spart_databus_logic;         // to make the inout nature of databus work


/////////////////////////
// Instantiate 552 CPU //
///////////////////////// 
cpu iCPU(.clk(clk), .rst_n(rst_n), .wdata(wdata) , .ex_re(ex_re), .ex_we(ex_we), .addr(addr), .rdata(rdata));

////////////////////////////////////
// Instantiate reset synchronizer //
//////////////////////////////////// 
rst_synch iRST (.RST_n(RST_n), .clk(clk), .rst_n(rst_n));



endmodule