############################# Cabeçalho da Resposta ############################
.data

rsp:  .space 30
size: .word 30

.text
	la a0, rsp
	lw a1, size
	li a7, 8
	ecall
	
	jal textmax
	
	li a7, 4
	ecall
	
	li a7, 10
	ecall

textmax:
	la t0, rsp
	li t1, 0x61
	li t2, 0x7A
	
textmax_loop:
	lbu a0, (t0)
	beqz a0, textmax_end
	bltu a0, t1, textmax_loopitr
	bgtu a0, t2, textmax_loopitr
	
textmax_do: 
	addi a0, a0, -0x20
	sb a0, (t0)

textmax_loopitr:
	addi t0, t0, 1
	j textmax_loop
	
textmax_end:
	la a0, rsp
	ret
	