module BMP_ROM(clk,addr,dout);

  input clk;     // 50MHz clock
  input [17:0] addr;
  output reg [5:0] dout;   // 5-bit color pixel out

  reg [5:0] rom[0:123047];

  initial
    $readmemb("Peripherals/rom.hex",rom);

  always @(posedge clk)
    dout <= rom[addr];

endmodule
