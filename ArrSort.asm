// Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// base=R1, n=R2
    @2   D=M
    @DONE
    D;JLE              // n<=0 -> done
    @2   D=M
    D=D-1
    @ISONE
    D;JEQ              // n==1 -> done

// i=0
    @4   M=0           // i
(OUTER)
    @2   D=M
    @4   D=D-M         // n - i
    @FINISH
    D;JLE             // if i>=n-1 finish

// minIdx=i, minVal=a[i]
    @4   D=M
    @6   M=D          // minIdx
    @1   D=M
    @4   D=D+M
    A=D
    D=M
    @7   M=D          // minVal

// j=i+1
    @4   D=M
    D=D+1
    @5   M=D          // j
(INNER)
    @2   D=M
    @5   D=D-M        // n - j
    @POSTINNER
    D;JLE             // j>=n -> end inner

// val = a[j]
    @1   D=M
    @5   D=D+M
    A=D
    D=M               // D = val

// if val < minVal -> update
    @7   D=D-M        // val - minVal
    @NOUPD
    D;JGE
    // minVal = a[j]
    @1   D=M
    @5   D=D+M
    A=D
    D=M
    @7   M=D
    // minIdx = j
    @5   D=M
    @6   M=D
(NOUPD)
    @5   M=M+1
    @INNER 0;JMP

(POSTINNER)
// swap a[i] and a[minIdx] if needed
    @6   D=M
    @4   D=D-M
    @NEXTI
    D;JEQ             // if minIdx==i skip swap

// tmp = a[i]
    @1   D=M
    @4   D=D+M
    A=D
    D=M
    @3   M=D          // tmp

// a[i] = a[minIdx]
    @1   D=M
    @6   D=D+M
    A=D
    D=M
    @1   A=M
    @4   A=A+M
    M=D

// a[minIdx] = tmp
    @3   D=M
    @1   A=M
    @6   A=A+M
    M=D

(NEXTI)
    @4   M=M+1
    @OUTER 0;JMP

(FINISH)
(ISONE)
    @0   M=-1
(DONE)
    @END 0;JMP