.data

.text
	addi $s0, $zero, 0
	addi $s1, $zero, 1
	addi $s2, $zero, 10
	while:
		ble $s2, $s1, exit
		add $s0, $s0, $s1
		addi $s1, $s1, 1
	j while
	
	
	exit:
		addi $v0, $zero, 1
		add $a0, $zero, $s0
		syscall
		
		addi $v0, $zero, 10
		syscall