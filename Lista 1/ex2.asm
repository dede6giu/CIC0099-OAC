	li a7, 5
	ecall
	mv t1, a0
	
	li a7, 5
	ecall
	mv t2, a0
	
	add t1, t1, t2 
	mv a0, t1
	li a7, 1
	ecall
	
	li a7, 10
	ecall