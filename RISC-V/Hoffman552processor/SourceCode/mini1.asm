            // Initialize R1 and R2 to store addresses.
            LLB R1, 0x05
            LHB R1, 0xC0    //status register address in R1
            LLB R2, 0x04
            LHB R2, 0xC0    //TX/RX buffer address in R2

            // PART 0: test one transmit
            LLB R3, 0x15    //load 0x0015 into R3
            SW R3, R2, 0    //send 0x15 to SPART for transmit

            // PART 1: test RX. Poll status register until there is data in buffer
            // once there is data, read it out

            //build mask for checking lower bits of status register in R3
            LLB R3, 0x0F    
            LHB R3, 0x00

            // Poll the status register until there is data in the RX queue
            POLL_STATUS: LW R4, R1, 0       // poll status register into R4
                         AND R5, R4, R3     // mask status register to get only RX queue status
                         b eq, POLL_STATUS
                    
            LW R6, R2, 0        // load from RX queue into R4
            SW R6, R2, 0        // store the value back into TX queue to retransmit.
            HLT

            //config Baudrate

            //store from output from spart

            //check status register


