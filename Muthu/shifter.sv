module shifter(
    input [31:0] A, B,
    input [3:0] ALU_op,
    output [31:0] out
)

// Need to handle SRA, SRL, SLL

wire [31:0] shift_out;
wire [4:0] shift_amount;

assign shift_amount = B[4:0];

always_comb begin : shifter_block
    case(ALU_op)
        4'd2: begin // SLL
            case(shift_amount)
                5'd0: shift_out = A;
                5'd1: shift_out = A << 1;
                5'd2: shift_out = A << 2;
                5'd3: shift_out = A << 3;
                5'd4: shift_out = A << 4;
                5'd5: shift_out = A << 5;
                5'd6: shift_out = A << 6;
                5'd7: shift_out = A << 7;
                5'd8: shift_out = A << 8;
                5'd9: shift_out = A << 9;
                5'd10: shift_out = A << 10;
                5'd11: shift_out = A << 11;
                5'd12: shift_out = A << 12;
                5'd13: shift_out = A << 13;
                5'd14: shift_out = A << 14;
                5'd15: shift_out = A << 15;
                5'd16: shift_out = A << 16;
                5'd17: shift_out = A << 17;
                5'd18: shift_out = A << 18;
                5'd19: shift_out = A << 19;
                5'd20: shift_out = A << 20;
                5'd21: shift_out = A << 21;
                5'd22: shift_out = A << 22;
                5'd23: shift_out = A << 23;
                5'd24: shift_out = A << 24;
                5'd25: shift_out = A << 25;
                5'd26: shift_out = A << 26;
                5'd27: shift_out = A << 27;
                5'd28: shift_out = A << 28;
                5'd29: shift_out = A << 29;
                5'd30: shift_out = A << 30;
                5'd31: shift_out = A << 31;
                default: shift_out = 32'b0;
            endcase
        end
        4'd6: begin // SRL
            case(shift_amount)
                5'd0: shift_out = A;
                5'd1: shift_out = A >> 1;
                5'd2: shift_out = A >> 2;
                5'd3: shift_out = A >> 3;
                5'd4: shift_out = A >> 4;
                5'd5: shift_out = A >> 5;
                5'd6: shift_out = A >> 6;
                5'd7: shift_out = A >> 7;
                5'd8: shift_out = A >> 8;
                5'd9: shift_out = A >> 9;
                5'd10: shift_out = A >> 10;
                5'd11: shift_out = A >> 11;
                5'd12: shift_out = A >> 12;
                5'd13: shift_out = A >> 13;
                5'd14: shift_out = A >> 14;
                5'd15: shift_out = A >> 15;
                5'd16: shift_out = A >> 16;
                5'd17: shift_out = A >> 17;
                5'd18: shift_out = A >> 18;
                5'd19: shift_out = A >> 19;
                5'd20: shift_out = A >> 20;
                5'd21: shift_out = A >> 21;
                5'd22: shift_out = A >> 22;
                5'd23: shift_out = A >> 23;
                5'd24: shift_out = A >> 24;
                5'd25: shift_out = A >> 25;
                5'd26: shift_out = A >> 26;
                5'd27: shift_out = A >> 27;
                5'd28: shift_out = A >> 28;
                5'd29: shift_out = A >> 29;
                5'd30: shift_out = A >> 30;
                5'd31: shift_out = A >> 31;
                default: shift_out = 32'b0;
            endcase
        end
        4'd7: begin // SRA
            case(shift_amount)
                5'd0: shift_out = A;
                5'd1: shift_out = $signed(A) >>> 1;
                5'd2: shift_out = $signed(A) >>> 2;
                5'd3: shift_out = $signed(A) >>> 3;
                5'd4: shift_out = $signed(A) >>> 4;
                5'd5: shift_out = $signed(A) >>> 5;
                5'd6: shift_out = $signed(A) >>> 6;
                5'd7: shift_out = $signed(A) >>> 7;
                5'd8: shift_out = $signed(A) >>> 8;
                5'd9: shift_out = $signed(A) >>> 9;
                5'd10: shift_out = $signed(A) >>> 10;
                5'd11: shift_out = $signed(A) >>> 11;
                5'd12: shift_out = $signed(A) >>> 12;
                5'd13: shift_out = $signed(A) >>> 13;
                5'd14: shift_out = $signed(A) >>> 14;
                5'd15: shift_out = $signed(A) >>> 15;
                5'd16: shift_out = $signed(A) >>> 16;
                5'd17: shift_out = $signed(A) >>> 17;
                5'd18: shift_out = $signed(A) >>> 18;
                5'd19: shift_out = $signed(A) >>> 19;
                5'd20: shift_out = $signed(A) >>> 20;
                5'd21: shift_out = $signed(A) >>> 21;
                5'd22: shift_out = $signed(A) >>> 22;
                5'd23: shift_out = $signed(A) >>> 23;
                5'd24: shift_out = $signed(A) >>> 24;
                5'd25: shift_out = $signed(A) >>> 25;
                5'd26: shift_out = $signed(A) >>> 26;
                5'd27: shift_out = $signed(A) >>> 27;
                5'd28: shift_out = $signed(A) >>> 28;
                5'd29: shift_out = $signed(A) >>> 29;
                5'd30: shift_out = $signed(A) >>> 30;
                5'd31: shift_out = $signed(A) >>> 31;
                default: shift_out = 32'b0;
            endcase
        end
        default: begin
            out = 32'b0;
        end
    endcase
end



assign out = shift_out;

endmodule
