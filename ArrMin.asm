// Finds the smallest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// if R2==0 -> R0=0
    @2   D=M
    @NONEMPTY
    D;JGT
    @0   M=0
    @END 0;JMP
(NONEMPTY)

// curr = base (R3)
    @1   D=M
    @3   M=D

// min = *curr
    @3   D=M
    A=D
    D=M
    @0   M=D

// i = R2-1 remaining items (R4)
    @2   D=M
    D=D-1
    @4   M=D

(LOOP)
    @4   D=M
    @DONE
    D;JEQ

// advance curr
    @3   M=M+1

// val = *curr
    @3   D=M
    A=D
    D=M

// if val < min -> min = val
    @0   D=D-M     // D = val - min
    @KEEP
    D;JGE
    @3   D=M
    A=D
    D=M
    @0   M=D
(KEEP)

// dec remaining and continue
    @4   M=M-1
    @LOOP
    0;JMP

(DONE) @END 0;JMP