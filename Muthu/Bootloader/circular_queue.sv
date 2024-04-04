module circular_queue(clk,rst_n,data_in,add,remove,data_out,q_full,q_empty, remaining, containing);
    input clk,rst_n,add,remove;
    input [7:0] data_in;



    output reg q_full,q_empty;
    output reg [3:0] remaining, containing;
    output reg [7:0] data_out;
    parameter Q_SIZE = 8;

    reg [7:0] queue [Q_SIZE - 1 : 0];
    reg [3:0] produce_count,consume_count;

    always_ff @(posedge clk,negedge rst_n) begin
        if (!rst_n) begin
            produce_count <= 0;
            consume_count <= 0;
        end
        else if(add) begin
            if(!q_full) begin 
                queue[produce_count[2:0]] <= data_in;
                produce_count <= produce_count + 1;
	    end
        end
        else if (remove) begin
            if(!q_empty)
                consume_count <= consume_count + 1;
        end
    end

    always_comb begin
        q_full = (produce_count - consume_count == Q_SIZE);
        q_empty = (consume_count == produce_count);
        data_out = queue[consume_count[2:0]];
	remaining = Q_SIZE - (produce_count - consume_count);
	containing = produce_count - consume_count;
    end


endmodule
