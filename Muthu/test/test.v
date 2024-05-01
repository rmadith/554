
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module test(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

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
wire [11:0] val;
wire done;
wire rst_n;
wire [9:0] joystick_2;
wire [9:0] joystick_2_in;

assign LEDR[9] = rst_n;

assign joystick_2_in = {GPIO[35], GPIO[33], GPIO[31], GPIO[29], GPIO[27], GPIO[25], GPIO[23], GPIO[21], GPIO[19], GPIO[17]};

reset_synch iRST(.clk(CLOCK2_50),.RST_n(KEY[0]),.pll_locked(1'b1),.rst_n(rst_n));
reset_synch iDONE(.clk(CLOCK2_50),.RST_n(KEY[1]),.pll_locked(1'b1),.rst_n(done));
reset_synch iData [9:0](.RST_n(joystick_2_in), .clk(clk), .rst_n(joystick_2), .pll_locked(1'b1));

SEG7_LUT_6 	iseg (.oSEG0(HEX0),.oSEG1(HEX1), .oSEG2(HEX2),.oSEG3(HEX3), .oSEG4(HEX4),.oSEG5(HEX5), .iDIG(joystick_2));

assign GPIO[15] = !done;

//=======================================================
//  Structural coding
//=======================================================



endmodule
