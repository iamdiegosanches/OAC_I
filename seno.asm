.data
  message: .asciiz "Entre o valor de x: "
  message2: .asciiz "sin(x) = "
  zeroFloat: .float 0.0 #### definir o zero em float
  fatorial3: .float 6.0 #### 3!
  fatorial5: .float 120.0 ## 5!
  fatorial7: .float 5040.0 # 7!
  um: .float 1.0
.text
  lwc1 $f1, zeroFloat
  lwc1 $f11, fatorial3
  lwc1 $f12, fatorial5
  lwc1 $f13, fatorial7
  
  addi $v0, $zero, 4 # imprimir string
  la $a0, message
  syscall # print memoria[ $a0 ]
  
  addi $v0, $zero, 6  # 6 para ler um float
  syscall    ## $f0 = input()
  
  # Potencia  x^2
  mul.s $f2, $f0, $f0
  # Potencia  x^3
  mul.s $f3, $f2, $f0
  # Potencia  x^4
  mul.s $f4, $f3, $f0
  # Potencia  x^5
  mul.s $f5, $f4, $f0
  # Potencia  x^6
  mul.s $f6, $f5, $f0
  # Potencia d^7
  mul.s $f7, $f6, $f0
  
  # x^3/3!
  div.s $f8, $f3, $f11
  # x^5/5!
  div.s $f9, $f5, $f12
  # x^7/7!
  div.s $f10, $f7, $f13
  
  sub.s $f14, $f0, $f8
  add.s $f14, $f14, $f9
  sub.s $f14, $f14, $f10
  
  addi $v0, $zero, 4 # imprimir string
  la $a0, message2
  syscall # print memoria[ $a0 ]
  
  addi $v0, $zero, 2 # 2 para imprimir float
  add.s $f12, $f14, $f1
  syscall # print $f12