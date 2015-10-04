#KJ Sweet
#Lab 3 Prob 2
#Due Sep 21, 2015
#All work is mine unless otherwise cited
#This program carries out simple multiplication

	.data
	.align	2
a:	.word	10
b:	.word	-1
x:	.space	4

	.text
	lw	$t0,a
	lw	$t1,b
	sub	$t2,$t0,$t1	#thing to multiply by 3
	add	$t3,$t2,$t2	#this is temp
	add	$t3,$t3,$t2 	#this is the first term
	add	$t4,$t0,$t1	#the thing to multiply by 6
	add	$t5,$t4,$t4	#we'll follow the last term...
	add	$t5,$t5,$t4	#This is *3
	add	$t5,$t5,$t5	#now the value stored is *6!
	add	$t6,$t5,$t3	#This is x
	sw	$t6,x