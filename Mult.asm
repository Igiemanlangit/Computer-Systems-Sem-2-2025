// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// R0 = R1 * R2  (two's-complement, O(|abs(R2)|) loop)
    @0   M=0         // sum
    @5   M=0         // sign flag

// A = abs(R1) -> R3, adjust sign
    @1   D=M
    @R1POS
    D;JGE
    @5   M=!M        // flip sign
    @1   D=M
    D=-D
(R1POS)
    @3   M=D

// B = abs(R2) -> R4, adjust sign
    @2   D=M
    @R2POS
    D;JGE
    @5   M=!M
    @2   D=M
    D=-D
(R2POS)
    @4   M=D

// while (B>0) { sum += A; B--; }
(LOOP)
    @4   D=M
    @DONE
    D;JEQ
    @3   D=M
    @0   M=M+D
    @4   M=M-1
    @LOOP
    0;JMP

(DONE)
// if sign==1 then sum = -sum
    @5   D=M
    @STORE
    D;JEQ
    @0   M=-M

(STORE)
    @0   D=M
    @0   M=D

(END) @END 0;JMP