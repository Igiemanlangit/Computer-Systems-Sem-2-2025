// AddSub01.tst
// Test case: 5 + 7 - 3 = 9

load AddSub.asm

// set inputs
set RAM[1] 5
set RAM[2] 7
set RAM[3] 3

// set up output
output-file AddSub01.out
compare-to AddSub01.cmp
output-list RAM[0] %D

// run program
run;