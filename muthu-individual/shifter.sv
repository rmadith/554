module shifter(
    input [31:0] A, B,
    input [3:0] ALU_op,
    output [31:0] out
)

// Need to handle SRA, SRL, SLL

wire [31:0] shift_out;
wire [4:0] shift_amount;
assign shift_amount = ALU_op;



assign out = shift_out;

endmodule
