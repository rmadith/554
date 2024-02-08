
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module mini_01(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// LED //////////
	output		 reg    [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

 reg [9:0] rdat;
 wire [9:0] wdat;
 wire re, we;
 wire rst_n;
 

 always @(negedge CLOCK_50)
	if(re)
	  rdat <= SW;
	  
 always @(posedge CLOCK_50)
	if(we)
	  LEDR <= wdat;
	

	
 reset_synch rst(.RST_n(KEY[0]), .clk(CLOCK_50), .rst_n(rst_n));
 cpu mycpu(.clk(CLOCK_50),.rst_n(rst_n),.rdata(rdat),.we(we),.re(re),.wdata(wdat),.addr());


//=======================================================
//  Structural coding
//=======================================================



endmodule
