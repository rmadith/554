module MiniLabO_tb();


logic clk;
logic [3:0] KEY;
logic [9:0] SW, LEDR;


mini_01 iDUT(
.CLOCK_50 (clk),
.CLOCK2_50 (),
.CLOCK3_50(),
.CLOCK4_50(),
.KEY (KEY) , 
.SW(SW),
.LEDR(LEDR));


initial begin
clk = 0;
KEY = '1;
SW =  '0;
@(posedge clk);
KEY [0] = 0;
@(negedge clk);
KEY [0] = 1;
SW = 10'b1010101010; 
repeat (100) @(posedge clk);
$stop;
end


always
#5 clk = ~clk;
endmodule

