# Top Level Notes
### Muthu Adithya Ramnarayanan

I would like to first apologize for the poor naming of nets and modules 🫠. Towards to end of the semester I just decided to have some fun and write some cheesy logic.

Sometimes I had no idea what I was coding until I was about 75% done. But by then I decide I want job security and decide to keep it like that. I have commented and organized the code to my level best. Some of the code is from 551, so please take into account that you have already penalized me 👻

Well anyways, these are some of my notes of the problems I faced and the solutions I came up with solutions that *may* or *may not* (:/) have worked.

## - Problem 1: Was it a CPU or C code problem?

Signal Tap was not particularly useful initially because I wasn't sure how to detect edge and in fact which edges to detect. It was far easier to do the tedious copying of hex files (banks and instr) to modelsim folder and simulate it. This would've not been a pleasant experience towards the end where there are many moving parts. We saw this when we debuged Dynamic Branch Prediction. 

The issues we had in the CPU was that MEM-MEM, MEM-X or MEM-D did not work. Where as with C code, we had some issues trying to add thresholds to the image so we can offset the part that is transparent. I do wish we needed smaller transparent layers. It would have made ROM synthesis a lot easier

## - Problem 2: Could not fit ROM.

This was an issue where most of ROMs were set up as reg [6:0] mem[4099:0]. I wasn't sure how we had 5000 data points since we only had a 64x64 image. Ideally we would have 4096 datapoints. Unsure as to why it happened. We got around by skimming ROMs we did not need. 

I did try to concatenate the ROMs together with a python file. It is in 554/Muthu/Python\ Scripts/make_life_easy.ipynb. However the resulting file was 1700KB which resulted in the issue where we did not have enough array blocks. I could have written a cascaded decoder but I did not have the time at the time since we had a buggy pipelined processor at the time. 

## - Problem 3: Stack Overflow.

The Compiler assumes that the memory is 128M long. This is absolutely not true for us. In our RISC-V model (Harvard Architecture), we have 8192 long memory for both data and instructions. We see the bug when we call a function from main. It turns out that because our stack is actually not that big, the stack pointer is sent to the oblivion. In fact I think we also experienced a behaviour where if you index the addr as [14:2] of the 32 bit datapath it ends up writing into Code(?)

This is a nasty bug because this will NOT show up on Questa. This did not show up because we had not spliced the addr as [14:2] which resulted in Questa upcasting and storing the value. So we would not see it when inspecting the waves or when using $display(). I think we would have seen this issue using the Memory Viewer - Not sure about this.

To fix this, we need to change ld file in the Compiler directory so that the compiler has the assumption it is not 128M but rather 8192K. 

This is the line you need to change in RISV32.ld or RISCV64.ld (32 or 64 depending on the architecture you build)

RAM (rwx)  : ORIGIN = 0x00000000, LENGTH = ~~128M~~ 8192

## - Problem 4: Global variables need to be initialized. 

I am honestly convinced this was a problem in our CPU. However when we made global variables, it would appear that the compiler would sent it to the oblivion. We could not even initialize a global variable as Zeroes(!!?!). We just circumvented this by setting the values to non zero. I know I know :/

## - Problem 5: Do not use Parallel Busses. 

I have now realised why we learn what we learn. Initially when we were interfacing the second joystick. I had set it up in such way that the joystick output and acknowledge bits would all be one jumper cable from FPGA to the other. 

The issue was that despite adding debouncer to synchronize the data, we were seeing some flickers on signalTap. I suspect that because it was an inout, and that the GPIO was pulled up. What this would mean is there was time delta between where acknowledge flipped the data to zero and the GPIO pulled up where the secondary FPGA was highZ.

I think that that the tristate update is lot faster than the Tclk2q which makes sense I think(?). That highZ pullup causes the Main FPGA inout to pull the signal to 1 which it then tricked it self into thinking that it was a move 💀. Sounds like an engineering student from UW-Madison 😀

We switched to a UART. I was initially apprehensive of the lag. But there isn't any! or at least I don't feel it. I am no pro gamer so don't take my word for it. 


## & I guess I am done with problems or at least the big ones. Read the following at your own Risks! &

We removed the case statement to mux the data from external sources to CPU because we did not have enough ROM. This was absolutely dumb, but we were under the assumption at the time that the ROM and Registers were the same thing with Quartus. However after we removed it, it was just nice to not have another case statement :P

Sounds were cheesy. We used the debug statement back to the PC and check if it is a particular value. If it is, we start playing on the laptop. there are times where it won't play because my python script doesn't check one transaction but rather all in waiting. The issue with checking one transaction at the time is that my MacBook freaks out when too many threads are instatiated and the scheduler sends a SIGKILL. I know MacBooks Suck :/ and that my Python skills are bad but I am CompE student!

It would have been nice to use in memory editor. But I think the space use is O(n) rather than O(1) which is what our bootloader is. This would mean there is greater logic use which might be an issue depending on what you are doing. 

Oh and when you copy an old project into a new directory to make changes make sure to change .sof file. Surprisingly the programmer unlike the rest of projector uses absolute path instead of a relative path

You'll need to reset everytime you switch dynamic Branch prediction on or off

When using the a queue to write to VGA, remember to clear the previous instrcution. Otherwise it will circle around and but you in the ass!