.text
	li a7, 5
	ecall
	
loop_str:
	mv t0, zero
	mv t1, a0

loop:
	beqz t1, loop_end
	andi t2, t1, 1
	beqz t2, loop_itr

	addi t0, t0, 1

loop_itr:
	srli t1, t1, 1
	j loop
	
loop_end:
	mv a0, t0
	li a7, 1
	ecall
	
	li a7, 10
	ecall