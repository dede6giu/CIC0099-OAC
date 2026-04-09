######################## Cabeçalho da resposta - não alterar ###################
.data 
str:	.space 32
nl:	.word 10

.text
	li a7, 8
	la a0, str
	li a1, 30
	ecall
	
	lw  a1, nl
	jal limpa
	
	li a7, 4
	la a0, str
	ecall
	
	li a7, 10
	ecall
	
######################## Escreva a função limpa a seguir #######################	
limpa:
	lbu t0, (a0)
	beq t0, a1, limpa_end
	addi a0, a0, 1
	j limpa

limpa_end:
	sb zero, (a0)
	ret