.data
	array_1: .word 1:5 # int array (len=10) of 1 values
	text_1: .asciiz "\nIngrese un numero: "
	text_2: .asciiz "\nLos 5 primeros multiplos son:\n"
	linea: .asciiz "\n"
.text
	main:
	#primer texto
		la $a0, text_1
		syscall
	
		li $v0, 5
		syscall
		move $t3, $v0
		
		li $v0, 4
		la $a0, text_2
		syscall
		
		li $t0, 0
		li $t4, 1
		la $t1, array_1
		
		loop1:
			beq $t0, 5, exit
			mul $t2, $t4, $t3
			
			sw $t2, 0($t1) 
			add $t1, $t1, 4
			
			li $v0, 1 
			move $a0, $t2
			syscall
			
			li $v0, 4
			la $a0, linea
			syscall
			
			add $t0, $t0, 1 
			add $t4, $t4, 1 
			j loop1
		exit:
			jr $ra
		