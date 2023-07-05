# for(x = 0; x < num - 1; x++){       
#
#        for(y = 0; y < num - x - 1; y++){          
#
#            if( arr[y] > arr[y + 1] ){               
#
#               troca( arr[y], arr[y+1] );
#
#            }
#
#        }
.data
	arr: .word 1, 9, 44, 2, 7, 55
	num: .word 6	# tamanho do vetor
	message: .asciiz "Sorted arr: "
	space: .asciiz " "
.text
	# Definir o array
	la $s0, arr
	
	# Tamanho do vetor (num)
	lw $s1, num
	
	# Definir o valor de x
	li $s2, 0
	
	# salva o endereco da primeira posicao do arr
	move $s7, $s0
	
	loopX:
		# x < num - 1
		beq $s1, $s2, exit
		
		# Definir o valor de y=s3
		li $s3, 0
		
		loopY:
			# y < num - x - 1
			sub $s4, $s1, $s2 # num - x
			sub $s4, $s4, 1   # num - x - 1
			beq $s4, $s3, continuaX
		
			# arr[y]
			lw $t1, 0($s0)
			
    			addi $t2, $s0, 4 # avanca 4 bytes
    			
    			# arr[y+1]
    			lw $t3, 0($t2)
    		
			# if( arr[y] <= arr[y + 1] ) vai para proxima iteracao
			ble $t1, $t3, continuaY
			
			jal troca
		continuaY:
			# y++
			add $s3, $s3, 1
			add $s0, $s0, 4
			j loopY	
	continuaX:
		# x++
		addi $s2, $s2, 1
		# Volta o endereco para a primeira posicao do array
		move $s0, $s7
		j loopX
	troca:
		lw $t1, 0($s0)
		lw $t3, 0($t2)
		sw $t1, 0($t2)
		sw $t3, 0($s0)	
		
		jr $ra
	exit:
		# imprimir vetor
		addi $v0, $zero, 4
  		la $a0, message
  		syscall
  		
		li $s6, 0
		print_vet:
			beq $s6, $s1, exit_print
			
			lw $t1, 0($s0)
			
			addi $v0, $zero, 1
			add $a0, $t1, $zero
			syscall
			
			add $s0, $s0, 4
			add $s6, $s6, 1
			
			# Imprimir um espaco
			addi $v0, $zero, 4
  			la $a0, space
  			syscall
  			
			j print_vet
		exit_print:
		
		