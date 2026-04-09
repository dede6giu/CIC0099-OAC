################# Cabeçalho da Resposta - Não altere ###########################
.data
# segmento de dados
ehpar: 	 .string "Eh par"
ehimpar: .string "Eh impar"

#segmento de codigo
.text
	li a7, 5
	ecall
	li t0, 2
	rem t0, a0, t0
	beq t0, zero, par
	
impar:
	la a0, ehimpar
	j exit
	
par:
	la a0, ehpar

exit:
	li a7, 4
	ecall

	li a7, 10
	ecall