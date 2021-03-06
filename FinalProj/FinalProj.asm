# KJ Sweet
# CS 210 Final Project
# Fall 2015
# All work is mine unless otherwise cited

# The encode function is property of Bob Roos

# This program draws a rectangle in the Bitmap Display tool.
# It currently uses a unit width and height of 16.
# The display is assumed to be set at a width of 512 and a height at 256.

	.data
	.align	2
base:	.space	2048
rows:	.word	16
cols:	.word	32

black:	.word	0x00000000
green:	.word	0x0000FF00
	.text
	
#Clear the Bitmap Display
	lw	$s0,black	# color to draw
	li	$s1,0		# loop counter
	li	$a0,0		# starting row
	li	$a1,0		# column
loop:	beq	$s1,16,rect	# THIS IS NOT A LEGAL MIPS COMMAND (but MARS allows it)
	jal	encode		# get the address for row a0, col a1
	sw	$s0,0($v0)	# draw a black pixel there
	
	li	$s2,0		# loop counter
#	add	$a0		# row
	li	$a1,0		# starting column
loop2:	beq	$s2,32,cont	# THIS IS NOT A LEGAL MIPS COMMAND (but MARS allows it)
	jal	encode		# get the address for row a0, col a1
	sw	$s0,0($v0)	# draw a black pixel there
	addi	$a1,$a1,1	# move over a col
	addi	$s2,$s2,1	# add 1 to counter
	j	loop2
	
cont:	addi	$a0,$a0,1	# move down a row
	addi	$s1,$s1,1	# add 1 to counter
	j	loop
	
#Draw a green rectangle around the edge
#top
rect:	lw	$s0,green	#color to draw
	li	$s1,0		# loop counter
	li	$a0,0		# row 1
	li	$a1,0		# starting column
loop3:	beq	$s1,32,rect2	# THIS IS NOT A LEGAL MIPS COMMAND (but MARS allows it)
	jal	encode		# get the address for row a0, col a1
	sw	$s0,0($v0)	# draw a green pixel there
	addi	$a1,$a1,1	# move over a column
	addi	$s1,$s1,1	# add 1 to counter
	j	loop3

#Bottom	
rect2:	lw	$s0,green	#color to draw
	li	$s1,0		# loop counter
	li	$a0,15		# row last
	li	$a1,0		# starting column
loop4:	beq	$s1,32,rect3	# THIS IS NOT A LEGAL MIPS COMMAND (but MARS allows it)
	jal	encode		# get the address for row a0, col a1
	sw	$s0,0($v0)	# draw a green pixel there
	addi	$a1,$a1,1	# move over a column
	addi	$s1,$s1,1	# add 1 to counter
	j	loop4
	
#Left
rect3:	lw	$s0,green	#color to draw
	li	$s1,0		# loop counter
	li	$a0,0		# starting row
	li	$a1,0		# col 1
loop5:	beq	$s1,16,rect4	# THIS IS NOT A LEGAL MIPS COMMAND (but MARS allows it)
	jal	encode		# get the address for row a0, col a1
	sw	$s0,0($v0)	# draw a green pixel there
	addi	$a0,$a0,1	# move down a row
	addi	$s1,$s1,1	# add 1 to counter
	j	loop5
	
#Right
rect4:	lw	$s0,green	#color to draw
	li	$s1,0		# loop counter
	li	$a0,0		# starting row
	li	$a1,31		# column last
loop6:	beq	$s1,16,done	# THIS IS NOT A LEGAL MIPS COMMAND (but MARS allows it)
	jal	encode		# get the address for row a0, col a1
	sw	$s0,0($v0)	# draw a green pixel there
	addi	$a0,$a0,1	# move down a row
	addi	$s1,$s1,1	# add 1 to counter
	j	loop6

#End the Program
done:	li	$v0,10
	syscall
	
encode:	# compute offset of the pizel from the base:
	lw	$t1,cols	# width of the screen
	mult	$a0,$t1		# (row#) * width
	mflo	$v0		# save in $v0
	add	$v0,$v0,$a1	# add column number
	sll	$v0,$v0,2	# multiply by 4 (4 bytes per screen unit)
	la	$t0,base	# get base address
	add	$v0,$v0,$t0	# add it to the offset--we're done
	jr	$ra
