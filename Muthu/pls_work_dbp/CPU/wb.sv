`default_nettype none

module wb (
        ///// INPUTS  /////
        input wire [31:0] memReadRst_MEMWB_out,
        input wire memRead_MEMWB_out,
        input wire [31:0] execute_result_MEMWB_out,

        ///// OUTPUTS  /////
        output wire [31:0] writeBackData

        );

        assign writeBackData = (memRead_MEMWB_out) ? memReadRst_MEMWB_out : execute_result_MEMWB_out;

endmodule

`default_nettype wire