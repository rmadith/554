llb R3, 0x04
lhb R3, 0xC0 #### R13 has C004

llb R7, 0x1B
lhb R7, 0x00
sw R7, R3, 0

llb R7, 0x5B
lhb R7, 0x00
sw R7, R3, 0

llb R7, 0x32
lhb R7, 0x00
sw R7, R3, 0

llb R7, 0x4A
lhb R7, 0x00
sw R7, R3, 0


loop:  
llb R7, 0x48
lhb R7, 0x00
sw R7, R3, 0
b uncond,loop
