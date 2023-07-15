.data
	arr: .space 40
	input1: .asciiz "Enter a number: \n"
	output1: .asciiz "The media is: "
	tenFloat: .float 10.0
.text
	.globl main
	main: 
	
	li $t0, 1
	la $t1, arr
	     
	loop:
		beq $t0, 11, exit
		
		la $a0, input1
		li $v0, 4
		syscall
						
		li $v0, 6
		syscall # f0 = input()
		
		# Mover o valor digitado para o array
		s.s $f0, 0($t1)
		
		addi $t1, $t1, 4
		addi $t0, $t0, 1
	j loop
	
	exit:
	
	# Volta o contador
	li $t0, 1
	# Volta o array
	la $t1, arr

	loop2:
		beq $t0, 11, exit2
		# Carrega o numero para a memoria
		l.s $f0, 0($t1)
	
		add.s $f1, $f1, $f0
		
		addi $t1, $t1, 4
		addi $t0, $t0, 1
	j loop2
	
	exit2:
	
	lwc1 $f10, tenFloat
	div.s $f2, $f1, $f10
	
	la $a0, output1
	li $v0, 4
	syscall
	
	li $v0, 2
	mov.s $f12, $f2
	syscall
	
	li $v0, 10
	syscall
	