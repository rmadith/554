module spart(
    input clk,				// 50MHz clk
    input rst_n,			// asynch active low reset
    input iocs_n,			// active low chip select (decode address range)
    input iorw_n,			// high for read, low for write
    output tx_q_full,		// indicates transmit queue is full
    output rx_q_empty,		// indicates receive queue is empty
    input [1:0] ioaddr,		// Read/write 1 of 4 internal 8-bit registers
    inout [7:0] databus,	// bi-directional data bus
    output TX,				// UART TX line
    input RX				// UART RX line
    );

logic [12:0] baudrate;                              // baudrate tp be used in the UART RX/TX
logic [3:0] read_pointer_RX, write_pointer_RX;      // pointers for the buffer, the MSB is used to track number of times around the buffer
logic [3:0] read_pointer_TX, write_pointer_TX;      // pointers for the buffer, the MSB is used to track number of times around the buffer
logic [7:0] circular_buffer_RX [0:7];               // buffer for the RX data
logic [7:0] circular_buffer_TX [0:7];               // buffer for the TX data

logic [7:0] rx_data, tx_data;               // data used with the buffer, RX is input for the RX buffer, and TX is the output of the TX bufffer
logic rdy;                                  // see if there is data in rx_data to input into the buffer
logic tx_done;                              // Asserted when byte is done transmitting. Stays high till next byte transmitted. 
logic flop_tx_done;                         // due to tx_done being high for two clk cylces, use a flop to detect a falling edge
logic trmt;                                 // assert to 1 to initate transmission for 1 cycle
logic clr_rdy;                              // knocks down rdy when asserted
logic flop_rdy;                             // due to rdy being high for two clk cylces, use a flop to detect a falling edge
logic first_time_TX;                        // used for first time of transmit without using tx_done
logic [7:0] status_register_val;            // the value that will be connected to the bus if the status register is read.


//////////////////////////////
// Instantiation of UART RX //
//////////////////////////////
UART_rx iRX(.clk(clk), .rst_n(rst_n), .RX(RX), .clr_rdy(clr_rdy), .rx_data(rx_data), .rdy(rdy), .baudrate(baudrate));

//////////////////////////////
// Instantiation of UART TX //
//////////////////////////////
UART_tx iTX(.clk(clk), .rst_n(rst_n), .tx_data(tx_data), .trmt(trmt), .tx_done(tx_done), .TX(TX), .baudrate(baudrate));

////////////////////////////////////////
// Assign Logic for status of Buffers //
////////////////////////////////////////
assign rx_q_empty = (read_pointer_RX == write_pointer_RX) ? 1'b1 : 1'b0;     //empty buffer if MSB of read and write pointer is the same
assign rx_q_full = ((read_pointer_RX[2:0] == write_pointer_RX[2:0]) && ~(read_pointer_RX[3] == write_pointer_RX[3])) ? 1'b1 : 1'b0;     //full buffer if MSB of read and write pointer is the different

assign tx_q_empty = (read_pointer_TX == write_pointer_TX) ? 1'b1 : 1'b0;     //empty buffer if MSB of read and write pointer is the same
assign tx_q_full = ((read_pointer_TX[2:0] == write_pointer_TX[2:0]) && ~(read_pointer_TX[3] == write_pointer_TX[3])) ? 1'b1 : 1'b0;     //full buffer if MSB of read and write pointer is the different



assign databus = (iorw_n && ioaddr == 2'b01 && ~iocs_n) ? status_register_val : // read from RX buffer
                (iorw_n && ioaddr == 2'b00 && ~rx_q_empty && ~iocs_n) ? circular_buffer_RX[read_pointer_RX[2:0]] // read from status register
                        : 8'hzz;         // otherwise we're not driving the bus.

//////////////
// Flop rdy //
//////////////
always @(posedge clk)begin
    flop_rdy <= rdy;
end

//////////////////
// Flop tx_done //
//////////////////
always @(posedge clk)begin
    flop_tx_done <= tx_done;
end

/////////////////////
// Baudrate Config //
/////////////////////
always @(posedge clk, negedge rst_n) begin
    if(!(rst_n))                        //on reset set baudrate to 0x1b2 or 115200
        baudrate <= 13'h01b2;     
    else if(ioaddr == 2'b10 && ~iocs_n)            //write the lower division buffer of baudrate
        baudrate[7:0] <= databus;
    else if(ioaddr == 2'b11 && ~iocs_n)            //write the upper division buffer of baudrate
        baudrate[12:8] <= databus[4:0];
end

///////////////////////////////////////////////////////////////////
// Combinational logic block to determine status register value //
/////////////////////////////////////////////////////////////////
always_comb begin
    // if the write pointer is before the read pointer or they're at the same position but one
    // has wrapped around more than the other, then we have to add 8 to account for the wrap around locations being full.
    if ((write_pointer_TX[2:0] <= read_pointer_TX[2:0]) & (write_pointer_TX[3] ^ read_pointer_TX[3]))  
        // consider equation for RX case. Then to BUFFSIZE - <that equation> will simplify to this equation.
        status_register_val[7:4] <= (read_pointer_TX[2:0] - write_pointer_TX[2:0]);
    else
        // consider equation for RX case. Then to BUFFSIZE - <that equation> will simplify to this equation.
        status_register_val[7:4] <=  (read_pointer_TX[2:0] - write_pointer_TX[2:0]) + 4'h8;


    // if the write pointer is before the read pointer or they're at the same position but one
    // has wrapped around more than the other, then we have to add 8 to account for the wrap around locations being full.
    if ((write_pointer_RX[2:0] <= read_pointer_RX[2:0]) & (write_pointer_RX[3] ^ read_pointer_RX[3]))  
        status_register_val[3:0] <= (write_pointer_RX[2:0] - read_pointer_RX[2:0]) + 4'h8;
    else
        status_register_val[3:0] <= write_pointer_RX[2:0] - read_pointer_RX[2:0];
end

/////////////////////////
// Circular Buffer TX //
///////////////////////
always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        read_pointer_TX <= '0;       // reset the read pointer to 0 address in the buffer
        write_pointer_TX <= '0;       // reset the write pointer to 0 address in the buffer
        first_time_TX <= 1'b1;  // used on first consume of tx_data
    end
    else begin 

        trmt <= 1'b0; // by default we're not transmitting.

        //PRODUCER: input into buffer
        if(~iorw_n && ioaddr == 2'b00 && ~tx_q_full && ~iocs_n) begin 
            circular_buffer_TX[write_pointer_TX[2:0]] <= databus;       // write databus into the TX buffer
            write_pointer_TX <= write_pointer_TX +1;        
        end
        //CONSUMMER: output of buffer into UART_tx 
        if((first_time_TX | (~trmt & tx_done)) && ~tx_q_empty) begin 
            tx_data <= circular_buffer_TX[read_pointer_TX[2:0]];        // read from the TX buffer
            read_pointer_TX <= read_pointer_TX +1;
            first_time_TX <= 1'b0;
            trmt <= 1'b1;
        end 
    end
end

////////////////////////
// Circular Buffer RX //
////////////////////////
always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        read_pointer_RX <= '0;       // reset the read pointer to 0 address in the buffer
        write_pointer_RX <= '0;       // reset the write pointer to 0 address in the buffer
    end
    else begin 

        clr_rdy <= 1'b0; // by default we're not transmitting.

        //PRODUCER: Store RX data from UART module into the buffer.
        if(flop_rdy && ~rdy && ~rx_q_full) begin 
            circular_buffer_RX[write_pointer_RX[2:0]] <= rx_data;       // write the data from UART RX into the RX buffer
            write_pointer_RX <= write_pointer_RX +1;
            clr_rdy <= 1'b1;
        end

        // clear rdy signal on UART module.
        if (rdy) begin
            clr_rdy <= 1'b1;
        end
        //CONSUMER: we need to update the read pointer for RX if the CPU does a read.
        if(iorw_n && ioaddr == 2'b00 && ~rx_q_empty && ~iocs_n) begin   // read from the RX buffer
            read_pointer_RX <= read_pointer_RX +1;
        end
    end
end

endmodule
