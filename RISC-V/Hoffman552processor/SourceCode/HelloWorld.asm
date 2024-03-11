LLB R1, 0x04    // TX/RX buffer address in R1
LHB R1, 0xC0

LLB R2, 0x05    // status register address in R2
LHB R2, 0xC0   

LLB R3, 0x0F    // mask for checking the status register for RX Queue in R3
LHB R3, 0x00

LLB R4, 0xF0    // mask for checking the status register for TX Queue in R4
LHB R4, 0x00

LLB R5, 0x2c    // pointer for location and the end of "Hello World! \n Enter your name:" 
LHB R5, 0x00

LLB R6, 0x38    // pointer to start of where we store the input and endpoint for final transmit
LHB R6, 0x00

LLB R7, 0x00    // counter for current location in data mem

LLB R8, 0x01    // for incremental moves in mem

LLB R15, 0x0d   // used to check for new line 

INITIAL_TRANSMIT:   LW R9, R2, 0                // poll status register into R9
                    AND R10, R9, R4             // mask status to get TX Queue
                    b eq, INITIAL_TRANSMIT      // branch if Queue full
                    
                    LW R10, R7, 0               // get current character from data mem
                    SW R10, R1, 0               // send current character to SPART for transmit
                    ADD R7, R7, R8              // increment data mem pointer
                    SUB R11, R5, R7             // set flag to see if we are done with inital transmit
                    b neq, INITIAL_TRANSMIT     // branch to send next character

READ_LOOP:          LW R9, R2, 0                // poll status register into R9
                    AND R10, R9, R3             // mask status register to get only RX queue status
                    b eq, READ_LOOP             // branch if the status register for RX is 0 i.e empty
                    
                    LW R11, R1, 0               // load from RX queue into R1
                    SW R11, R1, 0               // echo the input character
                    SW R11, R6, 0               // store the value back into data mem starting at address 0x31
                    ADD R6, R6, R8              // increment the store name pointer
                    SUB R12, R11, R15           // set zero flag if the last stored input was the enter key
                    b neq, READ_LOOP            // compare to 0D. only branch if not equal
                    
                    LLB R11, 0x00               // load a null character
                    LHB R11, 0x00               
                    SW R11, R6, 0               // store the null character into the end of the string
                    ADD R6, R6, R8              // increment the store name pointer


FINAL_TRANSMIT:     LW R9, R2, 0                // poll status register into R9
                    AND R10, R9, R4             // mask status to get TX Queue
                    b eq, FINAL_TRANSMIT        // branch if Queue full
                    
                    LW R10, R7, 0               // get current character from data mem
                    SW R10, R1, 0               // send current character to SPART for transmit
                    ADD R7, R7, R8              // increment data mem pointer
                    ADD R11, R10, R10           // set z flag with the null character to stop transmitting
                    b neq, FINAL_TRANSMIT       // branch to send next character

HLT
