module circular_queue_tb();

// Parameters
localparam BUFFER_SIZE = 8;

// Testbench Signals
reg clk;
reg rst_n;
reg wr_en;
reg rd_en;
reg [7:0] wr_data;
wire [7:0] rd_data;
wire buffer_full;
wire buffer_empty;

// DUT Instance
circular_queue #(.Q_SIZE(BUFFER_SIZE)) iDUT(.clk(clk),.rst_n(rst_n),.data_in(wr_data),.add(wr_en),.remove(rd_en),.data_out(rd_data),.q_full(buffer_full),.q_empty(buffer_empty)); 

// Clock Generation
always #5 clk = ~clk; // 100MHz clock

// Simulation memory to track written data
reg [7:0] sim_buffer[15:0];
integer write_ptr = 0, read_ptr = 0, num_elements = 0, i;

// Initialize simulation memory
initial begin
    for (i = 0; i < BUFFER_SIZE; i++) sim_buffer[i] = 0;
end

// Test Sequence
initial begin
    clk = 0;
    rst_n = 0;
    wr_en = 0;
    rd_en = 0;
    wr_data = 0;
    #10;
    rst_n = 1; // Release reset
    repeat (20) begin
        wr_en = 1;
        wr_data = $random % 256; // Random data within the data width limit
        if (!buffer_full) begin
            sim_buffer[write_ptr % BUFFER_SIZE] = wr_data;
            write_ptr++;
            num_elements++;
        end
        #10;
        wr_en = 0;
    end

    repeat (20) begin
        rd_en = 1;
        if (!buffer_empty && num_elements > 0) begin
            #1; // Small delay to ensure rd_data is updated
            if (rd_data !== sim_buffer[read_ptr % BUFFER_SIZE]) begin
                $display("Error: Mismatch at read_ptr=%d, expected %h, got %h", read_ptr, sim_buffer[read_ptr % BUFFER_SIZE], rd_data);
            end else begin
                $display("Correct: At read_ptr=%d, expected %h, got %h", read_ptr, sim_buffer[read_ptr % BUFFER_SIZE], rd_data);
            end
            read_ptr++;
            num_elements--;
        end
        #9;
        rd_en = 0;
    end

    $stop();
end

endmodule
