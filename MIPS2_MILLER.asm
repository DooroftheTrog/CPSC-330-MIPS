  .data
 Array: .word 14, 12, 13, 5, 9, 11, 3, 6, 7, 10, 2, 4, 8, 1 
 
 .text 
 .globl main 
main: 
la $a0, Array # sets the base adrress to that of the array
addi $t5, $a0, -4  #set $t5 for exit condition
addi $a0, $a0, 48 #go to the second to last element of the array

check:
lw $t0, ($a0) # set $t0 to the current element
lw $t1, 4($a0) # set $ t1 to the previous element
bgt $t0, $t1, swap # if the current element is greater than the previous element then swap
addi $a0, $a0, -4 # decrement to next element
bne $t5, $a0, check # if array is not less than first element then loop
j end

swap:
sw $t0, 4($a0) #store higher word in the later pos
sw $t1, ($a0) # store lesser word in earlier pos
la $a0, Array # reset to end of array
addi $a0, $a0, 48
j check # jump back to checking

end: