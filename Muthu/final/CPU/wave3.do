onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_tb/instruction_IFID_in
add wave -noupdate -divider -height 25 {Global signals}
add wave -noupdate -color White /cpu_tb/iCPU/clk
add wave -noupdate /cpu_tb/iCPU/rst_n
add wave -noupdate /cpu_tb/iCPU/iFetch/ECALL
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/InstructionInFetch
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/ReadReg1InFetch
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/ReadReg2InFetch
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/InstructionDownPipeline
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/RegWriteEnableDownPipeline
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/stall
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/WRS_RR1
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/WRS_RR2
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/isBranchInstruction
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/stall_intermediate_1
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/stall_intermediate_2
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/w_reg_sel
add wave -noupdate -divider -height 25 {BTB and PC module internal}
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/turn_off_DBP
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/PC_enable
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/branch
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/jumpAL
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/takeBranch
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/PC_plus_4
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/instruction_IFID_in
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/branch_PC
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/incorrect_b_prediction
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/PC_IFID_IDEX
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/PC_plus4_IFID_out
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/PC_IFID_in
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/predict_branch_taken
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/branch_reg
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/strong_reg
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/valid_reg
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/current_location
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/current_tag
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/last_PC
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/last_location
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/last_tag
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/pulled_branch_reg
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/next_PC
add wave -noupdate -divider -height 25 {Fetch outputs}
add wave -noupdate /cpu_tb/iCPU/PC_plus4_IFID_in
add wave -noupdate /cpu_tb/iCPU/instruction_IFID_in
add wave -noupdate -color Magenta /cpu_tb/iCPU/PC_IFID_in
add wave -noupdate -color Magenta /cpu_tb/inst_name_IFID_in
add wave -noupdate /cpu_tb/iCPU/ECALL_IFID_in
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/predict_branch_taken
add wave -noupdate -divider -height 25 {IFID pipeline reg outputs}
add wave -noupdate /cpu_tb/iCPU/instruction_IFID_IDEX
add wave -noupdate /cpu_tb/iCPU/PC_plus4_IFID_out
add wave -noupdate -color Magenta /cpu_tb/iCPU/PC_IFID_IDEX
add wave -noupdate -color Magenta /cpu_tb/inst_name_IFID_IDEX
add wave -noupdate /cpu_tb/iCPU/ECALL_IFID_IDEX
add wave -noupdate /cpu_tb/iCPU/iIFID_pipeline_reg/predict_branch_taken_ID
add wave -noupdate -divider -height 30 {Hazard Detection Unit Outputs}
add wave -noupdate /cpu_tb/iCPU/PC_enable
add wave -noupdate /cpu_tb/iCPU/Flush_IFID
add wave -noupdate /cpu_tb/iCPU/Flush_IDEX
add wave -noupdate /cpu_tb/iCPU/Flush_EXMEM
add wave -noupdate /cpu_tb/iCPU/Flush_MEMWB
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/stall_load_to_Branch
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/stall_load_to_use
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/stall_aluOp_to_Branch
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/stall
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/TakeBranch_from_D
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/predict_branch_taken_ID
add wave -noupdate /cpu_tb/iCPU/incorrect_b_prediction
add wave -noupdate -divider -height 25 {Branch Unit Internal}
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/currPC
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/immediate
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/SrcA
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/SrcB
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/PC_plus4
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/branch
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/jump
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/funct3
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/opcode
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/branch_PC
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/takeBranch
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/branchSum
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/jumpSum
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/jalrSum
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/jumpFlag
add wave -noupdate /cpu_tb/iCPU/iDecode/iBU/branch_internal
add wave -noupdate -divider -height 25 {Register File Internal}
add wave -noupdate /cpu_tb/iCPU/iDecode/iRF/p0_addr
add wave -noupdate /cpu_tb/iCPU/iDecode/iRF/p1_addr
add wave -noupdate /cpu_tb/iCPU/iDecode/iRF/re0
add wave -noupdate /cpu_tb/iCPU/iDecode/iRF/re1
add wave -noupdate /cpu_tb/iCPU/iDecode/iRF/dst_addr
add wave -noupdate /cpu_tb/iCPU/iDecode/iRF/dst
add wave -noupdate /cpu_tb/iCPU/iDecode/iRF/we
add wave -noupdate /cpu_tb/iCPU/iDecode/iRF/p0
add wave -noupdate /cpu_tb/iCPU/iDecode/iRF/p1
add wave -noupdate /cpu_tb/iCPU/iDecode/iRF/temp_p0
add wave -noupdate /cpu_tb/iCPU/iDecode/iRF/temp_p1
add wave -noupdate -divider -height 25 {Decode outputs}
add wave -noupdate -radix decimal /cpu_tb/iCPU/regData1_IDEX_in
add wave -noupdate /cpu_tb/iCPU/regData2_IDEX_in
add wave -noupdate /cpu_tb/iCPU/sext_imm_IDEX_in
add wave -noupdate /cpu_tb/iCPU/immSel_IDEX_in
add wave -noupdate /cpu_tb/iCPU/PC_as_operand_IDEX_in
add wave -noupdate /cpu_tb/iCPU/setDataZero_IDEX_in
add wave -noupdate /cpu_tb/iCPU/ALU_op_IDEX_in
add wave -noupdate /cpu_tb/iCPU/memRead_IDEX_in
add wave -noupdate /cpu_tb/iCPU/memType_IDEX_in
add wave -noupdate /cpu_tb/iCPU/memWrite_IDEX_in
add wave -noupdate /cpu_tb/iCPU/addConstant4_IDEX_in
add wave -noupdate /cpu_tb/iCPU/regWriteEnable_IDEX_in
add wave -noupdate /cpu_tb/iCPU/branch_PC
add wave -noupdate /cpu_tb/iCPU/takeBranch
add wave -noupdate -divider -height 25 {IDEX pipeline reg outputs}
add wave -noupdate /cpu_tb/iCPU/regData1_IDEX_out
add wave -noupdate /cpu_tb/iCPU/regData2_IDEX_out
add wave -noupdate -radix decimal /cpu_tb/iCPU/sext_imm_IDEX_out
add wave -noupdate /cpu_tb/iCPU/immSel_IDEX_out
add wave -noupdate /cpu_tb/iCPU/PC_as_operand_IDEX_out
add wave -noupdate /cpu_tb/iCPU/setDataZero_IDEX_out
add wave -noupdate /cpu_tb/iCPU/ALU_op_IDEX_out
add wave -noupdate /cpu_tb/iCPU/memRead_IDEX_EXMEM
add wave -noupdate /cpu_tb/iCPU/memType_IDEX_EXMEM
add wave -noupdate /cpu_tb/iCPU/memWrite_IDEX_EXMEM
add wave -noupdate /cpu_tb/iCPU/addConstant4_IDEX_out
add wave -noupdate /cpu_tb/iCPU/regWriteEnable_IDEX_EXMEM
add wave -noupdate /cpu_tb/iCPU/instruction_IDEX_EXMEM
add wave -noupdate -color Magenta /cpu_tb/iCPU/PC_IDEX_EXMEM
add wave -noupdate -color Magenta /cpu_tb/inst_name_IDEX_EXMEM
add wave -noupdate /cpu_tb/iCPU/ECALL_IDEX_EXMEM
add wave -noupdate -divider -height 25 {ALU internal}
add wave -noupdate /cpu_tb/iCPU/iExecute/iALU/A
add wave -noupdate /cpu_tb/iCPU/iExecute/iALU/B
add wave -noupdate /cpu_tb/iCPU/iExecute/iALU/ALU_op
add wave -noupdate /cpu_tb/iCPU/iExecute/iALU/out
add wave -noupdate -divider -height 25 {Execute Outputs}
add wave -noupdate /cpu_tb/iCPU/iEXMEM_pipeline_reg/execute_result_EXMEM_in
add wave -noupdate -divider -height 25 {EXMEM pipeline reg outputs}
add wave -noupdate /cpu_tb/iCPU/regWriteEnable_EXMEM_MEMWB
add wave -noupdate /cpu_tb/iCPU/instruction_EXMEM_MEMWB
add wave -noupdate -color Magenta /cpu_tb/iCPU/PC_EXMEM_MEMWB
add wave -noupdate -color Magenta /cpu_tb/inst_name_EXMEM_MEMWB
add wave -noupdate /cpu_tb/iCPU/regData2_EXMEM_out
add wave -noupdate /cpu_tb/iCPU/memType_EXMEM_out
add wave -noupdate /cpu_tb/iCPU/memRead_EXMEM_MEMWB
add wave -noupdate /cpu_tb/iCPU/memWrite_EXMEM_out
add wave -noupdate /cpu_tb/iCPU/iEXMEM_pipeline_reg/execute_result_EXMEM_MEMWB
add wave -noupdate /cpu_tb/iCPU/ECALL_EXMEM_MEMWB
add wave -noupdate -divider -height 30 {Memory Internal}
add wave -noupdate /cpu_tb/iCPU/iMemory/execute_result_EXMEM_MEMWB
add wave -noupdate /cpu_tb/iCPU/iMemory/memWrite_EXMEM_out
add wave -noupdate /cpu_tb/iCPU/iMemory/memRead_EXMEM_MEMWB
add wave -noupdate /cpu_tb/iCPU/iMemory/regData2_EXMEM_out
add wave -noupdate /cpu_tb/iCPU/iMemory/memType_EXMEM_out
add wave -noupdate /cpu_tb/iCPU/iMemory/memReadRst_MEMWB_in
add wave -noupdate /cpu_tb/iCPU/iMemory/memAddr
add wave -noupdate /cpu_tb/iCPU/iMemory/memWrite
add wave -noupdate /cpu_tb/iCPU/iMemory/memRead
add wave -noupdate /cpu_tb/iCPU/iMemory/memDataIn
add wave -noupdate /cpu_tb/iCPU/iMemory/memType
add wave -noupdate /cpu_tb/iCPU/iMemory/memDataOut
add wave -noupdate /cpu_tb/iCPU/iMemory/we0
add wave -noupdate /cpu_tb/iCPU/iMemory/we1
add wave -noupdate /cpu_tb/iCPU/iMemory/we2
add wave -noupdate /cpu_tb/iCPU/iMemory/we3
add wave -noupdate /cpu_tb/iCPU/iMemory/re0
add wave -noupdate /cpu_tb/iCPU/iMemory/re1
add wave -noupdate /cpu_tb/iCPU/iMemory/re2
add wave -noupdate /cpu_tb/iCPU/iMemory/re3
add wave -noupdate /cpu_tb/iCPU/iMemory/rdata_bnk0
add wave -noupdate /cpu_tb/iCPU/iMemory/rdata_bnk1
add wave -noupdate /cpu_tb/iCPU/iMemory/rdata_bnk2
add wave -noupdate /cpu_tb/iCPU/iMemory/rdata_bnk3
add wave -noupdate /cpu_tb/iCPU/iMemory/wdata_bnk0
add wave -noupdate /cpu_tb/iCPU/iMemory/wdata_bnk1
add wave -noupdate /cpu_tb/iCPU/iMemory/wdata_bnk2
add wave -noupdate /cpu_tb/iCPU/iMemory/wdata_bnk3
add wave -noupdate -divider -height 25 {Memory Outputs}
add wave -noupdate /cpu_tb/iCPU/memReadRst_MEMWB_in
add wave -noupdate -divider -height 25 {MEMWB pipeline reg outputs}
add wave -noupdate /cpu_tb/iCPU/regWriteEnable_MEMWB_out
add wave -noupdate /cpu_tb/iCPU/instruction_MEMWB_out
add wave -noupdate -color Magenta /cpu_tb/iCPU/PC_MEMWB_out
add wave -noupdate -color Magenta /cpu_tb/inst_name_MEMWB_out
add wave -noupdate /cpu_tb/iCPU/memRead_MEMWB_out
add wave -noupdate /cpu_tb/iCPU/memReadRst_MEMWB_out
add wave -noupdate /cpu_tb/iCPU/iMEMWB_pipeline_reg/execute_result_MEMWB_out
add wave -noupdate /cpu_tb/iCPU/ECALL_MEMWB_out
add wave -noupdate -divider -height 25 {Writeback outputs}
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/writeBackData
add wave -noupdate -divider -height 25 {Writeback signals in Decode Module}
add wave -noupdate /cpu_tb/iCPU/iDecode/reg_dst_addr
add wave -noupdate -divider -height 30 {Check ALU op to branch Hazard detect internal}
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/InstructionInFetch
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/ReadReg1InFetch
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/ReadReg2InFetch
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/InstructionDownPipeline
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/RegWriteEnableDownPipeline
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/stall
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/WRS_RR1
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/WRS_RR2
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/isBranchInstruction
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/stall_intermediate_1
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/stall_intermediate_2
add wave -noupdate /cpu_tb/iCPU/iHazardDetect/check_for_alu_op_to_branch/w_reg_sel
add wave -noupdate -divider -height 30 {Forwarding unit to DECODE}
add wave -noupdate /cpu_tb/iCPU/iForwardToD/Instruction_IFID_IDEX
add wave -noupdate /cpu_tb/iCPU/iForwardToD/RegWriteEnable_EXMEM_MEMWB
add wave -noupdate /cpu_tb/iCPU/iForwardToD/Instruction_EXMEM_MEMWB
add wave -noupdate /cpu_tb/iCPU/iForwardToD/RegWriteEnable_MEMWB_out
add wave -noupdate /cpu_tb/iCPU/iForwardToD/Instruction_MEMWB_out
add wave -noupdate /cpu_tb/iCPU/iForwardToD/execute_result_EXMEM_MEMWB
add wave -noupdate /cpu_tb/iCPU/iForwardToD/writebackData
add wave -noupdate /cpu_tb/iCPU/iForwardToD/RegData1_IDEX_out
add wave -noupdate /cpu_tb/iCPU/iForwardToD/RegData2_IDEX_out
add wave -noupdate /cpu_tb/iCPU/iForwardToD/RegData1_after_forward_EX
add wave -noupdate /cpu_tb/iCPU/iForwardToD/RegData2_after_forward_EX
add wave -noupdate /cpu_tb/iCPU/iForwardToD/D_read_register_1
add wave -noupdate /cpu_tb/iCPU/iForwardToD/D_read_register_2
add wave -noupdate /cpu_tb/iCPU/iForwardToD/MEM_destination_reg
add wave -noupdate /cpu_tb/iCPU/iForwardToD/WB_destination_reg
add wave -noupdate /cpu_tb/iCPU/iForwardToD/RegData1_MEMtoEX_forward
add wave -noupdate /cpu_tb/iCPU/iForwardToD/RegData2_MEMtoEX_forward
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {343 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 466
configure wave -valuecolwidth 87
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
configure wave -timelineunits ps
update
WaveRestoreZoom {338 ns} {350 ns}
