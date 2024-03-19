module fetch (clk, rst_n,flush, Branch_PC,PC_in, PC_out, inst, old_PC,PC_en);
	
	input wire clk, rst_n,flush,PC_en;
	input wire [31:0] PC_in, Branch_PC;
	output wire [31:0] PC_out,old_PC;
	output reg [31:0] inst;

	logic [31:0] nextPC,PC;

    reg [31:0]instr_mem[0:65535];   // 2 ^ 16

    initial begin
        $readmemh("test.hex",instr_mem);
    end
    
    ///////////////////////////////
    // Program Counter is floped //
    ///////////////////////////////

    always @ (posedge clk, negedge rst_n) begin
        if (!rst_n)
            PC <= 32'h0;    // Reset program counter to 0
        else if (PC_en)  
            PC <= (flush) ? Branch_PC : PC_in;   // update PC accordingly // flush is branch take variable
    end


    /////////////////////////////////
    // Memory is floped on _______ //
    /////////////////////////////////
// should it be negedge clk ??
    assign inst = instr_mem[PC>>2]; // PC/4 (PC >>2) if increament by 4
   
    assign old_PC = PC;
    assign PC_out = PC + 4; // increament by 4 bytes (32 bit instruction set)

endmodule
