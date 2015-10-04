#KJ Sweet
#Lab 3 Prob 3
#Due Sep 21, 2015
#All work is mine unless otherwise cited
#This program carries out simple multiplication and exits correctly

	.data
	.align	2
y:	.word	13
x:	.space	4

	.text
	lw	$t0,y
	add	$t1,$t0,$t0	#*2
	add	$t1,$t1,$t0	#*3
	add	$t1,$t1,$t1	#*6
	add	$t1,$t1,$t0	#*7
	sw	$t1,x
	li	$v0,10
	syscall