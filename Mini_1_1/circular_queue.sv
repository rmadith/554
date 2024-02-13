module circular_queue(clk,rst,data_in,add,remove,data_out,q_full,q_empty);
    input clk,rst,add,remove,q_full,q_empty;
    input [7:0] data_in,data_out;

    parameter Q_SIZE = 8;

    reg [7:0] queue [Q_SIZE - 1 : 0];
    reg [3:0] produce_count,consume_count;
    reg full,empty,add_index,rem_index;    
    
    always_ff @(posedge clk,negedge rst) begin 
        if (!rst) begin
            produce_count <= 0;
            consume_count <= 0;
            data_out <= 0;
            q_full <= 0;
            q_empty <= 0;
        end
        else if(add) begin 
            if(!q_full)
                queue[produce_count[2:0]] <= data_in;
                produce_count <= produce_count + 1;
        end
        else if (remove) begin
            if(!q_empty)
                consume_count <= consume_count + 1;
        end

    end

    always_comb begin :
        q_full = (produce_count - consume_count == Q_SIZE);
        q_empty = (consume_count == produce_count);
        data_out <= queue[consume_count[2:0]];
    end


endmodule

