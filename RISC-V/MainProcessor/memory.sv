module memory(
	//Inputs
	clk,memType,memAddr,memRead,memWrite,memWrData,
	//Outputs
	memDataOut
	);
///////////////////////////////////////
/////////////// Inputs ///////////////
/////////////////////////////////////
input clk,memRead,memWrite;
input [2:0] memType;
input [31:0] memAddr,memWrData;

////////////////////////////////////////
/////////////// Outputs ///////////////
//////////////////////////////////////

output reg [31:0] memDataOut;	//output of data memory

////////////////////////////////////////
///////////////////////////////////////
//////////////////////////////////////
reg [31:0]data_mem[0:65535];  // Uh this value should be very less 
reg [31:0] inter_memWrData;
reg [31:0] inter_memData;

always @(*) begin 
	memDataOut = 0;
	inter_memWrData = 0;
	case(memType)
		3'b000: begin 
			inter_memWrData = {{24{memWrData[7]}},memWrData[7:0]}; // SB
			memDataOut = {{24{inter_memData[7]}},inter_memData[7:0]}; //LB
			end
		3'b001: begin 
			inter_memWrData = {{16{memWrData[15]}},memWrData[15:0]}; //SH
			memDataOut = {{16{inter_memData[15]}},inter_memData[15:0]}; //LH
			end
		3'b010: begin 
			inter_memWrData = memWrData; //SW
			memDataOut = inter_memData; //LW
			end
		3'b100: begin 
			memDataOut = {24'h0,inter_memData[7:0]}; //LBU
			end
		3'b101: begin 
			memDataOut = {16'h0,inter_memData[15:0]}; //LHU
			end


	endcase

end

///////////////////////////////////////////////
// Model read, data is ___________________  //
/////////////////////////////////////////////
always @(*) // not sure about the clock edge ??
  if (memRead && ~memWrite)
    inter_memData <= data_mem[memAddr[15:0]];
	
////////////////////////////////////////////////
// Model write, data is written on _________ //
//////////////////////////////////////////////
always @(*) // not sure about the clock edge ??
  if (memWrite && ~memRead)
    data_mem[memAddr[15:0]] <= inter_memWrData;



endmodule
