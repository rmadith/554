module BMP_ROM_BulletE(clk,addr,dout);

  input clk;     // 50MHz clock
  input [15:0] addr;
  output reg [5:0] dout;   // 5-bit color pixel out

  reg [5:0] rom[0:1027];

  initial
    $readmemb("images_out/BulletE.hex",rom);

  always @(posedge clk)
    dout <= rom[addr];

endmodule
