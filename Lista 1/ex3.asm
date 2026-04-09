main:
	li a7, 5
	ecall
	mv t1, a0
	li t2, 0
	
loop:
	li a7, 5
	ecall
	add t2, t2, a0
	addi t1, t1, -1
	bne t1, zero, loop
	
exit:
	mv a0, t2
	li a7, 1
	ecall

	li a7, 10
	ecall