onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Global
add wave -noupdate /proc_hier_pbench/DUT/p0/clk
add wave -noupdate /proc_hier_pbench/DUT/p0/rst
add wave -noupdate /proc_hier_pbench/DUT/p0/err
add wave -noupdate -divider {Fetch (Internal)}
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/BranchPC_EXMEM_out
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/clk
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/err
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/instr
add wave -noupdate -color Gold /proc_hier_pbench/DUT/p0/fetch0/instruction
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/instructionIsHault
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/NewPC
add wave -noupdate -color Magenta /proc_hier_pbench/DUT/p0/fetch0/pc
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/pcCurrent
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/PCplus2
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/rst
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/im_done
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/takeBranch_EXMEM_out
add wave -noupdate -divider {IM Cache FSM}
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/curr_state
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/actually_done_in
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/actually_done_out
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/cache0_enable
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/cache1_enable
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/cache_valid_in
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/clk
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/currOffset_1
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/currOffset_2
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/err
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/FBM_Addr
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/FBM_DataIn
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/FBM_rd
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/FBM_wr
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/ff_curr_cache
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/ff_curr_miss
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/ff_curr_victimway
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/ff_next_cache
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/ff_next_miss
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/ff_next_victimway
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_c0_data_out
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_c0_dirty
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_c0_hit
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_c0_tag_out
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_c0_valid
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_c1_data_out
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_c1_dirty
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_c1_hit
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_c1_tag_out
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_c1_valid
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_FBM_Busy
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_FBM_DataOut
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/from_FBM_stall
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/LRU_data_in
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/LRU_data_out
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/LRU_index
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/LRU_write
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/next_state
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/out_cacheHit
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/out_DataOut
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/out_done
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/out_stall
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/resultingOffset_1
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/resultingOffset_2
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/rst
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/store_req_details
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/top_Addr
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/top_Addr_flopped
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/top_DataIn
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/top_DataIn_flopped
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/top_Rd
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/top_Wr
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/topRd_flopped
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FSM/topWr_flopped
add wave -noupdate -divider {IM Cache}
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/Addr
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/cache0_enable
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/cache0_err
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/cache1_enable
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/cache1_err
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/cache_valid_in
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/CacheHit
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/clk
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/createdump
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/DataIn
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/DataOut
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/Done
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/err
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FBM_Addr
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FBM_DataIn
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/fbm_err
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FBM_rd
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/FBM_wr
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/ff_curr_cache
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/ff_curr_miss
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/ff_curr_victimway
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/ff_next_cache
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/ff_next_miss
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/ff_next_victimway
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_c0_data_out
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_c0_dirty
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_c0_hit
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_c0_tag_out
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_c0_valid
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_c1_data_out
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_c1_dirty
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_c1_hit
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_c1_tag_out
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_c1_valid
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_FBM_Busy
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_FBM_DataOut
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/from_FBM_stall
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/fsm_err
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/LRU_data_in
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/LRU_data_out
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/LRU_index
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/LRU_write
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/out_cacheHit
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/out_DataOut
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/out_done
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/out_stall
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/Rd
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/rst
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/Stall
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/regFile0/Wr
add wave -noupdate -divider {Fetch (Outputs)}
add wave -noupdate /proc_hier_pbench/DUT/p0/CreateDump_IFID_in
add wave -noupdate /proc_hier_pbench/DUT/p0/PCplus2_IFID_in
add wave -noupdate /proc_hier_pbench/DUT/p0/Instruction_IFID_in
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/InstructionMemStall
add wave -noupdate -divider {IFID pipeline reg control sigs}
add wave -noupdate /proc_hier_pbench/DUT/p0/IFIDpipelineReg0/Flush
add wave -noupdate /proc_hier_pbench/DUT/p0/IFIDpipelineReg0/Stall_disable
add wave -noupdate -divider {IFID pipeline reg (outputs)}
add wave -noupdate /proc_hier_pbench/DUT/p0/CreateDump_IFID_IDEX
add wave -noupdate /proc_hier_pbench/DUT/p0/PCplus2_IFID_IDEX
add wave -noupdate -color Gold /proc_hier_pbench/DUT/p0/Instruction_IFID_IDEX
add wave -noupdate -divider {Decode (outputs)}
add wave -noupdate /proc_hier_pbench/DUT/p0/RegWriteEnable_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/WriteRegSel_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/SavePC_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/MemToReg_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/MemRead_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/MemWrite_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/ALUSrcB_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/SetDataZero_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/SLData8_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/CompareOp_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/ReverseOp_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/RegData1_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/RegData2_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/sext_imm_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/err_decode
add wave -noupdate -divider {IDEX pipeline reg (outputs)}
add wave -noupdate /proc_hier_pbench/DUT/p0/RegWriteEnable_IDEX_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/WriteRegSel_IDEX_EXMEM
add wave -noupdate -color Gold /proc_hier_pbench/DUT/p0/Instruction_IDEX_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/CreateDump_IDEX_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/MemToReg_IDEX_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/SavePC_IDEX_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/MemWrite_IDEX_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/MemRead_IDEX_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/PCplus2_IDEX_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/SetDataZero_IDEX_out
add wave -noupdate /proc_hier_pbench/DUT/p0/SLData8_IDEX_out
add wave -noupdate /proc_hier_pbench/DUT/p0/RegData1_IDEX_out
add wave -noupdate /proc_hier_pbench/DUT/p0/ALUSrcB_IDEX_out
add wave -noupdate /proc_hier_pbench/DUT/p0/RegData2_IDEX_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/ReverseOp_IDEX_out
add wave -noupdate /proc_hier_pbench/DUT/p0/CompareOp_IDEX_out
add wave -noupdate /proc_hier_pbench/DUT/p0/sext_imm_IDEX_out
add wave -noupdate /proc_hier_pbench/DUT/p0/err_IDEX_reg
add wave -noupdate -divider {Execute (Internal)}
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/ALUofl
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/ALUoperandA
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/ALUoperandB
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/ALUoutIsZero
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/ALUoutput
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/ALUSrcB
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/clk
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/CompareModOut
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/CompareOp
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/err
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/ex_rst_int
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/execute_rst
add wave -noupdate -color Gold /proc_hier_pbench/DUT/p0/execute0/instruction
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/PCplus2
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/Reg1Data_i
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/RegData1
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/RegData1Shifted
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/RegData2
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/ReverseOp
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/reverseRst
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/rst
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/SetDataZero
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/sext_imm
add wave -noupdate /proc_hier_pbench/DUT/p0/execute0/SLData8
add wave -noupdate -divider {Execute (outputs)}
add wave -noupdate /proc_hier_pbench/DUT/p0/execute_rst_EXMEM_in
add wave -noupdate /proc_hier_pbench/DUT/p0/err_execute
add wave -noupdate -divider {EXMEM pipeline register control signals}
add wave -noupdate /proc_hier_pbench/DUT/p0/Flush_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/Stall_disable_EXMEM
add wave -noupdate -divider {EXMEM pipeline reg (outputs)}
add wave -noupdate /proc_hier_pbench/DUT/p0/RegWriteEnable_EXMEM_MEMWB
add wave -noupdate /proc_hier_pbench/DUT/p0/WriteRegSel_EXMEM_MEMWB
add wave -noupdate -color Gold /proc_hier_pbench/DUT/p0/Instruction_EXMEM_MEMWB
add wave -noupdate /proc_hier_pbench/DUT/p0/PCplus2_EXMEM_MEMWB
add wave -noupdate /proc_hier_pbench/DUT/p0/RegData2_EXMEM_out
add wave -noupdate /proc_hier_pbench/DUT/p0/SavePC_EXMEM_MEMWB
add wave -noupdate /proc_hier_pbench/DUT/p0/MemToReg_EXMEM_MEMWB
add wave -noupdate /proc_hier_pbench/DUT/p0/CreateDump_EXMEM_out
add wave -noupdate /proc_hier_pbench/DUT/p0/MemWrite_EXMEM_out
add wave -noupdate /proc_hier_pbench/DUT/p0/execute_rst_EXMEM_MEMWB
add wave -noupdate /proc_hier_pbench/DUT/p0/err_EXMEM_reg
add wave -noupdate -divider {Data Memory Cache FSM}
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/curr_state
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/actually_done_in
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/actually_done_out
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache0_comp
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache0_data_in
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache0_enable
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache0_index
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache0_offset
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache0_tag
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache0_write
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache1_comp
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache1_data_in
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache1_enable
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache1_index
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache1_offset
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache1_tag
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache1_write
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/cache_valid_in
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/clk
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/curr_state
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/currOffset_1
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/currOffset_2
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/err
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/FBM_Addr
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/FBM_DataIn
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/FBM_rd
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/FBM_wr
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/ff_curr_cache
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/ff_curr_miss
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/ff_curr_victimway
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/ff_next_cache
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/ff_next_miss
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/ff_next_victimway
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_c0_data_out
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_c0_dirty
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_c0_hit
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_c0_tag_out
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_c0_valid
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_c1_data_out
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_c1_dirty
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_c1_hit
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_c1_tag_out
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_c1_valid
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_FBM_Busy
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_FBM_DataOut
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/from_FBM_stall
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/LRU_data_in
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/LRU_data_out
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/LRU_index
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/LRU_write
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/next_state
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/out_cacheHit
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/out_DataOut
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/out_done
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/out_stall
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/resultingOffset_1
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/resultingOffset_2
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/rst
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/store_req_details
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/top_Addr
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/top_Addr_flopped
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/top_DataIn
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/top_DataIn_flopped
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/top_Rd
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/top_Wr
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/topRd_flopped
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FSM/topWr_flopped
add wave -noupdate -divider {Data Memory Cache}
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/Addr
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache0_comp
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache0_data_in
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache0_enable
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache0_err
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache0_index
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache0_offset
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache0_tag
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache0_write
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache1_comp
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache1_data_in
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache1_enable
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache1_err
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache1_index
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache1_offset
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache1_tag
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache1_write
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/cache_valid_in
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/CacheHit
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/clk
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/createdump
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/DataIn
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/DataOut
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/Done
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/err
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FBM_Addr
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FBM_DataIn
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/fbm_err
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FBM_rd
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/FBM_wr
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/ff_curr_cache
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/ff_curr_miss
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/ff_curr_victimway
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/ff_next_cache
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/ff_next_miss
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/ff_next_victimway
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_c0_data_out
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_c0_dirty
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_c0_hit
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_c0_tag_out
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_c0_valid
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_c1_data_out
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_c1_dirty
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_c1_hit
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_c1_tag_out
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_c1_valid
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_FBM_Busy
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_FBM_DataOut
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/from_FBM_stall
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/fsm_err
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/LRU_data_in
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/LRU_data_out
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/LRU_index
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/LRU_write
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/out_cacheHit
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/out_DataOut
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/out_done
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/out_stall
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/Rd
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/rst
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/Stall
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/data_mem/Wr
add wave -noupdate -divider {Memory (outputs)}
add wave -noupdate /proc_hier_pbench/DUT/p0/MemReadRst_MEMWB_in
add wave -noupdate /proc_hier_pbench/DUT/p0/err_memory
add wave -noupdate -divider {MEMWB pipeline control sigs}
add wave -noupdate /proc_hier_pbench/DUT/p0/Stall_disable_MEMWB
add wave -noupdate /proc_hier_pbench/DUT/p0/Flush_MEMWB
add wave -noupdate -divider {MEMWB pipeline reg (outputs)}
add wave -noupdate /proc_hier_pbench/DUT/p0/RegWriteEnable_MEMWB_out
add wave -noupdate /proc_hier_pbench/DUT/p0/WriteRegSel_MEMWB_out
add wave -noupdate -color Gold /proc_hier_pbench/DUT/p0/Instruction_MEMWB_out
add wave -noupdate /proc_hier_pbench/DUT/p0/PCplus2_MEMWB_out
add wave -noupdate /proc_hier_pbench/DUT/p0/execute_rst_MEMWB_out
add wave -noupdate /proc_hier_pbench/DUT/p0/MemToReg_MEMWB_out
add wave -noupdate /proc_hier_pbench/DUT/p0/SavePC_MEMWB_out
add wave -noupdate /proc_hier_pbench/DUT/p0/MemReadRst_MEMWB_out
add wave -noupdate /proc_hier_pbench/DUT/p0/err_MEMWB_reg
add wave -noupdate /proc_hier_pbench/DUT/p0/MEMWBpipelineReg0/Err_MEMWB_out
add wave -noupdate -divider wb
add wave -noupdate /proc_hier_pbench/DUT/p0/writebackData
add wave -noupdate /proc_hier_pbench/DUT/p0/err_wb
add wave -noupdate -divider {Hazard Detection Unit}
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/branchAttemptDurringIMStall
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/CreateDump_IFID_in
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/DataMemStall
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/Flush_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/Flush_IDEX
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/Flush_IFID
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/Flush_MEMWB
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/Instruction_IDEX_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/Instruction_IFID_IDEX
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/Instruction_IFID_in
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/InstructionMemNotDone
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/InstructionMemStall
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/MemRead_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/PC_enable
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/RegWriteEnable_IDEX_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/RegWriteEnable_IDEX_in
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/stall
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/Stall_disable_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/Stall_disable_IDEX
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/Stall_disable_IFID
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/Stall_disable_MEMWB
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/stall_load_to_use
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/successfulBranchAttempt
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/TakeBranch_from_D
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/WriteRegSel_IDEX_EXMEM
add wave -noupdate /proc_hier_pbench/DUT/p0/HazardDetection0/WriteRegSel_IDEX_in
add wave -noupdate -divider -height 40 {Forwarding Unit}
add wave -noupdate -divider {Allows us to determine write reg in MEM stage}
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/RegWriteEnable_EXMEM_MEMWB
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/Instruction_EXMEM_MEMWB
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/WriteRegSel_EXMEM_MEMWB
add wave -noupdate -divider {Allows us to determine write reg in WB stage}
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/Instruction_MEMWB_out
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/RegWriteEnable_MEMWB_out
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/WriteRegSel_MEMWB_out
add wave -noupdate -divider {Allows us to determine the registers we are reading in EX stage}
add wave -noupdate -color Gold /proc_hier_pbench/DUT/p0/forwarding0/Instruction_IDEX_EXMEM
add wave -noupdate -divider {The data that will get forwarded}
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/writebackData
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/execute_rst_EXMEM_MEMWB
add wave -noupdate -divider {Data we will use if we don't forward}
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/RegData1_IDEX_out
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/RegData2_IDEX_out
add wave -noupdate -divider {Result of M-X forwarding}
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/RegData1_MEMtoEX_forward
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/RegData2_MEMtoEX_forward
add wave -noupdate -divider {forwarded outputs}
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/RegData1_after_forward
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/RegData2_after_forward
add wave -noupdate -divider {The registers whose values we need to use in EX stage}
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/EX_read_register_1
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/EX_read_register_2
add wave -noupdate -divider {The register we are writing to in the instruction that is in MEM stage}
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/MEM_destination_reg
add wave -noupdate -divider {The register we are writing to in the instruction that is in WB stage}
add wave -noupdate /proc_hier_pbench/DUT/p0/forwarding0/WB_destination_reg
add wave -noupdate -divider -height 40 <NULL>
add wave -noupdate -divider pbench_signals
add wave -noupdate /proc_hier_pbench/DCacheHit
add wave -noupdate /proc_hier_pbench/DCacheHit_count
add wave -noupdate /proc_hier_pbench/DCacheReq
add wave -noupdate /proc_hier_pbench/DCacheReq_count
add wave -noupdate /proc_hier_pbench/Halt
add wave -noupdate /proc_hier_pbench/ICacheHit
add wave -noupdate /proc_hier_pbench/ICacheHit_count
add wave -noupdate /proc_hier_pbench/ICacheReq
add wave -noupdate /proc_hier_pbench/ICacheReq_count
add wave -noupdate /proc_hier_pbench/Inst
add wave -noupdate /proc_hier_pbench/inst_count
add wave -noupdate /proc_hier_pbench/MemAddress
add wave -noupdate /proc_hier_pbench/MemDataIn
add wave -noupdate /proc_hier_pbench/MemDataOut
add wave -noupdate /proc_hier_pbench/MemRead
add wave -noupdate /proc_hier_pbench/MemWrite
add wave -noupdate /proc_hier_pbench/PC
add wave -noupdate /proc_hier_pbench/RegWrite
add wave -noupdate /proc_hier_pbench/sim_log_file
add wave -noupdate /proc_hier_pbench/trace_file
add wave -noupdate /proc_hier_pbench/WriteData
add wave -noupdate /proc_hier_pbench/WriteRegister
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2503 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 390
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {5368 ns}
