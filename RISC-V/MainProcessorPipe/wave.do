onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_tb/instruction_IFID_in
add wave -noupdate -divider -height 25 {Global signals}
add wave -noupdate -color White /cpu_tb/iCPU/clk
add wave -noupdate /cpu_tb/iCPU/rst_n
add wave -noupdate /cpu_tb/iCPU/iFetch/ECALL
add wave -noupdate -divider -height 25 {BTB and PC module internal}
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/rst_n
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/PC_enable
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/takeBranch
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/PC_plus_4
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/instruction_IFID_in
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/branch_PC
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/incorrect_b_prediction
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/iFetch/btb_pc/PC_IFID_IDEX
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/PC_plus4_IFID_out
add wave -noupdate /cpu_tb/iCPU/iFetch/btb_pc/PC_IFID_in
add wave -noupdate -divider -height 25 {Fetch outputs}
add wave -noupdate /cpu_tb/iCPU/PC_plus4_IFID_in
add wave -noupdate /cpu_tb/iCPU/instruction_IFID_in
add wave -noupdate -color Magenta /cpu_tb/iCPU/PC_IFID_in
add wave -noupdate -color Magenta /cpu_tb/inst_name_IFID_in
add wave -noupdate /cpu_tb/iCPU/ECALL_IFID_in
add wave -noupdate -divider -height 25 {IFID pipeline reg outputs}
add wave -noupdate /cpu_tb/iCPU/instruction_IFID_IDEX
add wave -noupdate -color Magenta /cpu_tb/iCPU/PC_plus4_IFID_out
add wave -noupdate -color Magenta /cpu_tb/inst_name_IFID_IDEX
add wave -noupdate /cpu_tb/iCPU/PC_IFID_IDEX
add wave -noupdate /cpu_tb/iCPU/ECALL_IFID_IDEX
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
add wave -noupdate -radix decimal /cpu_tb/iCPU/writeBackData
add wave -noupdate -divider -height 25 {Writeback signals in Decode Module}
add wave -noupdate /cpu_tb/iCPU/iDecode/reg_dst_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {41 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 352
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
WaveRestoreZoom {34 ns} {58 ns}
