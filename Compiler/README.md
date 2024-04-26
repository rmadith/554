# ECE_554
Repo for ECE 554

Add following to Path variable
export PATH=$PATH:/groupspace/shared/r/riscv-toolchain/riscv_install_base32/riscv_install/bin

Follow Makefile approach
Add all design file(.v, .sv) paths to tb/riscv.f



The project has the following hierarchy
             pipe/src -> Implement 5 stage pipelined design here
             
Each of the above design folders has the following hierarchy. 

            1. proc.sv -> Top Level Design Module. Contains instruction, data memory instances and the core. 
            2. core.sv -> Implement the processor design in this file. The submodules of various stages are also populated with various intuitive signal names. New signals can be added or renamed as per the designers design choices. The designers can use verilog or system verilog. According point the respective file in tb/riscv.f file. 
            tb/dut_probes.sv  needs to be updated connecting the corresponding signals from the design(ECALL should be taken from the write back or commit stage). The testbench is designed around ecall as the end of the program. 
            4. .f files can be updated for addition of new modules/file name changes etc
               tb/riscv.f -> This points to all files for running TB with core alone.
  
Environment :
          Add RISCV toolchain, Modelsim to your PATH variable. Add the following commands in .bashrc/.bashrc.local
          
                    export PATH=$PATH:<Path to the riscv bin file after riscv installation. The instructions can be found in riscv official release website. https://github.com/riscv-collab/riscv-gnu-toolchain>
export PATH=$PATH:/groupspace/shared/r/riscv-toolchain/riscv_install_base32/riscv_install/bin

TB Environment is located in ./tb directory. To run any testcase.

             1. cd tb
             2. make all PROG=<program name>  RUN_DIR=<directory where simulation run files are created. Default directory is named as "test_sim">
             
             MODE=nodut -> Runs in NO DUT mode. That is instructions are executed every cycle by the test bench simulator and Reg/Mem Trace is created
             MODE=toolchain -> Runs in toolchain mode. That is compiles using riscv compiler and simulates using riscv gdb. No SV files are compiled. 
             
Note : 

     The Memory size can be changed in tb/wiscv_tb.sv NUM_MEM_WORDS parameter set in terms of number of 32 bit words. 



 TRACES : 
          Each of the test run creates traces for the designer to assist in debug.
          
          1. MODE=pipe (default mode) -> Creates REF.pTrace, DUT.pTrace (p stand for pipelining)
          3. MODE=nodut -> Created REF.Trace
          
          REF Trace : Reference/Golden Trace from the testbench simulator. 
          DUT Trace : Trace Captured from the design using probes in tb/dut_probes.sv.
          
 ERRORS : 
         Apart from generating reference traces, TB does register file comparisons between TB register file and design register file on every architectural commit. If there are any errors in your design, these comparisons give "ERROR" messages in ${RUN_DIR}/${PROG}_run.log (Note these variables RUN_DIR, PROG are given as arguments to "make all" command as described above)
         
        Example ERROR Message :
        
        # @               14500 cycle_count =         10 ERROR : Reg values mismatch at index 5 ; Expected : 0, Actual : 1 current_pc : 18 old_pc : 14


                          timestamp = 14500 units
                          cycle_count = 10 (you can use timestamp and wiscv_tb.cycle_count variables to arrive at the failure point in timestamp)
                          cycle_count is a free running 32 bit counter increments by 1 on every clock cycle posedge. 
                          index = 5 (Register Index is 5 . That is x5 has incorrect value) 
                          Expected = 0 (Expected value of x5 as per TB simulator is 0)
                          Actual = 1 (Observed value of x5 in DUT register is 1)
                          current_pc = 18 (current pc of the instruction in write back stage : Yet to be committed)
                          old_pc = 14 (PC value of instruction which got committed)


Waves Dump :
           add "WAVES=1" to the make command used to dump waves in ${RUN_DIR}. "vsim.wlf" is the name of waveform created.
          
          Command to open Waves : 
                                
                                vsim vsim.wlf&
          
Regression :
           
           <Run the following command in TB directory>
           make all_regr REGR_TL=<Test List Name> (Eg: make all_regr REGR_TL=unit_tests)
           
           Testlists are present as .tl in tests/testlists. New testlists can be added here as .tl files or new test names can be added here after adding the corresponding test to the respective tests folder under tests

           <Running all testlists together as a complete regression>
           make all_regr REGR_TL=all 
         
           Additional arguments like MODE, WAVES, RUN_DIR, NO_REF_MODE etc can be added to select corresponding mode in the regression

NO_REF Mode :

           While running long programs, sometimes dumping out trace hinders the total program run time. In those cases you can disable the Reference trace dump and not verify the execution of the program on the design. 
           NO_REF_MODE=1 -> Dont dump the gdb trace/Ref Trace

Only Compile :
  
             make compile_only -> Only compiles the program and creates the hex file, wiscv.hex. This can be used to create hex dump for FPGA
