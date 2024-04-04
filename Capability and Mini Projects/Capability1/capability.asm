// Loading the Memory Addresses of PlaceBMP
llb R1, 0x08
lhb R1, 0xC0

// Starting Mario
Mario:
    jal POLL
    // Xloc
    lw R2, R0, 1
    sw R2, R1, 1
    // Yloc
    lw R2, R0, 2
    sw R2, R1, 2
    // CTL
    lw R2, R0, 3
    sw R2, R1, 0

// Starting Bucky Badger
buckyBadger:
    jal POLL
    // Xloc
    lw R2, R0, 4
    sw R2, R1, 1
    // Yloc
    lw R2, R0, 2
    sw R2, R1, 2
    // CTL
    lw R2, R0, 5
    sw R2, R1, 0

// Since DataMem has exceeded 0 + 15 Addresses, I need to load the new "starting" point for locations
llb R7, 0x2E

M:
    jal POLL
    // Xloc
    lw R2, R7, 0
    sw R2, R1, 1
    // Yloc
    lw R2, R0, 2
    sw R2, R1, 2
    // Add "M" (Updating Ctl)
    llb R8, 0x1C
    lw R2, R8, 0
    sw R2, R1, 0

A:
    jal POLL
    // Xloc
    lw R2, R7, 1
    sw R2, R1, 1
    // Yloc
    lw R2, R0, 2
    sw R2, R1, 2
    // Add "A" (Updating Ctl)
    llb R8, 0x10
    lw R2, R8, 0
    sw R2, R1, 0

R:
    jal POLL
    // Xloc
    lw R2, R7, 2
    sw R2, R1, 1
    // Yloc
    lw R2, R0, 2
    sw R2, R1, 2
    // Add "R" (Updating Ctl)
    llb R8, 0x21
    lw R2, R8, 0
    sw R2, R1, 0

// Updating to New Y2 location
llb R9, 0x31

V1:
    jal POLL
    // Xloc
    lw R2, R7, 0
    sw R2, R1, 1
    // Yloc
    lw R2, R9, 0
    sw R2, R1, 2
    // Add "V" (Updating Ctl)
    llb R8, 0x25
    lw R2, R8, 0
    sw R2, R1, 0

V2:
    jal POLL
    // Xloc
    lw R2, R7, 1
    sw R2, R1, 1
    // Yloc
    llb R8, 0x31
    lw R2, R9, 0
    sw R2, R1, 2
    // Add "V" (Updating Ctl)
    llb R8, 0x25
    lw R2, R8, 0
    sw R2, R1, 0

E:
    jal POLL
    // Xloc
    lw R2, R7, 0
    sw R2, R1, 1
    // Yloc
    lw R2, R9, 1
    sw R2, R1, 2
    // Add "E" (Updating Ctl)
    llb R8, 0x14
    lw R2, R8, 0
    sw R2, R1, 0

D:
    jal POLL
    // Xloc
    lw R2, R7, 1
    sw R2, R1, 1
    // Yloc
    lw R2, R9, 1
    sw R2, R1, 2
    // Add "D" (Updating Ctl)
    lw R2, R8, -1
    sw R2, R1, 0


R:
    jal POLL
    // Xloc
    lw R2, R7, 0
    sw R2, R1, 1
    // Yloc
    lw R2, R9, 2
    sw R2, R1, 2
    // Add "R" (Updating Ctl)
    llb R8, 0x21
    lw R2, R8, 0
    sw R2, R1, 0

D:
    jal POLL
    // Xloc
    lw R2, R7, 1
    sw R2, R1, 1
    // Yloc
    lw R2, R9, 2
    sw R2, R1, 2
    // Add "D" (Updating Ctl)
    llb R8, 0x13
    lw R2, R8, 0
    sw R2, R1, 0


Professor:
    jal POLL
    // Xloc
    lw R2, R7, 0
    sw R2, R1, 1
    // Yloc
    lw R2, R9, 3
    sw R2, R1, 2
    // CTL
    lw R2, R9, 4
    sw R2, R1, 0


// Halting. All further code is not meant to be run. Just Subroutines
hlt

POLL:
    lw R14, R1, 3
    lw R13, R0, 0
    sub R13, R14, R13
    b eq, POLL
    jr R15
