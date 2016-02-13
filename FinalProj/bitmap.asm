# I ran this in the Bitmap Display tool using 16 for the unit width and 
# unit height, 512 for the display width, and 256 for the display height. 
# With these numbers, I have a total of 512 locations (a 32 by 16 display). 
# Since each location needs one word in memory, I have 2048 bytes reserved 
# at location "base". The pixel in row 15, column 31 is at location base + 2044.
	.data
	.align	2
base:	.space	2048 # this is (units wide) x (units tall) x 4, where units wide = width/unit width, etc.
	.text
	la	$s0,base
	li	$s1,0x00FF0000	# RED
	sw	$s1,0($s0)	# Row 0, column 0
	
	li	$s1,0x00FFFFFF	# WHITE
	sw	$s1,4($s0)	# Row 0, column 1
	
	li	$s1,0x00FFFF00	# YELLOW
	sw	$s1,8($s0)	# Row 0, column 2
	
	li	$s1,0x0000FF00  # GREEN
	sw	$s1,12($s0)	# Row 0, column 3
	
	li	$s1,0x00FF00FF  # MAGENTA
	sw	$s1,128($s0)	# Row 1, column 0
	
	li	$s1,0x00999999	# MEDIUM GRAY
	sw	$s1,2044($s0)	# LOWER RIGHT CORNER (row 15, column 31)

	li	$v0,10
	syscall
