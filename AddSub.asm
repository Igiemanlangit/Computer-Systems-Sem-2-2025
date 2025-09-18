// Calculates R1 + R2 - R3 and stores the result in R0.
// (R0, R1, R2, R3 refer to RAM[0], RAM[1], RAM[2], and RAM[3], respectively.)

// Put your code here.

    @1        // Load address of R1
    D=M       // D = R1

    @2        // Load address of R2
    D=D+M     // D = R1 + R2

    @3        // Load address of R3
    D=D-M     // D = (R1 + R2) - R3

    @0        // Load address of R0
    M=D       // R0 = result

(END)
    @END
    0;JMP     // Infinite loop