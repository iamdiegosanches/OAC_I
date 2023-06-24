.data
  message: .asciiz "Entre o valor de x: "
  message2: .asciiz "cos(x) = "
  zeroFloat: .float 0.0 ### definir o zero em float
  fatorial2: .float 2.0 ### 2!
  fatorial4: .float 24.0 ## 4!
  fatorial6: .float 720.0 # 6!
  um: .float 1.0
.text
  lwc1 $f1, zeroFloat
  lwc1 $f11, fatorial2
  lwc1 $f12, fatorial4
  lwc1 $f13, fatorial6
  lwc1 $f14, um
  
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
  
  # x^2/2!
  div.s $f7, $f2, $f11 
  # x^4/4!
  div.s $f8, $f4, $f12
  # x^4/6!
  div.s $f9, $f6, $f13
  
  sub.s $f10, $f14, $f7
  add.s $f10, $f10, $f8
  sub.s $f10, $f10, $f9
  
  addi $v0, $zero, 4 # imprimir string
  la $a0, message2
  syscall # print memoria[ $a0 ]
  
  addi $v0, $zero, 2 # 2 para imprimir float
  add.s $f12, $f10, $f1
  syscall # print $f12