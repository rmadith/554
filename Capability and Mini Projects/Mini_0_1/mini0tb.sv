module MiniLabO_tb();


logic clk;
logic [3:0] KEY;
logic [9:0] SW, LEDR, test_rand;



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
  KEY [0] = 0;  // Reset
  @(negedge clk);
  KEY [0] = 1;
  SW = 10'b0100000010; 

  // Classical Test
  fork
	begin: test1
	  repeat(500) @(posedge clk);
	  $display("Test 1 Failed");
	end
	begin
	   @(posedge iDUT.we)
	   repeat (10) @(posedge clk);
	   if(SW === LEDR) begin
		$display("Test 1 Passed");
		disable test1;
	   end
	end
   join


  // Randomized test
  repeat(10000) begin
	test_rand = $urandom();
	SW = test_rand;
	repeat(100) @(posedge clk);
	if(LEDR !== SW) begin
		$display("Test Failed");
		$display("\t LEDR = %d, KEY = %d",LEDR, SW);
		$stop();
	end
  end

$display("All tests passed");
$stop();
end


always
#5 clk = ~clk;
endmodule
