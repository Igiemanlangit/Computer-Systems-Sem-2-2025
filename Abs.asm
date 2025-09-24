// Calculates the absolute value of R1 and stores the result in R0.
// (R0, R1 refer to RAM[0], and RAM[1], respectively.)

// Put your code here.

// |R1| -> R0
    @1
    D=M            // D = R1
    @POS
    D;JGE          // if R1 >= 0 goto POS

// negative: R0 = -R1
    @1
    D=M
    D=-D
    @0
    M=D
    @END
    0;JMP

(POS)
    @0
    M=D

(END)
    @END
    0;JMP