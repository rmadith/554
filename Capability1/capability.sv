// module capability(


// 	//////////// CLOCK //////////
// 	input 		          		CLOCK2_50,
// 	input 		          		CLOCK3_50,
// 	input 		          		CLOCK4_50,
// 	input 		          		REF_CLK,
	
// 		//////////// KEY //////////
// 	input 						RST_n,	// this is KEY[0]

// 	//////////// LED //////////
// 	output		     [9:0]		LEDR,

// 	//////////// VGA //////////
// 	output		          		VGA_BLANK_N,
// 	output		     [7:0]		VGA_B,
// 	output		          		VGA_CLK,
// 	output		     [7:0]		VGA_G,
// 	output		          		VGA_HS,
// 	output		     [7:0]		VGA_R,
// 	output		          		VGA_SYNC_N,
// 	output		          		VGA_VS
// );


//   localparam BMP_CTL = 16'hC008;
//   localparam BMP_XLOC =  16'hC009;
//   localparam BMP_YLOC =  16'hC00A;
//   localparam BMP_STAT = 16'hC00B;
 
//   logic clk, rst_n;
//   logic [9:0] xloc, yloc;
  
//   logic add_fnt;
//   logic [5:0] fnt_indx;
//   logic add_img;
//   logic [4:0] image_indx;
//   logic rem_img;
//   logic busy;
  
//   wire we_cpu, re;
//   wire [15:0] databus;
//   wire [15:0] addr;  
//   wire [15:0] inter_rdata;

//   reset_synch iRST(.clk(REF_CLK),.RST_n(RST_n), .rst_n(rst_n));

//   BMP_display iDUT(.CLOCK2_50(CLOCK2_50), .CLOCK3_50(CLOCK3_50), .CLOCK4_50(CLOCK4_50), .REF_CLK(REF_CLK), .RST_n(RST_n), .LEDR(LEDR), .VGA_BLANK_N(VGA_BLANK_N), .VGA_B(VGA_B), .VGA_CLK(VGA_CLK), .VGA_G(VGA_G), .VGA_HS(VGA_HS), .VGA_R(VGA_R), .VGA_SYNC_N(VGA_SYNC_N), .VGA_VS(VGA_VS), .xloc(xloc), .yloc(yloc), .add_fnt(add_fnt), .fnt_indx(fnt_indx), .add_img(add_img), .image_indx(image_indx), .rem_img(rem_img), .busy(busy));

//   cpu iCPU(.clk(REF_CLK), .rst_n(rst_n), .rdata(inter_rdata), .wdata(databus), .re(re), .we(we_cpu), .addr(addr));


//   // Updating Xloc
//   always @(posedge REF_CLK, negedge rst_n)
//     if(!rst_n)
//       xloc = 'b0;
//     else if(addr == BMP_XLOC && we_cpu)
//       xloc = databus[9:0];


//   // Update Yloc
//   always @(posedge REF_CLK, negedge rst_n)
//     if(!rst_n)
//       yloc = 'b0;
//     else if(addr == BMP_YLOC && we_cpu)
//       yloc = databus[9:0];

//   // Updating BMP_CTL. Doing it this way allows us to deassert when we move to the next instruction. 
//   // Saving us on one instruction cycle
//   assign add_fnt = (addr == BMP_CTL && we_cpu) ? databus[15] : 1'b0;
//   assign fnt_indx = (addr == BMP_CTL && we_cpu) ? databus[14:9] : 'b0;
//   assign add_img = (addr == BMP_CTL && we_cpu) ? databus[6] : 'b0;
//   assign image_indx = (addr == BMP_CTL  && we_cpu) ? databus[4:0] : 5'h01;
//   assign rem_img = (addr == BMP_CTL && we_cpu) ? databus[5] : 1'b0;


//   // Mux for rdata so that it can be expanded in the future
//   assign inter_rdata = (addr == BMP_STAT && re) ? {{15{1'h0}}, busy} : 1'b0;



// endmodule
