    .text
    .globl    main           
main:  
     li   $v0, 4               # Load syscall code for print_str.
     la   $a0, askstr1         # Load address of string.
    syscall                     # Print string.
     li   $v0, 5               # Load syscall code for read.
    syscall                     # Get argument 1
    move    $t1, $v0 #save the first number in $t1
    li    $v0, 4               # Load syscall code for print_str.
    la    $a0, askstr2         # Load address of string.
    syscall                     # Print string.
     li   $v0, 5               # Load syscall code for read.
    syscall                     # Get argument 2
    move $t2, $v0 #save the second number in $t2
    
    #print the sum
    add   $t3, $t1, $t2 #save the sum in $t3
    li    $v0, 4               # Load syscall code for print_str.
    la    $a0, sumstr         # Load address of string.
    syscall                     # Print string.
    li    $v0, 1               # Load syscall code for print_int.
    move  $a0, $t3		# load int into $a0
    syscall		#print int
    
    #print the difference
    sub  $t3, $t1, $t2 # subtract the 2 numbers
    li   $v0, 4               # Load syscall code for print_str.
    la   $a0, difstr         # Load address of string.
    syscall  
    li   $v0, 1               # Load syscall code for print_int.
    move $a0, $t3		# load int into $a0
    syscall		#print int
    
    
    #print the product
    mult $t1,$t2		#multiply the numbers
    mfhi $t3			#load the remainder
    mflo $t4			#load the whole number
    li   $v0, 4               # Load syscall code for print_str.
    la   $a0, prostr         # Load address of string.
    syscall  
    li   $v0, 1               # Load syscall code for print_int.
    move $a0, $t4		# load int into $a0 
    syscall		#print int
    li   $v0, 4               # Load syscall code for print_str.
    la   $a0, decimal         # Load address of string.
    syscall		      #print a decimal between reaminder and whole number
    li   $v0, 1               # Load syscall code for print_int.
    move $a0, $t3		# load int into $a0 
    syscall		#print int
    
    #print the quotient
    div $t1,$t2		#multiply the numbers
    mfhi $t3			#load the remainder
    mflo $t4			#load the whole number
    li   $v0, 4               # Load syscall code for print_str.
    la   $a0, quostr         # Load address of string.
    syscall  
    li   $v0, 1               # Load syscall code for print_int.
    move $a0, $t4		# load int into $a0 
    syscall		#print int
    li   $v0, 4               # Load syscall code for print_str.
    la   $a0, decimal         # Load address of string.
    syscall		      #print a decimal between reaminder and whole number
    li   $v0, 1               # Load syscall code for print_int.
    move $a0, $t3		# load int into $a0 
    syscall		#print int
    
    
    

.data

askstr1:       .asciiz "Enter an integer."
askstr2:       .asciiz "Enter another integer."
sumstr:        .asciiz "\nTheir sum is : "
difstr:        .asciiz "\nTheir difference is : "
prostr:        .asciiz "\nTheir product is : "
quostr:        .asciiz "\nTheir quotient is : "
decimal:       .asciiz "."
