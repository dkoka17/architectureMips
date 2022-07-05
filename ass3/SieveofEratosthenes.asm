.data
	Array: .space 40004
.text
.globl main


main:
 	
 	# read input and save in s0
    addi $v0, $zero, 4    
    la $a0, imput
    syscall
    addi $v0, $zero, 5
    syscall
    
    move $s0, $v0
    
    
    
    addi $v0, $zero, 2 
    move $s7, $v0
    
    while:
    	move $s1, $s7 
    	add $s7, $s7, 1 
    	bgt $s1, $s0, exit
    
    	move $s2, $s1 
    	mul $s2, $s2, 4
    	lw $s3, Array($s2)
    	
    	bne $s3, 1, reIterate
    	 	 	
    	b while
    exit:
    	 #Exit program
    	addi $v0, $zero, 10
    	syscall
    
   

reIterate:

   # Print result  
    addi $v0, $zero, 1    # Print result
    move $a0, $s1
    syscall
    
    move $s2, $s1
    mul $s2, $s2, $s2
    
    iterator:
    	bgt $s2, $s0, while
    	 
    	
    	move $s3, $s2 
    	mul $s3, $s3, 4
    	
    	addi $v0, $zero, 1 
    	move $t1, $v0 
    	
    	sw $t1, Array($s3)
    	
    	add $s2, $s2, $s1
    	b iterator
    
    # print space
    addi $v0, $zero, 4 
    la $a0, space
    syscall
    
    move $s1, $t1 
    b while
    
   
.data
imput: .asciiz "Enter your number: "
space: .asciiz " "
