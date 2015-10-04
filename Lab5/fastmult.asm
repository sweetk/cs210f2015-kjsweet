# KJ Sweet Lab 5 Problem 1
# This does "fast multiplication" of nonnegative integers a and b!
# This work is mine unless otherwise cited
# This code has been modified from slowmult,asm by Bob Roos

	.data
prompt:	.asciiz	"Enter two non-negative integers to be multiplied, one per line:\n"

	.text
# Section 1 of program: read in the two integers and save them in registers s0, s1:
	la	$a0,prompt	# ask user to enter values
	li	$v0,4		# print_string
	syscall
	li	$v0,5		# read_int
	syscall
	add	$s0,$zero,$v0	# First integer a in s0
	li	$v0,5		# read_int
	syscall
	add	$s1,$zero,$v0	# Second integer b in s1
	
# Section 2 of program: Find the smaller number to make multiplication faster
	#Must store larger # in b ($s1) and smaller in a ($s0)
	slt	$t0,$s1,$s0	#If $s1 < $s0, $t0 = 1, else $t0 = 0
	beqz	$t0, cont
	add	$t1,$zero,$s0
	add	$s0,$zero,$s1
	add	$s1,$zero,$t1
			
# Section 3 of program: use s0 to count down to 0 while adding b to sum:
cont:	li	$s2,0	# Sum in s2
loop:	beq	$zero,$s0,done	# If a == 0, done
	add	$s2,$s2,$s1	# sum = sum + b
	addi	$s0,$s0,-1	# a = a-1
	j	loop
done:	add	$a0,$zero,$s2	# Copy sum into a0 for printing
	li	$v0,1		# print_int
	syscall
	
# Section 4: terminate program normally:
	li	$v0,10
	syscall
