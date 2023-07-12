.data
	pi: .float 3.14159265359
	r: .float 12.0
	zeroFloat: .float 0.0
	msg: .asciiz "A area e: "
.text
	lwc1 $f0, zeroFloat

	lwc1 $f1, pi
	
	lwc1 $f2, r
	
	# Pow
	mul.s $f2, $f2, $f2
	
	# Area do circulo
	mul.s $f3, $f1, $f2
	
	addi $v0, $zero, 4
	la $a0, msg
	syscall
	
	addi $v0, $zero, 2
	add.s $f12, $f0, $f3
	syscall
	
	
	