.data
	mensagem1: .asciiz "\n… menor"
	mensagem2: .asciiz "\n… maior"
	mensagem3: .asciiz "\nDigite um valor: "
.text
	addi $v0, $zero, 4
	la $a0, mensagem3
	syscall
	
	addi $v0, $zero, 5
	syscall
	add $s0, $zero, $v0
	
	addi $v0, $zero, 4
	la $a0, mensagem3
	syscall
	
	addi $v0, $zero, 5
	syscall
	add $s2, $zero, $v0
	
	bgt $s2, $s0, menor
	
	addi $v0, $zero, 4
	la $a0, mensagem2
	syscall
	
	addi $v0, $zero, 10
	syscall
	
	menor:
		addi $v0, $zero, 4
		la $a0, mensagem1
		syscall
	
		addi $v0, $zero, 10
		syscall