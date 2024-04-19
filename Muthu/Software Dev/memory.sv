`default_nettype none

module memory(
	///// INPUTS  /////
	input wire clk,
	input wire [14:0] memAddr,
	input wire memWrite,
	input wire memRead,
	input wire [31:0] memDataIn,
	input wire [2:0] memType,

	///// OUTPUTS  /////
	output logic [31:0] memDataOut


    // Bootloader ////
    //input wire debug, 
    // input wire [31:0] data_cpu, waddr_cpu
);


	
	logic we0,we1,we2,we3;
	logic re0,re1,re2,re3;
	logic [7:0] rdata_bnk0,rdata_bnk1,rdata_bnk2,rdata_bnk3; 
	logic [7:0] wdata_bnk0,wdata_bnk1,wdata_bnk2,wdata_bnk3;
	
	dmem8 iBNK0(.clk(clk),.addr(memAddr[14:2]),.re(re0 & memRead),.we(we0 & memWrite),.rdata(rdata_bnk0),.wdata(wdata_bnk0)); // 00
	dmem8 iBNK1(.clk(clk),.addr(memAddr[14:2]),.re(re1 & memRead),.we(we1 & memWrite),.rdata(rdata_bnk1),.wdata(wdata_bnk1)); // 01
	dmem8 iBNK2(.clk(clk),.addr(memAddr[14:2]),.re(re2 & memRead),.we(we2 & memWrite),.rdata(rdata_bnk2),.wdata(wdata_bnk2)); // 10
	dmem8 iBNK3(.clk(clk),.addr(memAddr[14:2]),.re(re3 & memRead),.we(we3 & memWrite),.rdata(rdata_bnk3),.wdata(wdata_bnk3)); // 11	
	
	
	

	always @(*) begin 
		memDataOut = 0;
		wdata_bnk0 = 0;
		wdata_bnk1 = 0;
		wdata_bnk2 = 0;
		wdata_bnk3 = 0;

		case(memType)
			3'b000: begin 
				case (memAddr[1:0]) // SB and LB 
					2'b00: begin 
					       re0 = 1'b1;
				       	       we0 = 1'b1;
				 	       wdata_bnk0 = memDataIn[7:0]; // Store 
					       memDataOut = {{24{rdata_bnk0[7]}},rdata_bnk0}; //Load  	       
					       end
					2'b01: begin
					       re1 = 1'b1;
				       	       we1 = 1'b1;
					       wdata_bnk1 = memDataIn[7:0];
					       memDataOut = {{24{rdata_bnk1[7]}},rdata_bnk1}; 	       
					       end
					2'b10: begin 
					       re2 = 1'b1;
				       	       we2 = 1'b1;
					       wdata_bnk2 = memDataIn[7:0];
					       memDataOut = {{24{rdata_bnk2[7]}},rdata_bnk2}; 	       
					       end
					2'b11: begin
					       re3 = 1'b1;
				       	       we3 = 1'b1;
					       wdata_bnk3 = memDataIn[7:0];
					       memDataOut = {{24{rdata_bnk3[7]}},rdata_bnk3};	       
				       	       end
				endcase
				end

			3'b001: begin 
				case (memAddr[1]) // SH and LH 
					1'b0: begin 
						re0 = 1'b1;
						re1 = 1'b1;
						we0 = 1'b1;
						we1 = 1'b1;
						wdata_bnk0 = memDataIn[7:0];
						wdata_bnk1 = memDataIn[15:8];
						memDataOut = {{16{rdata_bnk1[7]}},rdata_bnk1,rdata_bnk0};
					      end
					1'b1: begin 
						re2 = 1'b1;
						re3 = 1'b1;
						we2 = 1'b1;
						we3 = 1'b1;
						wdata_bnk2 = memDataIn[7:0];
						wdata_bnk3 = memDataIn [15:8]; 
						memDataOut = {{16{rdata_bnk3[7]}},rdata_bnk3,rdata_bnk2};
					      end
				endcase
				end
			3'b010: begin // LW and SW 
				re0 = 1'b1;
				re1 = 1'b1;
				re2 = 1'b1;
				re3 = 1'b1;

				we0 = 1'b1;
				we1 = 1'b1;
				we2 = 1'b1;
				we3 = 1'b1;

				wdata_bnk0 = memDataIn[7:0];
				wdata_bnk1 = memDataIn[15:8];
				wdata_bnk2 = memDataIn[23:16];
				wdata_bnk3 = memDataIn[31: 24];

				memDataOut = {rdata_bnk3,rdata_bnk2,rdata_bnk1,rdata_bnk0}; 
				end
			3'b100: begin 
				case (memAddr[1:0]) //LBU 
					2'b00: begin 
					       re0 = 1'b1;
					       memDataOut = {24'h0,rdata_bnk0}; //Load  	       
					       end
					2'b01: begin
					       re1 = 1'b1;
					       memDataOut = {24'h0,rdata_bnk1}; 	       
					       end
					2'b10: begin 
					       re2 = 1'b1;
					       memDataOut = {24'h0,rdata_bnk2}; 	       
					       end
					2'b11: begin
					       re3 = 1'b1;
					       memDataOut = {24'h0,rdata_bnk3};	       
				       	       end
				endcase
				end
			3'b101: begin 
				case (memAddr[1]) // LHU 
					1'b0: begin 
						re0 = 1'b1;
						re1 = 1'b1;
						memDataOut = {16'h0,rdata_bnk1,rdata_bnk0};
					      end
					1'b1: begin 
						re2 = 1'b1;
						re3 = 1'b1;
						memDataOut = {16'h0,rdata_bnk3,rdata_bnk2};
					      end
				endcase
				end
			default: memDataOut = 'b0;

		endcase

	end


endmodule


`default_nettype wire
