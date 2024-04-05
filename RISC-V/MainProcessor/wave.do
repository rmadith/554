onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_tb/iCPU/clk
add wave -noupdate /cpu_tb/iCPU/rst_n
add wave -noupdate /cpu_tb/iCPU/setDataZero
add wave -noupdate /cpu_tb/iCPU/addConstant4
add wave -noupdate /cpu_tb/iCPU/pc_operand
add wave -noupdate /cpu_tb/iCPU/memRead
add wave -noupdate /cpu_tb/iCPU/memWrite
add wave -noupdate /cpu_tb/iCPU/immSel
add wave -noupdate /cpu_tb/iCPU/memType
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/inst
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/PC
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/oldPC
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/temp_PC
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/SrcA
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/SrcB
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/memWrData
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/immValue
add wave -noupdate /cpu_tb/iCPU/alu_op
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/alu_out
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/memDataOut
add wave -noupdate -radix hexadecimal /cpu_tb/iCPU/writeBackData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 188
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
WaveRestoreZoom {0 ps} {31 ps}
