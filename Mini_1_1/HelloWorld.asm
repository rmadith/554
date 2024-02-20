llb R3, 0x00
lhb R3, 0xC0 #### R13 has C000


loop: 
lw R7,R3,0
sw R7,R3,1
b uncond,loop
