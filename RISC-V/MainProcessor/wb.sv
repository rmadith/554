module wb (memRead, memData, ALUResIn,writeBackData);

        input wire [31:0] ALUResIn, memData;
	input wire memRead;
        output wire [31:0] writeBackData;

        assign writeBackData = (memRead) ? memData : ALUResIn;


endmodule

