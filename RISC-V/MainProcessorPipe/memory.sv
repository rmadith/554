`default_nettype none

module memory(
	///// INPUTS  /////
	input wire clk,
    input wire rst_n,
	input wire [31:0] execute_result_EXMEM_MEMWB,
	input wire memWrite_EXMEM_out,
	input wire memRead_EXMEM_MEMWB,
	input wire [31:0] regData2_EXMEM_out,
	input wire [2:0] memType_EXMEM_out,

	///// OUTPUTS  /////
	output logic [31:0] memReadRst_MEMWB_in
	
);

	logic [14:0] memAddr;
	assign memAddr = execute_result_EXMEM_MEMWB[14:0];
	
	logic memWrite;
	assign memWrite = memWrite_EXMEM_out;

	logic memRead;
	assign memRead = memRead_EXMEM_MEMWB;

	logic [31:0] memDataIn;
	assign memDataIn = regData2_EXMEM_out;

	logic [2:0] memType;
	assign memType = memType_EXMEM_out;

	logic [31:0] memDataOut;
	assign memReadRst_MEMWB_in = memDataOut;
	
	
	
	logic we0,we1,we2,we3;
	logic re0,re1,re2,re3;
	logic [7:0] rdata_bnk0,rdata_bnk1,rdata_bnk2,rdata_bnk3; 
	logic [7:0] wdata_bnk0,wdata_bnk1,wdata_bnk2,wdata_bnk3;
	
	dmem8 #("wiscv0.hex") iBNK0(.clk(clk),.addr(memAddr[14:2]),.re(re0 & memRead),.we(we0 & memWrite),.rdata(rdata_bnk0),.wdata(wdata_bnk0)); // 00
	dmem8 #("wiscv1.hex")iBNK1(.clk(clk),.addr(memAddr[14:2]),.re(re1 & memRead),.we(we1 & memWrite),.rdata(rdata_bnk1),.wdata(wdata_bnk1)); // 01
	dmem8 #("wiscv2.hex")iBNK2(.clk(clk),.addr(memAddr[14:2]),.re(re2 & memRead),.we(we2 & memWrite),.rdata(rdata_bnk2),.wdata(wdata_bnk2)); // 10
	dmem8 #("wiscv3.hex")iBNK3(.clk(clk),.addr(memAddr[14:2]),.re(re3 & memRead),.we(we3 & memWrite),.rdata(rdata_bnk3),.wdata(wdata_bnk3)); // 11	
	
	
	

	always @(*) begin 
		memDataOut = 0;
		wdata_bnk0 = 0;
		wdata_bnk1 = 0;
		wdata_bnk2 = 0;
		wdata_bnk3 = 0;

		we0 = 0;
		we1 = 0;
		we2 = 0;
		we3 = 0;

		re0 = 0;
		re1 = 0;
		re2 = 0;
		re3 = 0;
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






	/*
	reg [31:0]data_mem[0:65535];  // Uh this value should be very less ??
	reg [31:0] inter_memWrData;
	reg [31:0] inter_memData;

	logic [31:0] memDataOut;
	logic [31:0] memAddr;
	logic [31:0] wrt_data;

	assign memAddr = execute_result_EXMEM_MEMWB;

	assign wrt_data = regData2_EXMEM_out;

	// TODO: Check with Eric Hoffman if this is the right way to do our data memory. 
	
	////////////////////////////////////////////////
	// Model write, data is written on negedge clk //
	//////////////////////////////////////////////
	always @(negedge clk) begin
		if (memWrite_EXMEM_out && ~memRead_EXMEM_MEMWB) begin
			if (memType_EXMEM_out == 3'b010)
				data_mem[memAddr] <= wrt_data;
			else if (memType_EXMEM_out == 3'b000)
				data_mem[memAddr] <= {data_mem[memAddr][31:8], wrt_data[7:0]};
			else if (memType_EXMEM_out == 3'b001)
				data_mem[memAddr] <= {data_mem[memAddr][31:16], wrt_data[15:0]};
		end
			
	end
	
	
	///////////////////////////////////////////////
	// Model read, data is negedge  clock  //
	/////////////////////////////////////////////
	always @(negedge clk) begin
		if (memRead_EXMEM_MEMWB && ~memWrite_EXMEM_out)
			inter_memData <= data_mem[memAddr];
	end

	// This always_comb block infers a multiplexor that selects between the different formats for a load word.
	always_comb begin 
		memDataOut = 0;

		case(memType_EXMEM_out)
			3'b000: memDataOut = {{24{inter_memData[7]}},inter_memData[7:0]}; //LB
			3'b001: memDataOut = {{16{inter_memData[15]}},inter_memData[15:0]}; //LH
			3'b010: memDataOut = inter_memData; //LW
			3'b100: memDataOut = {24'h0,inter_memData[7:0]}; //LBU
			3'b101: memDataOut = {16'h0,inter_memData[15:0]}; //LHU
		endcase

	end
	
	assign memReadRst_MEMWB_in = memDataOut;

	*/

//endmodule


`default_nettype wire
