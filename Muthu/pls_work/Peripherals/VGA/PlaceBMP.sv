module PlaceBMP(clk,rst_n,add_fnt,fnt_indx,add_img,rem_img,image_indx,
                xloc,yloc,waddr,wdata,we,busy);

  
  input clk,rst_n;
  input add_fnt;			// add a character
  input [5:0] fnt_indx;	// one of 42 characters
  // 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ =>,()
  input add_img;			// pulse high for one clock to add image
  input rem_img;			// pulse high for one clock to remove image
  input [5:0] image_indx; 	// index of image in image memory (64 possible)
  input [9:0] xloc;			// x location of image to register
  input [8:0] yloc;			// y location of image to register
  output reg [18:0] waddr;	// write address to videoMem
  output logic [5:0] wdata;	// write 6-bit pixel to videoMem
  output reg we;
  output logic busy;		// asserted if PlaceBMP is busy and cannot accept another command
							// this would be good to put into a status register if you memory map
							// this to your processor....which you should.
							
  localparam BACKGRND = 6'h3F;
    
  //////////////////////////////////////////
  // Declare any internal registers next //
  ////////////////////////////////////////
  reg [15:0] bmp_addr;				// address to local ROMs that contain images
  reg [15:0] bmp_addr_end;
  reg [13:0] font_addr;
  reg [3:0] font_x_cnt;
  reg [3:0] font_y_cnt;
  reg [9:0] xwid;					// stores x width of image
  reg [8:0] yhght_upper;
  reg [18:0] waddr_wrap;			// holds when to advance linear address into videoMem
  reg [5:0] indx;					// 
  reg [5:0] font_indx;				// 1 of 42
  reg rem;							// set if removing image
  
  typedef enum reg[3:0] {INIT,IDLE,ADV1,ADV2,XRD1,XRD2,YRD1,YRD2,WRT,WRT2} state_t;
  
  state_t state, nxt_state;
  
  ///////////////////////////
  // Outputs of SM follow //
  /////////////////////////  
  logic captureIndx,captureXwid,captureYwid,captureXwid2,captureYwid2;
  logic bmp_addr_inc;
  logic waddr_inc;
  logic fnt_addr_inc;
  logic rst_waddr;
  
  ///////////////////////////
  // Internal nets follow //
  /////////////////////////
wire [5:0] bmp_read0;
wire [5:0] bmp_read1;
wire [5:0] bmp_read2;
wire [5:0] bmp_read3;
wire [5:0] bmp_read4;
wire [5:0] bmp_read5;
wire [5:0] bmp_read6;
wire [5:0] bmp_read7;
wire [5:0] bmp_read8;
wire [5:0] bmp_read9;
wire [5:0] bmp_read10;
wire [5:0] bmp_read11;
wire [5:0] bmp_read12;
wire [5:0] bmp_read13;
wire [5:0] bmp_read14;
wire [5:0] bmp_read15;
wire [5:0] bmp_read16;
wire [5:0] bmp_read17;
wire [5:0] bmp_read18;
wire [5:0] bmp_read19;
wire [5:0] bmp_read20;
wire [5:0] bmp_read21;
wire [5:0] bmp_read22;
wire [5:0] bmp_read23;
wire [5:0] bmp_read24;
wire [5:0] bmp_read25;
wire [5:0] bmp_read26;
wire [5:0] bmp_read27;
wire [5:0] bmp_read28;
wire [5:0] bmp_read29;
wire [5:0] bmp_read30;
wire [5:0] bmp_read31;
wire [5:0] bmp_read32;
wire [5:0] bmp_read33;
wire [5:0] bmp_read34;
wire [5:0] bmp_read35;
wire [5:0] bmp_read36;
wire [5:0] bmp_read37;
wire [5:0] bmp_read38;
wire [5:0] bmp_read39;
wire [5:0] bmp_read40;
wire [5:0] bmp_read41;
  wire [5:0] bmp_read;			// muxed output from BMP ROM
  wire waddr_wrap_en;
  wire fnt_wrap;
 

  ////////////////////////////////////////////////////
  // capture x image width as read from image file //
  //////////////////////////////////////////////////  
  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n)
	  xwid <= 10'h000;
	else if (captureXwid)
	  xwid <= (bmp_read<<6);
	else if (captureXwid2)
	  xwid <= xwid + bmp_read;

  ///////////////////////////////////////////////////////////
  // capture y image upper height as read from image file //
  /////////////////////////////////////////////////////////
  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n)
	  yhght_upper <= 9'h000;
	else if (captureYwid)
	  yhght_upper <= (bmp_read<<6);

  ////////////////////////////////////////////////////
  // upon read of low byte of Yhght we can compute //
  // the end address of the bit map.              //
  /////////////////////////////////////////////////	  
  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n)
	  bmp_addr_end <= 16'h0000;
	else if (captureXwid2)
	  bmp_addr_end <= xwid + bmp_read;		// bmp_read is currently = xwidth
    else if (captureYwid2)
	  /// + 5 = 4-bytes overhead in xwid/ywid, one in advance for latency
      bmp_addr_end <= bmp_addr_end*(yhght_upper+bmp_read) + 16'd5;	

  //////////////////////////////////////////////////
  // Address of pixel being read from bitmap ROM //
  ////////////////////////////////////////////////	  
  always_ff @(posedge clk, negedge rst_n)
      if (!rst_n)
	    bmp_addr <= 16'h0000;
	  else if (captureIndx)
	    bmp_addr <= 16'h0000;
	  else if (bmp_addr_inc)
	    bmp_addr <= bmp_addr + 1;

  ////////////////////////////////////////////////
  // Address of pixel being read from font ROM //
  //////////////////////////////////////////////		
 always_ff @(posedge clk, negedge rst_n)
     if (!rst_n)
	    font_addr <= 16'h0000;
	  else if (captureIndx)
	    font_addr <= 4'd13*fnt_indx + 3;
	  else if (fnt_wrap)
	    font_addr <= font_addr + 10'd531;	// 544 - 13
	  else if (fnt_addr_inc)
	    font_addr <= font_addr + 1;

  ///////////////////////////////////////////////
  // Counts across our 13-pixel wide font map //
  /////////////////////////////////////////////		
 always_ff @(posedge clk, negedge rst_n)
     if (!rst_n)
	    font_x_cnt <= 4'h0;
	  else if (fnt_wrap | captureIndx)
	    font_x_cnt <= 4'h0;
	  else if (fnt_addr_inc)
	    font_x_cnt <= font_x_cnt + 1;
	  
 assign fnt_wrap = (font_x_cnt==4'd13) ? 1'b1 : 1'b0;

  ////////////////////////////////////////
  // Counts our Y position in font map //
  //////////////////////////////////////   
  always_ff @(posedge clk, negedge rst_n)
      if (!rst_n)
	    font_y_cnt <= 4'h0;
	  else if (captureIndx)
	    font_y_cnt <= 4'h0;
	  else if (fnt_wrap)
	    font_y_cnt <= font_y_cnt + 1;
 
  ///////////////////////////////////////////
  // Holds which BMP ROM we are accessing //
  ///////////////////////////////////////// 
  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n)
	  indx <= 'h00;
	else if (captureIndx)
	  indx <= image_indx;  

  ////////////////////////////////////////////////
  // Remember if command is to remove an image //
  //////////////////////////////////////////////	  
  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n)
	  rem <= 1'b0;
	else if (captureIndx)
	  rem <= rem_img;

  ////////////////////////////////////
  // write address to video memory //
  //////////////////////////////////		
  always_ff @(posedge clk, negedge rst_n)
      if (!rst_n)
	    waddr <= 19'h00000;
	  else if (captureIndx)
	    waddr <= yloc*10'd640 + xloc;
	  else if (waddr_wrap_en)
	    waddr <= waddr + (18'd641 - xwid);
	  else if (fnt_wrap)
	    waddr <= waddr + 18'd628;
	  else if (waddr_inc)
	    waddr <= waddr + 1;

  //////////////////////////////////////////////////
  // compute/store address at which we wrap from //
  // end of row of pixels in bmp to new row     //
  ///////////////////////////////////////////////
  always_ff @(posedge clk, negedge rst_n)
      if (!rst_n)
	    waddr_wrap <= 18'h00000;
	  else if (captureYwid)
	    waddr_wrap <= waddr + (xwid - 9'h001);
	  else if (waddr_wrap_en)
	    waddr_wrap <= waddr_wrap + 18'd640;
		
  assign waddr_wrap_en = (waddr==waddr_wrap) ? 1'b1 : 1'b0;

  //////////////////
  // State flops //
  ////////////////  
  always_ff @(posedge clk, negedge rst_n)
    if (!rst_n)
	  state <= INIT;
	else
	  state <= nxt_state;
  
  always_comb begin
    nxt_state = state;
    captureIndx = 0;
	captureXwid = 0;
	captureYwid = 0;
	captureXwid2 = 0;
	captureYwid2 = 0;
	bmp_addr_inc = 0;
	waddr_inc = 0;
	fnt_addr_inc = 0;
	we = 0;
	busy = 1;		// only not busy if in IDLE
	wdata = 6'hxxx;

	case (state)
	  INIT: begin
	    we = 1;
		 wdata = BACKGRND;
		 waddr_inc = 1;
		 if (waddr == 19'h4b000)
		   nxt_state = IDLE;
	  end
	  IDLE: begin
	    busy = 0;
	    if (add_img | rem_img) begin
		  captureIndx = 1;
		  nxt_state = ADV1;
		end else if (add_fnt) begin
		  captureIndx = 1;
		  nxt_state = ADV2;
		end
	  end
	  ADV1: begin	// this state is about advancing bmp_address
	    bmp_addr_inc = 1;
		nxt_state = XRD1;
	  end
	  ADV2: begin	// this state is about advancing bmp_address
	    fnt_addr_inc = 1;
		nxt_state = WRT2;
	  end
	  XRD1: begin
	    captureXwid = 1;
		bmp_addr_inc = 1;
		nxt_state = XRD2;
	  end
	  XRD2: begin
	    captureXwid2 = 1;
		bmp_addr_inc = 1;
		nxt_state = YRD1;
	  end
	  YRD1: begin
	    captureYwid = 1;
		bmp_addr_inc = 1;
		nxt_state = YRD2;
	  end
	  YRD2: begin
	    captureYwid2 = 1;
		bmp_addr_inc = 1;
		nxt_state = WRT;
	  end
	  WRT: begin
	    if (bmp_addr<bmp_addr_end) begin
		  bmp_addr_inc = 1;
		  wdata = (rem) ? BACKGRND : bmp_read;
		  we =  ((bmp_read==6'h024) ? 1'b0 : 1'b1);	// 128,64,32 is treated as transparent
		  waddr_inc = 1;
		end else
		  nxt_state = IDLE;
	  end
	  WRT2: begin
	    if ((font_y_cnt==4'd15) && (fnt_wrap))
		  nxt_state = IDLE;
		else if (fnt_wrap) begin
		  nxt_state = ADV2;
		end else begin
		  fnt_addr_inc = 1;
		  wdata = bmp_read;
		  we = (bmp_read==6'h024) ? 1'b0 : 1'b1;	// 128,64,32 is treated as transparent
		  waddr_inc = 1;
		end
	  end
	  default: nxt_state = IDLE;
	endcase
	  
  end
  
  /////////////////////////////////
  // BMP ROMs and mux are below //
  ///////////////////////////////
BMP_ROM_Brick_Block iROM0(.clk(clk), .addr(bmp_addr), .dout(bmp_read0));
BMP_ROM_BulletE iROM1(.clk(clk), .addr(bmp_addr), .dout(bmp_read1));
BMP_ROM_BulletN iROM2(.clk(clk), .addr(bmp_addr), .dout(bmp_read2));
BMP_ROM_BulletNE iROM3(.clk(clk), .addr(bmp_addr), .dout(bmp_read3));
BMP_ROM_BulletNW iROM4(.clk(clk), .addr(bmp_addr), .dout(bmp_read4));
BMP_ROM_BulletS iROM5(.clk(clk), .addr(bmp_addr), .dout(bmp_read5));
BMP_ROM_BulletSE iROM6(.clk(clk), .addr(bmp_addr), .dout(bmp_read6));
BMP_ROM_BulletSW iROM7(.clk(clk), .addr(bmp_addr), .dout(bmp_read7));
BMP_ROM_BulletW iROM8(.clk(clk), .addr(bmp_addr), .dout(bmp_read8));
//BMP_ROM_Crown iROM9(.clk(clk), .addr(bmp_addr), .dout(bmp_read9));
// BMP_ROM_EnemyBulletE iROM10(.clk(clk), .addr(bmp_addr), .dout(bmp_read10));
// BMP_ROM_EnemyBulletN iROM11(.clk(clk), .addr(bmp_addr), .dout(bmp_read11));
// BMP_ROM_EnemyBulletNE iROM12(.clk(clk), .addr(bmp_addr), .dout(bmp_read12));
// BMP_ROM_EnemyBulletNW iROM13(.clk(clk), .addr(bmp_addr), .dout(bmp_read13));
// BMP_ROM_EnemyBulletS iROM14(.clk(clk), .addr(bmp_addr), .dout(bmp_read14));
// BMP_ROM_EnemyBulletSE iROM15(.clk(clk), .addr(bmp_addr), .dout(bmp_read15));
// BMP_ROM_EnemyBulletSW iROM16(.clk(clk), .addr(bmp_addr), .dout(bmp_read16));
// BMP_ROM_EnemyBulletW iROM17(.clk(clk), .addr(bmp_addr), .dout(bmp_read17));
BMP_ROM_EnemyTankBaseEast iROM18(.clk(clk), .addr(bmp_addr), .dout(bmp_read18));
BMP_ROM_EnemyTankBaseNorth iROM19(.clk(clk), .addr(bmp_addr), .dout(bmp_read19));
BMP_ROM_EnemyTankBaseSouth iROM20(.clk(clk), .addr(bmp_addr), .dout(bmp_read20));
BMP_ROM_EnemyTankBaseWest iROM21(.clk(clk), .addr(bmp_addr), .dout(bmp_read21));
//BMP_ROM_EnemyTankGunE iROM22(.clk(clk), .addr(bmp_addr), .dout(bmp_read22));
//BMP_ROM_EnemyTankGunN iROM23(.clk(clk), .addr(bmp_addr), .dout(bmp_read23));
//BMP_ROM_EnemyTankGunNE iROM24(.clk(clk), .addr(bmp_addr), .dout(bmp_read24));
//BMP_ROM_EnemyTankGunNW iROM25(.clk(clk), .addr(bmp_addr), .dout(bmp_read25));
//BMP_ROM_EnemyTankGunS iROM26(.clk(clk), .addr(bmp_addr), .dout(bmp_read26));
//BMP_ROM_EnemyTankGunSE iROM27(.clk(clk), .addr(bmp_addr), .dout(bmp_read27));
//BMP_ROM_EnemyTankGunSW iROM28(.clk(clk), .addr(bmp_addr), .dout(bmp_read28));
//BMP_ROM_EnemyTankGunW iROM29(.clk(clk), .addr(bmp_addr), .dout(bmp_read29));
BMP_ROM_TankBaseEast iROM30(.clk(clk), .addr(bmp_addr), .dout(bmp_read30));
BMP_ROM_TankBaseNorth iROM31(.clk(clk), .addr(bmp_addr), .dout(bmp_read31));
BMP_ROM_TankBaseSouth iROM32(.clk(clk), .addr(bmp_addr), .dout(bmp_read32));
BMP_ROM_TankBaseWest iROM33(.clk(clk), .addr(bmp_addr), .dout(bmp_read33));
BMP_ROM_TankGunE iROM34(.clk(clk), .addr(bmp_addr), .dout(bmp_read34));
BMP_ROM_TankGunN iROM35(.clk(clk), .addr(bmp_addr), .dout(bmp_read35));
BMP_ROM_TankGunNE iROM36(.clk(clk), .addr(bmp_addr), .dout(bmp_read36));
BMP_ROM_TankGunNW iROM37(.clk(clk), .addr(bmp_addr), .dout(bmp_read37));
BMP_ROM_TankGunS iROM38(.clk(clk), .addr(bmp_addr), .dout(bmp_read38));
BMP_ROM_TankGunSE iROM39(.clk(clk), .addr(bmp_addr), .dout(bmp_read39));
BMP_ROM_TankGunSW iROM40(.clk(clk), .addr(bmp_addr), .dout(bmp_read40));
BMP_ROM_TankGunW iROM41(.clk(clk), .addr(bmp_addr), .dout(bmp_read41));
//
//wire [17:0] offset, addr;
//
//assign addr = {2'b0, bmp_addr} + offset;
//
//BMP_ROM iROM(.clk(clk), .addr(addr), .dout(bmp_read));
//
//
//assign offset = (indx == 6'd00) ? 6'd0 :
//                   (indx == 6'd01) ? 6'd4100 :
//                   (indx == 6'd02) ? 6'd5128 :
//                   (indx == 6'd03) ? 6'd6156 :
//                   (indx == 6'd04) ? 6'd7184 :
//                   (indx == 6'd05) ? 6'd8212 :
//                   (indx == 6'd06) ? 6'd9240 :
//                   (indx == 6'd07) ? 6'd10268 :
//                   (indx == 6'd08) ? 6'd11296 :
//                   (indx == 6'd09) ? 6'd12324 :
//                   (indx == 6'd010) ? 6'd16424 :
//                   (indx == 6'd011) ? 6'd17452 :
//                   (indx == 6'd012) ? 6'd18480 :
//                   (indx == 6'd013) ? 6'd19508 :
//                   (indx == 6'd014) ? 6'd20536 :
//                   (indx == 6'd015) ? 6'd21564 :
//                   (indx == 6'd016) ? 6'd22592 :
//                   (indx == 6'd017) ? 6'd23620 :
//                   (indx == 6'd018) ? 6'd24648 :
//                   (indx == 6'd019) ? 6'd28748 :
//                   (indx == 6'd020) ? 6'd32848 :
//                   (indx == 6'd021) ? 6'd36948 :
//                   (indx == 6'd022) ? 6'd41048 :
//                   (indx == 6'd023) ? 6'd45148 :
//                   (indx == 6'd024) ? 6'd49248 :
//                   (indx == 6'd025) ? 6'd53348 :
//                   (indx == 6'd026) ? 6'd57448 :
//                   (indx == 6'd027) ? 6'd61548 :
//                   (indx == 6'd028) ? 6'd65648 :
//                   (indx == 6'd029) ? 6'd69748 :
//                   (indx == 6'd030) ? 6'd73848 :
//                   (indx == 6'd031) ? 6'd77948 :
//                   (indx == 6'd032) ? 6'd82048 :
//                   (indx == 6'd033) ? 6'd86148 :
//                   (indx == 6'd034) ? 6'd90248 :
//                   (indx == 6'd035) ? 6'd94348 :
//                   (indx == 6'd036) ? 6'd98448 :
//                   (indx == 6'd037) ? 6'd102548 :
//                   (indx == 6'd038) ? 6'd106648 :
//                   (indx == 6'd039) ? 6'd110748 :
//                   (indx == 6'd040) ? 6'd114848 :
//                   (indx == 6'd041) ? 6'd118948 :
//                   'b0 ;



assign bmp_read = (indx === 6'd00) ? bmp_read0 :
                   (indx === 6'd01) ? bmp_read1 :
                   (indx === 6'd02) ? bmp_read2 :
                   (indx === 6'd03) ? bmp_read3 :
                   (indx === 6'd04) ? bmp_read4 :
                   (indx === 6'd05) ? bmp_read5 :
                   (indx === 6'd06) ? bmp_read6 :
                   (indx === 6'd07) ? bmp_read7 :
                   (indx === 6'd08) ? bmp_read8 :
                   (indx === 6'd09) ? 'b0 :
                   (indx === 6'd010) ? bmp_read10 :
                   (indx === 6'd011) ? bmp_read11 :
                   (indx === 6'd012) ? bmp_read12 :
                   (indx === 6'd013) ? bmp_read13 :
                   (indx === 6'd014) ? bmp_read14 :
                   (indx === 6'd015) ? bmp_read15 :
                   (indx === 6'd016) ? bmp_read16 :
                   (indx === 6'd017) ? bmp_read17 :
                   (indx === 6'd018) ? bmp_read18 :
                   (indx === 6'd019) ? bmp_read19 :
                   (indx === 6'd020) ? bmp_read20 :
                   (indx === 6'd021) ? bmp_read21 :
                   (indx === 6'd022) ? bmp_read22 :
                   (indx === 6'd023) ? bmp_read23 :
                   (indx === 6'd024) ? bmp_read24 :
                   (indx === 6'd025) ? bmp_read25 :
                   (indx === 6'd026) ? bmp_read26 :
                   (indx === 6'd027) ? bmp_read27 :
                   (indx === 6'd028) ? bmp_read28 :
                   (indx === 6'd029) ? bmp_read29 :
                   (indx === 6'd030) ? bmp_read30 :
                   (indx === 6'd031) ? bmp_read31 :
                   (indx === 6'd032) ? bmp_read32 :
                   (indx === 6'd033) ? bmp_read33 :
                   (indx === 6'd034) ? bmp_read34 :
                   (indx === 6'd035) ? bmp_read35 :
                   (indx === 6'd036) ? bmp_read36 :
                   (indx === 6'd037) ? bmp_read37 :
                   (indx === 6'd038) ? bmp_read38 :
                   (indx === 6'd039) ? bmp_read39 :
                   (indx === 6'd040) ? bmp_read40 :
                   (indx === 6'd041) ? bmp_read41 :
                   'b0 ;

				
endmodule