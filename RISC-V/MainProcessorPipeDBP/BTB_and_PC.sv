`default_nettype none

module BTB_and_PC (
    ///// INPUTS  /////
    input wire logic clk, 
    input wire logic rst_n, 

    input wire logic PC_enable,
    input wire logic branch,
    input wire logic jumpAL, 
    input wire logic takeBranch, 
    input wire logic [31:0] PC_plus_4,    
    input wire logic [31:0] instruction_IFID_in,
    input wire logic [31:0] branch_PC,
    input wire logic incorrect_b_prediction,
    input wire logic [31:0] PC_IFID_IDEX,
    input wire logic [31:0] PC_plus4_IFID_out,

    ///// OUTPUTS /////
    output logic [31:0] PC_IFID_in,
    output logic predict_branch_taken
);

    parameter turn_off_DBP = 1'b0;

//////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////
    // Dynamic Branch Prediction //
    ///////////////////////////////

    /////////////////////////////////////////////////////////
    // Setup Registers for Branch, Strong, and Valid Arrays //
    /////////////////////////////////////////////////////////
    reg [38:0] branch_reg [0:511];        // 7 bit tag from the pc and 32 bit address to branch target
    reg strong_reg [0:511];               // the strong bit is set for a location if it was previously taken
    reg valid_reg [0:511];                // the validity of the location

    ////////////////////////////////////////////////////////
    // Setup Signals Needed for Dynamic Branch Prediction //
    ////////////////////////////////////////////////////////
    logic [8:0] current_location;   // which location the current PC is pointing to 
    logic [6:0] current_tag;
    logic [31:0] last_PC;       
    logic [8:0] last_location;      // the location the last PC pointed to
    logic [6:0] last_tag;           
    logic [38:0] pulled_branch_reg;

    assign current_location = PC_IFID_in[8:0];    // use the 9 LSB of the current PC as the location in the registers
    assign last_location = last_PC[8:0];
    assign last_tag = last_PC[15:9];
    assign current_tag = PC_IFID_in[15:9];                // use bits 9 - 15 of the current PC as the tag  
    assign pulled_branch_reg = branch_reg[current_location];

    ////////////////////////////
    // Config Branch Register //
    ////////////////////////////
    always @(posedge clk) begin

        predict_branch_taken <= 1'b0;

        // predict branch taken if the strong bit is set at the current location
        if(valid_reg[current_location] == 1'b1 && 
            strong_reg[current_location] == 1'b1 && 
            pulled_branch_reg[38:32] == current_tag &&
            turn_off_DBP != 1'b1) begin           // check to see if strong bit is set                                 
            predict_branch_taken <= 1'b1;
        end

        // update the branch register
        if(branch | jumpAL) begin
            // if cache location is not valid, fill the location with data
            if(!valid_reg[last_location]) begin
                branch_reg[last_location] <= {last_tag, branch_PC};
            end
        end
    end

    ///////////////////////
    // Config Strong Bit //
    ///////////////////////
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)                                  //on reset set strong bit to 0
            strong_reg <= '{default:1'b0};     
        else if (branch | jumpAL) begin           
            if(takeBranch) begin                    // branch is taken for the current instruction      
                strong_reg[last_location] <= 1'b1;
            end
            else if(~takeBranch)                    // if the branch is not taken reset the strong bit
                strong_reg[last_location] <= 1'b0;
        end
    end

    //////////////////////
    // Config Valid Bit //
    //////////////////////
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)                              //on reset set valid bit to 0
            valid_reg <= '{default:1'b0};       // could use a for loop
        else if(branch | jumpAL)                // if the location is being used set the valid bit
            valid_reg[last_location] <= 1'b1;
    end

    ////////////////////////////////////////////
    // Flop the Last Location in the Register //
    ////////////////////////////////////////////
    always @(posedge clk) begin
        if(!rst_n)
            last_PC <= 9'h000;
        else
            last_PC <= PC_IFID_in;
    end

//////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////
    // Declare FFs for PC         //
    ////////////////////////////////

    logic [31:0] next_PC;
    assign #2 next_PC = incorrect_b_prediction ? branch_PC :
                        predict_branch_taken ? pulled_branch_reg[31:0]: 
                        PC_plus_4;

    always_ff @ (posedge clk, negedge rst_n) begin
        if (!rst_n)
            PC_IFID_in <= 32'h0;    // Reset program counter to 0
        else if (PC_enable)  
            PC_IFID_in <= next_PC;
    end

    


endmodule

`default_nettype wire

