module wb (memRead, memData, ALUResIn,outToReg);

        input wire [31:0] ALUResIn, memData;
	input wire memRead;
        output wire [31:0] outToReg;

        assign outToReg = (memRead) ? memData : ALUResIn;


endmodule

