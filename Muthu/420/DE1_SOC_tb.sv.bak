module cpu_tb();

logic clk, rst_n, state;
logic [31:0] boot_addr, boot_data, memMappedAddr, memMappedDataOut;
logic write;

// Bootloader
bootloader iboot (.clk(clk), .rst_n(rst_n), .debug(state), .addr(boot_addr), .data(boot_data), 
					.increment(), .RX(), .TX(), .outdata(memMappedDataOut), .write(write));

logic cpu_rst_n;
assign cpu_rst_n = (state) ? 1'b0 : rst_n;
// CPU
cpu iCPU(.clk(clk), .rst_n(rst_n && (~state)), .boot_addr(boot_addr), .boot_data(boot_data), 
			.debug(state), .memMappedAddr(memMappedAddr), .memMappedDataOut(memMappedDataOut), .joystick_data(), .halt());

// Memory Mapping
always_comb begin
	write = 0;
	// we_cpu = 0;
	case(memMappedAddr)
		32'hFFFFC001: 	write = 1;								// TX from bootloader to Macbook
		//32'hFFFFC002: 	done = memMappedDataOut[5:0];			// Write to joystick
		// BMP_CTL: 		we_cpu = 1;
		// BMP_YLOC: 		we_cpu = 1;
		// BMP_XLOC: 		we_cpu = 1;
		default: 		write = 0;
	endcase
end

initial begin
    clk = 0;
    state = 0;
    @(negedge clk) rst_n = 0;
    @(negedge clk) rst_n = 1;
    repeat(5) @(posedge clk);
    @(posedge clk) state = 1;
    repeat(5) @(posedge clk);
    @(posedge clk) state = 0;
    repeat(1000) @(posedge clk);
    $stop();
end

always 
    #1 clk = ~clk;


endmodule