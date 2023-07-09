# Escreva um programa que leia dois números inteiros e realize as seguintes operações: 
# soma, subtração, multiplicação e divisão. Imprima o resultado na tela. 
# (MARS não consegue imprimir mais de um resultado por vez, para testar imprima um por vez

.data
	mensagem1: .asciiz "Digite o primeiro valor: "
	mensagem2: .asciiz "Digite o segundo valor: "
	resultadoSoma: .asciiz "O resultado da soma: "
	resultadoSubtracao: .asciiz "\nO resultado da subtracao: "
	resultadoMultiplicacao: .asciiz "\nO resultado da multiplicao: "
	resultadoDivisao: .asciiz "\nO resultado da divisao: "
.text
	# Ler o primeiro valor
	addi $v0, $zero, 4
	la $a0, mensagem1
	syscall
	
	addi $v0, $zero, 5
	syscall
	add $s0, $zero, $v0
	
	# Ler o segundo valor
	addi $v0, $zero, 4
	la $a0, mensagem2
	syscall
	
	addi $v0, $zero, 5
	syscall
	add $s1, $zero, $v0
	
	add $s2, $s0, $s1 # Somar
	sub $s3, $s0, $s1 # Subtrair
	mul $s4, $s0, $s1 # Multiplicar
	div $s5, $s0, $s1 # Dividir
	
	# Imprimir a soma
	addi $v0, $zero, 4
	la $a0, resultadoSoma
	syscall
	
	addi $v0, $zero, 1
	add $a0, $zero, $s2
	syscall
	
	# Imprimir a subtracao
	addi $v0, $zero, 4
	la $a0, resultadoSubtracao
	syscall
	
	addi $v0, $zero, 1
	add $a0, $zero, $s3
	syscall
	
	# Imprimir a multiplicacao
	addi $v0, $zero, 4
	la $a0, resultadoMultiplicacao
	syscall
	
	addi $v0, $zero, 1
	add $a0, $zero, $s4
	syscall
	
	# Imprimir a divisao
	addi $v0, $zero, 4
	la $a0, resultadoDivisao
	syscall
	
	addi $v0, $zero, 1
	add $a0, $zero, $s5
	syscall