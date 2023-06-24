.data
  num1: .asciiz "Digite o primeiro numero: "
  num2: .asciiz "Digite o segundo numero: "
  result: .asciiz "O resultado da multiplicacao e: "
.text

  li $v0, 4
  la $a0, num1
  syscall
 
  addi $v0, $zero, 5
  syscall
  add $s0, $zero, $v0
  
  li $v0, 4
  la $a0, num2
  syscall
  
  addi $v0, $zero, 5
  syscall
  add $s1, $zero, $v0
  
  # 1
  andi $s2, $s0, 1     # Descobrir se o numero e par 00000 ou impar 00001
  not $s5, $s2         # 11111 par, 11110 impar
  add $s2, $s5, 1      # 00000 par, 11111 impar
  
  and $s3, $s1, $s2    # $s1 e 00000 (Vai ficar zero se for par) ou 11111 (valor do registrador se for impar)
  
  # Variavel soma
  add $s4, $s3, $zero  # Soma os valores que o valor do primeiro registrador for impar  
  
  # 2 
  srl $s0, $s0, 1 # /2
  sll $s1, $s1, 1 # *2
  
  andi $s7, $s0, 1
  not $s5, $s7
  add $s7, $s5, 1
  
  and $s3, $s1, $s7
  
  # Variavel soma
  add $s4, $s3, $s4
  
  # 3
  srl $s0, $s0, 1 # /2
  sll $s1, $s1, 1 # *2
  
  andi $s7, $s0, 1
  not $s5, $s7
  add $s7, $s5, 1
  
  and $s3, $s1, $s7
  
  # Variavel soma
  add $s4, $s3, $s4
  
  # 4 
  srl $s0, $s0, 1 # /2
  sll $s1, $s1, 1 # *2
  
  andi $s7, $s0, 1
  not $s5, $s7
  add $s7, $s5, 1
  
  and $s3, $s1, $s7
  
  # Variavel soma
  add $s4, $s3, $s4
  
  # 5 
  srl $s0, $s0, 1 # /2
  sll $s1, $s1, 1 # *2
  
  andi $s7, $s0, 1
  not $s5, $s7
  add $s7, $s5, 1
  
  and $s3, $s1, $s7
  
  # Variavel soma
  add $s4, $s3, $s4

  addi $v0, $zero, 4
  la $a0, result
  syscall
  
  addi $v0, $zero, 1
  add $a0, $s4, $zero
  syscall
  