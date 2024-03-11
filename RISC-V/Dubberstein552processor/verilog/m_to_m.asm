// Author: Eric Dubberstein, Joash Shankar
// CS/ECE 552 Project Phase #3
//
// Filename: m_to_m.asm
// 
// This shows the benefits of m to m 
// forwarding.

///// Initializing values///////
// set r1 to 0xABC0
lbi r1, 0xAB         // upper bits
slbi r1, 0xC0        // lower bits

// set r2 to 0xBBC0
lbi r2, 0xBB          // upper bits
slbi r2, 0xC0        // lower bits

// set r3 to 0xCBC0
lbi r3, 0xCB          // upper bits
slbi r3, 0xC0         // lower bits

// Make sure that we have no hazards 
//going into inst tests. 
nop
nop
nop
nop
nop

// use r4 as a "dumping" register

LD r4, r1, 0x0E // miss.

// isolate possible cause.
nop
nop
nop


// M->M forwarding will be used
// here since we have a store 
// that stores the result from 
// the load in the previous instruction.
LD r4, r1, 0x0C // hit.
ST r4, r1, 0x0E // hit.







halt
