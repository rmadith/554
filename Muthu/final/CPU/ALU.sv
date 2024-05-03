`default_nettype none

module ALU(
    input wire logic [31:0] A, 
    input wire logic[31:0] B,
    input wire logic[3:0] ALU_op,
    output logic [31:0] out
);


always_comb begin : ALU_block
    case(ALU_op)
        4'd0: out = A + B;
        4'd1: out = A - B;
        4'd2: out = A << B[4:0];
        4'd3: begin // SLT
            if($signed(A) < $signed(B)) begin
                out = 32'b1;
            end
            else begin
                out = 32'b0;
            end
        end
        4'd4: begin // SLTU
            if(A < B) begin
                out = 32'b1;
            end
            else begin
                out = 32'b0;
            end
        end
        4'd5: out = A ^ B;
        4'd6: out = A >> B[4:0]; // SRL
        4'd7: out = $signed(A) >>> B[4:0]; // SRA
        4'd8: out = A | B;
        4'd9: out = A & B;
        default: out = 32'b0;
    endcase
end


endmodule

`default_nettype wire
