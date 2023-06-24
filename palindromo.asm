.data
    string: .asciiz "SUBINOONIBUS"
    sim_palindromo: .asciiz "A string eh um palindromo\n"
    nao_palindromo: .asciiz "A string NAO e um palindromo\n"
.text
    addi $s5, $zero, 12
    
    la $t0, string # load address string
    lb $s0, 0($t0) # ler onde a string inicia
    add $t1, $t0, 11
    lb $s1, 0($t1) # ler o ultimo valor
    
    loop:
	bne $s0, $s1, nPalindromo
	beq $s5, $s0, sPalindromo
	
	add $t0, $t0, 1 # avanca um valor
       	lb $s0, 0($t0) 
    	sub $t1, $t1, 1
    	lb $s1, 0($t1) # volta um valor
    	
    	sub $s5, $s5, 1
       	j loop
    nPalindromo: # Caso nao seja palindomo
   	li $v0, 4
   	la $a0, nao_palindromo
   	syscall
   	j exit
    sPalindromo: # Caso seja palindromo
    	li $v0, 4
   	la $a0, sim_palindromo
   	syscall
   	j exit
   exit:
