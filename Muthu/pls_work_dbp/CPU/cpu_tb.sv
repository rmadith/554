`default_nettype none

import common_def::*;

module cpu_tb();

    logic clk, rst_n, turn_off_DBP, debug;
    logic [31:0] boot_addr;
    logic [31:0] boot_data;
    logic [31:0] joystick_data;

    logic [31:0] memMappedAddr;
    logic [31:0] memMappedDataOut;
    logic  halt;
    

    //////////////////////
    // Instantiate CPU //
    ////////////////////
    cpu iCPU(.clk(clk), .rst_n(rst_n), .boot_data(boot_data), 
            .boot_addr(boot_addr), .debug(debug), .turn_off_DBP(turn_off_DBP),
            .memMappedAddr(memMappedAddr), .memMappedDataOut(memMappedDataOut),
            .halt(halt), .joystick_data(joystick_data)
        );



    /////////////// Provides real time decooding of instruction in waveform for debugging //////////////
    logic [31:0] instruction_IFID_in;

    instruction_type inst_name_IFID_in;

    assign instruction_IFID_in = iCPU.instruction_IFID_in;

    instruction_debug iDEBUG_IFID_in(
        .instruction(instruction_IFID_in),
        .inst_name(inst_name_IFID_in)
    );



    logic [31:0] instruction_IFID_IDEX;

    instruction_type inst_name_IFID_IDEX;

    assign instruction_IFID_IDEX = iCPU.instruction_IFID_IDEX;

    instruction_debug iDEBUG_IFID_IDEX(
        .instruction(instruction_IFID_IDEX),
        .inst_name(inst_name_IFID_IDEX)
    );

    logic [31:0] instruction_IDEX_EXMEM;

    instruction_type inst_name_IDEX_EXMEM;

    assign instruction_IDEX_EXMEM = iCPU.instruction_IDEX_EXMEM;

    instruction_debug iDEBUG_IDEX_EXMEM(
        .instruction(instruction_IDEX_EXMEM),
        .inst_name(inst_name_IDEX_EXMEM)
    );

    logic [31:0] instruction_EXMEM_MEMWB;

    instruction_type inst_name_EXMEM_MEMWB;

    assign instruction_EXMEM_MEMWB = iCPU.instruction_EXMEM_MEMWB;

    instruction_debug iDEBUG_EXMEM_MEMWB(
        .instruction(instruction_EXMEM_MEMWB),
        .inst_name(inst_name_EXMEM_MEMWB)
    );

    logic [31:0] instruction_MEMWB_out;

    instruction_type inst_name_MEMWB_out;

    assign instruction_MEMWB_out = iCPU.instruction_MEMWB_out;

    instruction_debug iDEBUG_MEMWB_out(
        .instruction(instruction_MEMWB_out),
        .inst_name(inst_name_MEMWB_out)
    );


    logic PC_yahoo;

    assign PC_yahoo = iCPU.PC_IFID_IDEX == 32'h544;


    initial begin
        clk = 0;
        rst_n = 0;
        boot_addr = '0;
        boot_data = '0;
        debug = 0;
        turn_off_DBP = 1;
        joystick_data = 32'h0000040a;

        #2 rst_n = 1;


        @(posedge PC_yahoo);


        @(posedge iCPU.ECALL_MEMWB_out);
        $display("Hit ECALL");
        $stop();
        

    end
    
    always
        #1 clk = ~clk;
  
endmodule

`default_nettype wire