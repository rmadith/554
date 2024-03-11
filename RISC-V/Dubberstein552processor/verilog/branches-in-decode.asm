// Author: Eric Dubberstein, Joash Shankar
// CS/ECE 552 Project Phase #3
//
// Filename: branches-in-decode.asm
// 
// This shows the benefits of the branches 
// in decode. It is recycled from HW4 

// load r0 with an initial value.
lbi r0, 0x00         // upper bits
slbi r0, 0x01         // lower bits

// load r1 with an initial value.
lbi r1, 0x00         // upper bits
slbi r1, 0x1C         // lower bits

beqz r0, .taken // if (r0!= 0), do the code below.
				// branch "past" the code block is
				// taken if r0==0
				
// This branch WILL be taken. Because of branches
// in decode, we will only need to flush one incorrect
// instruction from the pipeline
// as opposed to two. 

// Code below will only execute if the branch /// 
// is NOT taken. 

// load 0x05 into r1
lbi r1, 0x00         // upper bits
slbi r1, 0x05         // lower bits

// load -5 into r2
lbi r2, 0xFF         // upper bits
slbi r2, 0xFB         // lower bits

add r1, r1, r2  // after this instruction, 
				// r1 should have the value 0  
/////////////////////////////////////////////////     

// the code below will execute whether or not-taken
// the branch is taken.
.taken: 
addi r3, r1, 0x0D // if correct, r3=0x0D after 
				  //  execution.




halt
