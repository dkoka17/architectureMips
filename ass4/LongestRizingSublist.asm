.data
	Array: .space 4000004
	ArrayCopy: .space 1000004
	
.text
.globl main


main:
 	
 	# read input and save in s0
    add $v0, $zero, 5
    syscall
    move $s0, $v0    
    
    add $v0, $zero, 0
    move $s7, $v0
    
    write: 
    	move $s1, $s7 
    	add $s7, $s7, 1 
    	bge $s1, $s0, algoprep
    	
    	add $v0, $zero, 5
    	syscall
    	move $s2, $v0
    	
 	move $s4, $s1
    	mul $s4, $s4, 4
    	sw $s2, Array($s4) 
    	
    	b write
    
    
    algoprep:
     
    	add $v0, $zero, $zero 
    	mul $s4, $v0, 4
    	lw  $s2, Array($s4)  
    	sw $s2, ArrayCopy($s4)  
    	
    	add $v0, $zero, 1
    	move $s1, $v0
    	move $s2, $v0
    	move $s7, $v0
    	
    	#s0 n
    	#s1 length (1)
    	#s2 i (1)
    	
    	b iterator
    	
    iterator: 
    	move $s2, $s7 
    	add $s7, $s7, 1 
    	bge $s2, $s0, exit
    	
    	# s3 - v[i]
    	# s4 - i pointer
    	mul $s4, $s2, 4
    	lw  $s3, Array($s4)
    	
    	# s6 - tail[length-1]
    	# s5 - length-1 pointer
    	add $s5, $s1, -1
    	move $t1, $zero
    	move $t2, $s5 
    	move $t3, $s3 
    	mul $s5, $s5, 4
    	lw  $s6, ArrayCopy($s5)
    	
    	bge $s6, $s3, binary
    	
    	#tail[length] =v[i]
    	mul $s5, $s1, 4
    	sw $s3, ArrayCopy($s5)
    	# length ++
    	add $s1, $s1, 1
    	
    	b iterator
    	
    
    binary:
    
    	#t1 l 
    	#t2 r
    	#t3 value
    	# binary will save idx in s4 and jump to second logic with uf idx < 0
    	 
    	bgt $t1, $t2, notfound
    	
    	 
    	mul $t4, $t1, -1
    	add $t4, $t2, $t4
    	bne $t4, 0, notzero
    	b continue
    	notzero:
    		div $t4, $t4, 2
    		b continue
    		
    	continue:
    	
    	add $t4, $t4, $t1
    	
    	mul $t5, $t4, 4
    	lw $t6, ArrayCopy($t5)
    	 
    	beq $t3, $t6, found
    	
    	move $t4, $t2 
    	add $t2, $t2, -1
    	
    	bgt $t6, $t3, binary
    	
    	move $t2, $t4
    	add $t1, $t1, 1
    	b binary
    	
    found:
    	move $s4, $t4
    	b second
    	
    notfound:
    	
    	move $s4, $t1  	
    	b second
    
    
    	
    second:	
    	mul $s4, $s4, 4
    	sw $s3, ArrayCopy($s4) 
    	b iterator
	
    exit:
    	 #Exit program
    	 add $v0, $zero, 1   
    	move $a0, $s1
    	syscall
    	add $v0, $zero, 10
    	syscall
    
   



