`default_nettype none

module BTB_and_PC (
    ///// INPUTS  /////
    input logic clk, 
    input logic rst_n, 

    input logic PC_enable,
    input logic branch,
    input logic jumpAL,  
    input logic takeBranch, 
    input logic [31:0] PC_plus_4,
    input logic turn_off_DBP,

    input logic [31:0] branch_PC,
    input logic incorrect_b_prediction,

    ///// OUTPUTS /////
    output logic [31:0] PC_IFID_in,
    output logic predict_branch_taken
);

//////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////
    // Dynamic Branch Prediction //
    ///////////////////////////////

    //////////////////////////////////////////////////////////
    // Setup Registers for Branch, Strong, and Valid Arrays //
    //////////////////////////////////////////////////////////
    reg [35:0] branch_reg [0:511];        // 4 bit tag from the pc and 32 bit address to branch target
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

    assign current_location = PC_IFID_in[10:2];    // use bits 10-2 current PC as the location in the registers
    assign current_tag = PC_IFID_in[14:11];        // use bits 14-11 of the current PC as the tag  
    assign last_location = last_PC[10:2];          // use bits 10-2 last PC as the location in the registers
    assign last_tag = last_PC[14:11];              // use bits 14-11 of the last PC as the tag
    assign pulled_branch_reg = branch_reg[current_location];    // the pulled value from the branch register for the current instruction in fetch

    // assert if we predict the branch to be taken
    assign predict_branch_taken = (valid_reg[current_location] == 1'b1) && (strong_reg[current_location] == 1'b1) && (pulled_branch_reg[38:32] == current_tag) && (turn_off_DBP != 1'b1);

    ////////////////////////////
    // Config Branch Register //
    ////////////////////////////
    always @(posedge clk) begin

        // update the branch register
        if(branch | jumpAL) begin
            // if cache location is not valid, fill the location with data
            if(!valid_reg[last_location]) begin
                branch_reg[last_location] <= {last_tag, branch_PC};
            end
        end
    end

    /////////////////////////////////
    // Config Valid and Strong Bit //
    /////////////////////////////////
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)  begin                         // on reset set all valid, and strong bits to 0   
            valid_reg <= '{default:1'b0};        
            strong_reg <= '{default:1'b0};    
        end
        else if((branch | jumpAL) & takeBranch)  begin      // if a branch or JAL instruction is taken set the valid and strong bits
            valid_reg[last_location] <= 1'b1;
            strong_reg[last_location] <= 1'b1;
        end
        else if( ~takeBranch & incorrect_b_prediction) begin    // if a branch is not taken and was a incorrect prediction clear the valid and strong bits
            strong_reg[last_location] <= 1'b0;
            valid_reg[last_location] <= 1'b0;
        end  
    end

    ////////////////////////////////////////////
    // Flop the Last Location in the Register //
    ////////////////////////////////////////////
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)
            last_PC <= 9'h000;
        else if(PC_enable)
            last_PC <= PC_IFID_in;
    end

//////////////////////////////////////////////////////////////////////////////////

    logic [31:0] next_PC;
    assign next_PC =    incorrect_b_prediction & !takeBranch ? last_PC + 3'h4:  // set the next PC
                        incorrect_b_prediction & takeBranch  ? branch_PC :
                        predict_branch_taken ? pulled_branch_reg[31:0]: 
                        PC_plus_4;

    ///////////////////////////////////
    // Flop For Updating the next PC //
    ///////////////////////////////////
    always_ff @ (posedge clk, negedge rst_n) begin
        if (!rst_n)
            PC_IFID_in <= 32'h0;    // Reset program counter to 0
        else if (PC_enable)  
            PC_IFID_in <= next_PC;
    end

endmodule

`default_nettype wire

