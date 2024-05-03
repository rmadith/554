
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module player_1(

	//////////// ADC //////////
	output		          		ADC_CONVST,
	output		          		ADC_DIN,
	input 		          		ADC_DOUT,
	output		          		ADC_SCLK,

	//////////// Audio //////////
	input 		          		AUD_ADCDAT,
	inout 		          		AUD_ADCLRCK,
	inout 		          		AUD_BCLK,
	output		          		AUD_DACDAT,
	inout 		          		AUD_DACLRCK,
	output		          		AUD_XCK,

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// I2C for Audio and Video-In //////////
	output		          		FPGA_I2C_SCLK,
	inout 		          		FPGA_I2C_SDAT,

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

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
	inout 		    [14:0]		GPIO_1,
	input 			 done,
	inout 			 [35:17] GPIO
);



//=======================================================
//  REG/WIRE declarations
//=======================================================
wire [11:0] val;
wire rst_n;
wire in_done;
assign LEDR[9] = !rst_n;
wire [9:0] joy_send;

reset_synch iRST(.clk(CLOCK2_50),.RST_n(KEY[0]),.pll_locked(1'b1),.rst_n(rst_n));
//reset_synch iDONE(.clk(CLOCK2_50),.RST_n(done),.pll_locked(1'b1),.rst_n(in_done));


//=======================================================
//  Structural coding
//=======================================================
joystick ijoy (.ADC_CONVST(ADC_CONVST), .ADC_DIN(ADC_DIN), .ADC_DOUT(ADC_DOUT), 
					.ADC_SCLK(ADC_SCLK), .clk(CLOCK2_50), .rst_n(rst_n), .done({6{in_done}}), .val(val));
					
assign joy_send = {val[11:8],val[5:0]};

player_2 iPlayer(.clk(CLOCK2_50), .rst_n(rst_n), .TX(GPIO[33]), .RX(GPIO[35]), .joystick_data(joy_send), .done(in_done));

SEG7_LUT_6 	iseg(.oSEG0(HEX0),.oSEG1(HEX1), .oSEG2(HEX2),.oSEG3(HEX3), .oSEG4(HEX4),.oSEG5(HEX5), .iDIG(val));


endmodule
