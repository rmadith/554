module wb (MemToReg, JALInst, ALUResIn, memReadOut, next_PC, outToReg, RegWriteSel, RegWriteSelOut, RegWriteEn, RegWriteEnOut);

        input wire MemToReg, JALInst, RegWriteEn;
        input wire [15:0] ALUResIn, memReadOut, next_PC;
        input wire [2:0] RegWriteSel;

        output wire [15:0] outToReg;
        output wire [2:0] RegWriteSelOut;
        output wire RegWriteEnOut;

        assign outToReg = JALInst ? (next_PC) : (MemToReg ? (memReadOut) : (ALUResIn));

        assign RegWriteEnOut = RegWriteEn;
        assign RegWriteSelOut = RegWriteSel;




endmodule

