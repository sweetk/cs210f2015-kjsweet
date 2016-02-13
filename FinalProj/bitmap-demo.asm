# ASSUMPTIONS: MARS Bitmap Display is set as follows:
#
#     Unit width: 4 pixels
#     Unit height: 4 pixels
#     Display width: 512 pixels
#     Display height: 512 pixels
#     Base address: 0x10010000 [first address in ".data"]
#
# With these settings, number of addressable units is (512/4) * (512/4) = 16384
# arranged as 128 rows of 128 units each.
#
# Amount of space needed = number of units * (4 bytes per unit) = 65536
#
# Changing the unit width and height and/or the display width and height will change the
# number of units, rows, and columns.

	.data
	.align	2	# get to a word boundary
screen:	.space	65536	# See comments above
rows:	.word	128	# See comments above
cols:	.word	128	# See comments above

red:	.word	0x00FF0000
green:	.word	0x0000FF00
blue:	.word	0x000000FF

	.text

# Demonstrate the "encode" function: given a row and column, encode it as an address:
	li	$a0,25	# row number 25 goes in first argument register
	li	$a1,50	# col number 50 goes in second argument register
	jal	encode	# returns the address in register $v0
	lw	$s0,red	# put a red unit...
	sw	$s0,0($v0)	# ... in row 25, column 50
	
# Once more: this time, put a green pixel at row 50, column 75
	li	$a0,50	# row
	li	$a1,75	# col
	jal	encode	# address goes in $v0
	lw	$s0,green
	sw	$s0,0($v0)	# draw green pixel

# Now let's draw a blue vertical line started at row 10, col 10 extending 10 units down:
	
	lw	$s0,blue	# color to draw
	li	$s1,0		# loop counter
	li	$a0,10		# starting row
	li	$a1,10		# column
loop:	beq	$s1,10,done	# THIS IS NOT A LEGAL MIPS COMMAND (but MARS allows it)
	jal	encode		# get the address for row a0, col a1
	sw	$s0,0($v0)	# draw a blue pixel there
	addi	$a0,$a0,1	# move down a row
	addi	$s1,$s1,1	# add 1 to counter
	j	loop
	
done:	li	$v0,10		# program exit
	syscall

###### Function encode: given row in $a0, column in $a1, calculates memory address of (row,col),
###### places it in v0

encode:	# compute offset of the pizel from the base:
	lw	$t1,cols	# width of the screen
	mult	$a0,$t1		# (row#) * width
	mflo	$v0		# save in $v0
	add	$v0,$v0,$a1	# add column number
	sll	$v0,$v0,2	# multiply by 4 (4 bytes per screen unit)
	la	$t0,screen	# get base address
	add	$v0,$v0,$t0	# add it to the offset--we're done
	jr	$ra
	
	