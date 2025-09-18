// AddSub02.tst
// Test case: 10 + 20 - 15 = 15

load AddSub.asm

// set inputs
set RAM[1] 10
set RAM[2] 20
set RAM[3] 15

// set up output
output-file AddSub02.out
compare-to AddSub02.cmp
output-list RAM[0] %D

// run program
run;