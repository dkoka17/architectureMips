.text
.globl main
main:
 	
 	# Write Input and store number in $s0
    addi $v0, $zero, 4    
    la $a0, imput
    syscall
    addi $v0, $zero, 5
    syscall
    move $s0, $v0
    
     
    div  $s1, $s0, 100 	# Store hundred number in $s1
    div  $s0, $s1     	
    mfhi $s5            # save reminder in $s5
    
    mul $t1, $s1, 100
    sub $s1, $s0, $t1	# save number without hundreds in $s1

        
    div  $t2, $s1, 10 	# Store decimal number in $t2
    div  $s0, $t2     
    mfhi $s6            #  save reminder in $s6
    
    mul $t1, $t2, 10
    sub $t1, $s1, $t1	# save number without hundreds and deciaml in $t1

    div $t0, $s0, $t1     
    mfhi $s7        	# save reminder in $s7   
    
    
    
  
     # Print result
     
    addi $v0, $zero, 1   
    move $a0, $s5
    syscall
    
    # print space
    addi $v0, $zero, 4 
    la $a0, space
    syscall
    
    addi $v0, $zero, 1  
    move $a0, $s6
    syscall
    
    # print space
    addi $v0, $zero, 4  
    la $a0, space
    syscall
    
    addi $v0, $zero, 1    # Print result
    move $a0, $s7
    syscall
    
    #Exit program
    addi $v0, $zero, 10
    syscall
.data
imput: .asciiz "Enter your number: "
space: .asciiz " "