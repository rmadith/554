module extension_unit(
	//Input
	immType,inst,
	//Outputs
	immediate
	);
///////////////////////////////////////
/////////////// Inputs ///////////////
/////////////////////////////////////
input [2:0] immType;
input [31:0] inst;
////////////////////////////////////////
/////////////// Outputs ///////////////
//////////////////////////////////////
output reg [31:0] immediate;

always @(*) begin 
	case(immType) 
		3'b000: immediate = {{20{inst[31]}},inst[31:20]};  // I-immediate (sign-exntension)
		3'b001: immediate = 'h0;
		3'b010: immediate = {{20{inst[31]}},inst[31:25],inst[11:7]}; // S-immediate (sign-extension)
		3'b011: immediate = {{20{inst[31]}},inst[7],inst[30:25],inst[11:8]}; // B-immediate (sign-extension)
		3'b100: immediate = {inst[31:12],12'h0}; // U-immediate (zero-filled)
		3'b101: immediate = {{13{inst[31]}},inst[19:12],inst[20],inst[30:21]}; // J-immediate should it be 13 or 12
	endcase
end
endmodule
