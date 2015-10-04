#KJ Sweet
#Lab 3 Prob 1
#Due Sep 21, 2015
#All work is mine unless otherwise cited
#This program carries out a simple computation

	.data
	.align  2
a:	.word   10
b:	.word   20
c:	.word   -30
d:      .word   -40
x:	.space  4

	.text
	lw      $t0,b 	#load a into t0
	add	$t1,$t0,$t0 	#multiply b by 2, stored in t1
	lw	$t2,c	#load c into t2
	lw	$t3,d	#load d into t3
	sub	$t4,$t2,$t3	#subtract d from c, store in t4
	add	$t5,$t1,$t4	#add everything in parentheses, store in t5
	lw 	$t6,a	#load a into t6
	sub	$t7,$t6,$t5	#subtract the paren. from a, final answer, store in t7
	sw	$t7,x