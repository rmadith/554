
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
wire inter_rst_n, rst_n,iocs_n,re,we,iorw_n, debug;
wire [15:0] inter_databus,databus;
wire [15:0] addr;
wire [1:0] ioaddr;

reset_synch irst(.RST_n(KEY[0]), .clk(clk), .rst_n(inter_rst_n));
reset_synch idebug(.RST_n(KEY[1]), .clk(clk), .rst_n(debug));

assign rst_n = debug | inter_rst_n;

cpu iCPU(.clk(clk), .rst_n(rst_n), .rdata({{2{1'b0}}, inter_databus[7:0]}), .wdata(databus), .re(re), .we(we), .oaddr(addr), .debug(debug), .wr_data());



endmodule
