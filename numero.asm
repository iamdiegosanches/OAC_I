.data 
	mensagem: .asciiz "Digite um numero: "
	enter: .asciiz "\n"
	mensagemFinal: .asciiz "O numero digitado foi: "
.text
	# Tamanho da pilha
	add $s5, $zero, 0
	whileEmpilha: 
		addi $v0, $zero, 4
		la $a0, mensagem
		syscall
		
		jal readNum
		
		# if s1 == enter, s1 == espaco
		beq $s1, 10, endEmpilha
		beq $s1, 32, endEmpilha
		
		subu $sp, $sp, 4
  		sw $s2, ($sp)  # empilha
		add $s5, $s5, 1
	j whileEmpilha
	
	readNum:
		addi $v0, $zero, 12
		syscall
		add $s1, $zero, $v0
		
		sub $s2, $s1, 48
		
		addi $v0, $zero, 4
		la $a0, enter
		syscall
		
		jr $ra

	endEmpilha:
		add $t0, $zero, 1
		
		add $s4, $zero, 0
		whileDesempilha:
			beq $s5, $0, exit  # Verifica se a pilha está vazia
			
			lw $s3, ($sp)    # desempilha $s3
			addu $sp, $sp, 4 # volta o topo da pilha
  
			mul $t1, $t0, $s3
			add $s4, $s4, $t1
			
			mul $t0, $t0, 10
			sub $s5, $s5, 1
		j whileDesempilha
		
	exit:
	
		addi $v0, $zero, 4
		la $a0, mensagemFinal
		syscall
		
		# Imprimir o numero
		addi $v0, $zero, 1
		add $a0, $zero, $s4
		syscall
		
		# Termina o programa
		addi $v0, $zero, 10
		syscall
