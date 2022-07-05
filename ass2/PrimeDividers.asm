.text
.globl main


main:
 	
 	# read input
 	#s1 current left number
 	#s2 current divider
 	#s3 raize divider (1 on first try and 2 after that)
    addi $v0, $zero, 4    
    la $a0, imput
    syscall
    addi $v0, $zero, 5
    syscall
    move $s0, $v0
    add $s2, $s2,  2
    
    
    add $s3, $s3,  1
    add $s4, $s4,  1
    move $s1, $s0 
    
    while:
    	ble $s1, 1, exit
    	
    	div  $t1, $s1, $s2,    	
    	mfhi $s5 
    	
    	
    	beq $s5, 0, printNumberAndSaveNewNumb
    	bgt $s5, 0, raizeDivider 	
    
    exit:
    	 #Exit program
    	addi $v0, $zero, 10
    	syscall
    
   

printNumberAndSaveNewNumb:
   # Print result  
    addi $v0, $zero, 1   
    move $a0, $s2
    syscall
    
    # print space
    addi $v0, $zero, 4 
    la $a0, space
    syscall
    
    move $s1, $t1 
    b while

raizeDivider:
    bgt $s2, $t1, moreThanSqrt
    add $s2, $s2, $s3
    add $s3, $s3, $s4 
    move $s4, $s7
    b while
    
moreThanSqrt:
   move $s2, $s1	
   b while
   #when divider is more than sqrt(curNumber)
    
   
.data
imput: .asciiz "Enter your number: "
space: .asciiz " "
