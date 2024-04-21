`default_nettype none

import common_def::*;

module cpu_tb();

    logic clk, rst_n;

    
    

    //////////////////////
    // Instantiate CPU //
    ////////////////////
    cpu iCPU(.clk(clk), .rst_n(rst_n), .boot_addr(), .boot_data(), .debug(1'b0), .memMappedAddr(), .memMappedDataOut(), .joystick_data(), .halt());



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




    initial begin
        clk = 0;
        rst_n = 0;
        #2 rst_n = 1;

        @(posedge iCPU.ECALL_MEMWB_out);
        $display("Hit ECALL");
        $stop();
        

    end
    
    always
        #1 clk = ~clk;
  
endmodule

`default_nettype wire