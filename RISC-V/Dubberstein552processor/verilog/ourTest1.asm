// Author: Eric Dubberstein, Joash Shankar
// CS/ECE 552 Project Phase #3
//
// Filename: ourTest1.asm
// 
// This is the first of two required tests for the phase 3 submission.

LBI r0, 0x01
LBI r1, 0x0a

// There will be a RAW hazard with r1 to the previous instruction.
ADD r2, r1, r0

// There will be a RAW hazard with r2 to the previous instruction.
ADDI r3, r2, -1

SCO r4, r1, r1

// There will be a RAW hazard with r4 to the previous instruction.
XORI r4, r4, 0x0F

// more instructions

ST r4, r6, 0x06 // store a value

SRL r2, r4, r2 // do some other stuff

SLL r3, r2, r0

LD r5, r6, 0x06 // load the value




halt
