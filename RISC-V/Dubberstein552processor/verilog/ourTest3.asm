// Author: Eric Dubberstein, Joash Shankar
// CS/ECE 552 Project Phase #2
//
// Filename: ourTest3.asm
// Tests data hazards in the pipeline.
// assumes predict not taken

lbi r1, -100
lbi r0, -1
bgez r0, .taken
// it is not taken so this happens
lbi r1, 1

lbi r2, -1
add r1, r1, r2      // this should be 0

// this will happen regardless
.taken:
addi r3, r1, 10 // if correct, r3=10

halt
