#n = 0;
#while( n < 10)
#{
#	memoria[n] = memoria[n] + 10;
#	n++;
#}
.data
	arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
.text
	la $s0, arr
	addi $t0, $zero, 0
	
	while:
		beq $t0, 10, exit
		lw $t1, 0($s0)
		addi $t1, $t1, 10
		sw $t1, ($s0)
		addi $s0, $s0, 4
		addi $t0, $t0, 1
	j while
	
	exit: 