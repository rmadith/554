// Author: Eric Dubberstein, Joash Shankar
// CS/ECE 552 Project Phase #3
//
// Filename: ourTest2.asm
// 
// This is the second of two required tests for the phase 3 submission.

LBI r0, 0x00
LBI r1, 0x0a

// Make sure that we are only testing control hazards 
nop
nop
nop
nop
nop

// Control hazard for the next instruction. 
BEQZ r0, .Branch1

// These two instructions should not execute. 
ADDI r7, r7, -1
SCO r6, r6, r5

.Branch1:
// There will be a RAW hazard with r4 to the previous instruction.
XORI r4, r4, 0x0F

// Make sure that we are only testing control hazards 
nop
nop
nop
nop
nop

BGEZ r4, .Branch2

// These two instructions should not execute. 
ADDI r7, r7, -1
SCO r6, r6, r5

.Branch2:

// Now that we've tested control hazards, we'll do some other stuff.

ST r4, r6, 0x06 // store a value

SRL r2, r4, r2 // do some other stuff

SLL r3, r2, r0

LD r5, r6, 0x06 // load the value

// set r2 to zero.
LBI r2, 0x00
SLBI r2, 0x00

// Add 1
ADDI r2, r2, 1

// Branch should not be taken.
BEQZ r2, .Branch2

halt