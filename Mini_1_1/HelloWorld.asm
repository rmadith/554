# Location of TX/RX Buffer


llb R1, 0x04
lhb R1, 0xC0                #### R1 has C004

and R2, R2, R0              #### Address to data mem

realStart:
    llb R3, 0x01
lhb R3, 0x00                #### Constant 1


llb R4, 0xF0                #### 0x00F0 for getting the TX state
lhb R4, 0x00

llb R5, 0x0F                #### 0x000F for getting the RX state
lhb R5, 0x00

llb R7, 0x17                #### 0x17 con stant to compare to check if Hello World is printed
lhb R7, 0x00

llb R14, 0x0D               #### 0x0D constant to check for carriage return
lhb R14, 0x00

# Should load VT100 Escape Chars

llb R12, 0x1B                #### Load Escape Char
lhb R12, 0x00
sw R12, R1, 0   

llb R12, 0x5B                #### Load [
lhb R12, 0x00
sw R12, R1, 0

llb R12, 0x32                #### Load 2
lhb R12, 0x00
sw R12, R1, 0

llb R12, 0x4A                #### Load J
lhb R12, 0x00
sw R12, R1, 0


### Start Transmitting

init:
    and R2, R2, R0
    and R9, R9, R0              # Clearing data pointers
    and R6, R6, R0              # Sanity Check Clearing
    and R8, R8, R0

llb R9, 0x17
lhb R9, 0x00

start:
        lw R6, R1, 1            # Load Status Register
        and R6, R6, R4          # Get just TX State
        srl R6, R6, 4
        b eq, startWait         # Check if TX remaining is Zero, if so start polling and wait
        and R0, R0, R0
        lw R13, R2, 0
        sw R13, R1, 0           # Write the letter if there is space
        add R2, R2, R3          # Add 1 to change to the next mem address
        sub R8, R7, R2          # Check where we are in the printing
        b eq, inputPrep         # Branch to Input Poll
        b uncond, start         # Still need to print

startWait:
        lw R6, R1, 1            # Load Status Register
        and R6, R6, R4          # Get just TX State
        srl R6, R6, 4  
        b neq, start            # Check if TX remaining is not zero, if so start transmission
        b uncond, startWait

inputPrep:
        llb R2, 0x1d
        lhb R2, 0x00

inputPoll:
        lw R6, R1, 1            # Load Status Register
        and R6, R6, R5          # Get just RX state
        b eq, inputPoll         # No Values yet
        lw R8, R1, 0            # If you reach here, there is data
        sw R8, R1, 0
        sub R10, R8, R14         # Check for carriage return
        b eq, print
        sw R8, R2, 0            # Store it to data memory, not a carriage return
        add R2, R2, R3          # Increment data memory pointer
        b uncond, inputPoll      

print:
        lw R6, R1, 1            # Load Status Register
        and R6, R6, R4          # Get just TX State
        srl R6, R6, 4
        b eq, printWait         # Check if TX remaining is Zero, if so start polling and wait
        sub R10, R9, R2         # Check to reach end of name
        b eq, done               # Go Back to initialization
        lw R13, R9, 0 
        sw R13, R1, 0            # Write the letter if there is space
        add R9, R9, R3          # Add 1 to change to the next mem address
        b uncond, print

printWait:
        lw R6, R1, 1            # Load Status Register
        and R6, R6, R4          # Get just TX State
        srl R6, R6, 4  
        b neq, print            # Check if TX remaining is not zero, if so start transmission
        b uncond, printWait

done:
    hlt