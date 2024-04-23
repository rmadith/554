module BMP_ROM_EnemyBulletE(clk,addr,dout);

  input clk;     // 50MHz clock
  input [15:0] addr;
  output reg [5:0] dout;   // 5-bit color pixel out

  reg [5:0] rom[0:171];

  initial
    $readmemh("images_out/EnemyBulletE.hex",rom);

  always @(posedge clk)
    dout <= rom[addr];

endmodule
