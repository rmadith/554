module reset_synch(input RST_n, input clk, output reg rst_n);

reg inter_rst_n;

// flopping incoming reset signal
always_ff @(negedge clk, negedge RST_n)
  if(!RST_n) begin
      inter_rst_n <= 1'b0;
      rst_n <= 1'b0;
  end

  else begin
      inter_rst_n <= 1'b1; // double flopping for metastability
      rst_n <= inter_rst_n;
  end

endmodule