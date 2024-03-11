// Author: Eric Dubberstein, Joash Shankar
// CS/ECE 552 Project Phase #3
//
// Filename: cwf.asm
// 
// This demonstrates the benefits of critical word first

LBI r0, 0x02
LBI r1, 0x04


ST r4, r6, 0x04 // store a value

// it is a cache miss and we can continue
// sooner because of critical word first.

SRL r2, r4, r2 // do some other stuff

SLL r3, r2, r0

LD r5, r6, 0x04 // load the value




halt
