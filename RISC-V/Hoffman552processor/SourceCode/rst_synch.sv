module rst_synch(RST_n, clk, rst_n);

input RST_n;
input clk;
output logic rst_n;

logic q1;		//intermediate value for the double flop

//////////////////////////
// Double Flopped RST_n //
//////////////////////////
always_ff @(posedge clk or negedge RST_n) begin
	if(!RST_n) begin
		q1 <= 1'b0;
		rst_n <= 1'b0;
	end
	else begin
		q1 <= 1'b1;
		rst_n <= q1;
	end
end
	
endmodule