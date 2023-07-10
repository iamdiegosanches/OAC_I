.data
	msgEntrada1: .asciiz "Entre com o primeiro valor: "
	msgEntrada2: .asciiz "Entre com o segundo valor: "
	msgSaida1: .asciiz "Os numeros sao iguais!"
	msgSaida2: .asciiz "Os numeros sao diferentes!"
.text
	addi $v0, $zero, 4
	la $a0, msgEntrada1
	syscall
	
	addi $v0, $zero, 5
	syscall
	add $s0, $zero, $v0
	
	addi $v0, $zero, 4
	la $a0, msgEntrada2
	syscall
	
	addi $v0, $zero, 5
	syscall
	add $s1, $zero, $v0
	
	beq $s0, $s1, iguais
	
	diferentes:
		addi $v0, $zero, 4
		la $a0, msgSaida2
		syscall
		
		addi $v0, $zero, 10
		syscall
	
	iguais:
		addi $v0, $zero, 4
		la $a0, msgSaida1
		syscall
		
			