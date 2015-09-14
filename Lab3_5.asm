#KJ Sweet
#Lab 3 Prob 5
#Due Sep 21, 2015
#All work is mine unless otherwise cited
#This program converts an uppercase letter to its position in the alphabet

	.data
	.align	2
c:	.ascii	"Z"
pos:	.space	4	#the position goes here

	.text
	lw	$t0,c
	subi	$t1,$t0,65	#Subtract ascii value for A from c
	sw	$t1,pos	#Stores position in pos
	li	$v0,10
	syscall