// Author: Eric Dubberstein, Joash Shankar
// CS/ECE 552 Project Phase #3
//
// Filename: lru.asm
// 
// This demonstrates the benefit 
// of the LRU replacement policy

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

LD r4, r1, 0x0E // miss
LD r4, r1, 0x0C // hit

LD r4, r2, 0x0E // miss
LD r4, r2, 0x0C // hit

LD r4, r3, 0x08 // miss

LD r4, r2, 0x0C // Hit if using LRU, 
//	it might be a miss 
//  if using victimway

halt