
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module MiniLab1(

	//////////// CLOCK //////////
	input 		          		clk,
	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
	inout 		    [35:0]		GPIO
);



//=======================================================
//  REG/WIRE declarations
//=======================================================
wire rst_n,iocs_n,re,we,iorw_n;
wire [7:0] inter_databus,databus;
wire [15:0] addr;
wire [1:0] ioaddr;
reset_synch rst(.RST_n(KEY[0]), .clk(clk), .rst_n(rst_n));

spart iSpart(.clk(clk), .rst_n(rst_n), .iocs_n(iocs_n), .iorw_n(iorw_n), .tx_q_full(), .rx_q_empty(), .ioaddr(ioaddr), .databus(inter_databus), .TX(GPIO[3]), .RX(GPIO[5]));

cpu iCPU(.clk(clk), .rst_n(rst_n), .rdata({{2{1'b0}}, inter_databus}), .wdata(databus), .re(re), .we(we), .addr(addr));

//=======================================================
//  Structural coding
//=======================================================


// GPIO[3] -- TX
// GPIO[5] -- RX


assign ioaddr = (addr == 16'hC004) ? 2'b00 :
		(addr == 16'hC005) ? 2'b01 : 
		(addr == 16'hC006) ? 2'b10 :
		(addr == 16'hC007) ? 2'b11 :
		2'bz;

assign iocs_n = ~((re | we) && (addr == 16'hC004 || addr == 16'hC005 || addr == 16'hC006 || addr == 16'hC007));
assign iorw_n = ~we;
assign inter_databus = (we) ? databus  : 8'bz;


endmodule
