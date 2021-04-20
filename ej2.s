.data
	arr_1: .word 0:5
    	str1: .asciiz "Ingrese un número: "
    	str2: .asciiz "Los elementos en Inverso son: \n"
.text
main:
    	la $t0, arr_1
    	li $t1,0

    	FOR:
    		bge $t1, 5, END_FOR

    		la $a0, str1
    		li $v0, 4
    		syscall 

    		li $v0, 5     
    		syscall

    		sw $v0, 0($t0) 

    		add $t1, $t1, 1
    		add $t0, $t0, 4 
    		j FOR
    	END_FOR:
    
    	la $a0, str2
   	li $v0, 4
    	syscall 

    	li $t1, 0

   	FOR_2:
  		bge $t1, 5, END_FOR_2
   		sub $t0, $t0, 4 
    		lw $t2, 0($t0) 

    		li $v0, 1 
   		move $a0, $t2
    		syscall

    		li $a0, 32 
    		li $v0, 11
    		syscall

   	 	add $t1, $t1, 1
    	j FOR_2
    	END_FOR_2:

    		jr $ra