.data
    vector_1: .word 1:3
    vector_2: .word 1:3
    stringa: .asciiz "\nIngrese un elemento del vector "
    stringb: .asciiz ": "
    stringc: .asciiz "\nEl producto escalar es: "
.text
main:
    li $t2, 1
    li $t0, 0
    la $t1, vector_1

    loop1: 
        li $v0, 4
	    la $a0, stringa
	    syscall
    
        li $v0,1
        move $a0, $t2
        syscall 

        li $v0, 4
        la $a0, stringb
	    syscall

        li $v0,5 
        syscall

        bge $t0, 2, end_loop1
        sw $v0, 0($t1) 
        add $t1, $t1, 4 
        add $t0, $t0, 1 
        j loop1
    
    end_loop1:
        sw $v0, 0($t1) 
        add $t2, $t2, 1
        li $t0, 0
        la $t3, vector_2

    loop2: 
        li $v0, 4
	    la $a0, stringa
	    syscall
    
        li $v0,1
        move $a0, $t2
        syscall 

        li $v0, 4
        la $a0, stringb
	    syscall

        li $v0,5
        syscall

        bge $t0, 2, end_loop2
        sw $v0, 0($t3) 
        add $t3, $t3, 4 
        add $t0, $t0, 1 
        j loop2
    
    end_loop2:
        sw $v0, 0($t3) 
        li $t0, 0
        la $t1, vector_1
        la $t3, vector_2
        li $t6, 0
        lw $t4, 0($t1)

    Impr:
        li $t7, 1
        bge $t0, 3, Fin_Imp
        lw $t4, 0($t1)
        add $t1, $t1, 4
        lw $t5, 0($t3)
        add $t3, $t3, 4

        mul $t7, $t4, $t5
        add $t6, $t6, $t7
        add $t0, $t0, 1
        j Impr

    Fin_Imp:
        li $v0, 4
        la $a0, stringc
	    syscall
        
        li $v0, 1
        move $a0, $t6
        syscall
       

    jr $ra

    