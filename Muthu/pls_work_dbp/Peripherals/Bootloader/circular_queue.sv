module circular_queue(clk,rst_n,data_in,add,remove,data_out,q_full,q_empty, remaining, containing);
    
    parameter Q_SIZE = 8;
    parameter Q_WIDTH = 8;
    input clk,rst_n,add,remove;
    input [Q_WIDTH-1:0] data_in;



    output reg q_full,q_empty;
    output reg [$clog2(Q_WIDTH):0] remaining, containing;
    output reg [Q_WIDTH-1:0] data_out;

    reg [Q_WIDTH-1:0] queue [Q_SIZE - 1 : 0];
    reg [$clog2(Q_WIDTH):0] produce_count,consume_count;

    always_ff @(posedge clk,negedge rst_n) begin
        if (!rst_n) begin
            produce_count <= 'b0;
            consume_count <= 'b0;
        end
        else if(add) begin
            if(!q_full) begin 
                queue[produce_count[$clog2(Q_WIDTH)-1:0]] <= data_in;
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
        data_out = queue[consume_count[$clog2(Q_WIDTH)-1:0]];
        remaining = Q_SIZE - (produce_count - consume_count);
        containing = produce_count - consume_count;
    end


endmodule
