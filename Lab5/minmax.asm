#KJ Sweet Lab5 part 2
#All work is mine unless otherwise cited
#This program asks the users how many numbers they want to compare
#It then asks them to enter that many numbers
#It then finds and prints the min and max of those numbers

	.data
start:	.asciiz "Enter n betwen 1 and 20: \n"
enter:	.asciiz	"Enter "
var:	.asciiz	" integers, one per line: \n"
nl:	.asciiz	"\n"
min:	.asciiz	"The minimum value is: "
max:	.asciiz	"The maximum value is: "
	
	.text
	la	$a0,start	#load prompt
	li	$v0,4		#print string
	syscall
	
	li	$v0,5		#read int (count)
	syscall
	add	$s0,$zero,$v0	#store count in $s0
	
	la	$a0,enter
	li	$v0,4
	syscall
	add	$a0,$zero,$s0	#load int for printing
	li	$v0,1		#print int (count)
	syscall
	la	$a0,var
	li	$v0,4
	syscall
	
	#Store the first int in min and max ($s1 and $s2)
	li	$v0, 5
	syscall
	add	$s1,$zero,$v0
	add	$s2,$zero,$v0
	
	addi	$s0,$s0,-1	#This is really the first time through the loop
	
	#now it loops reading ints (count) many times
loop:	beq	$zero,$s0,done	# If count == 0, done

	li	$v0, 5		#read an int
	syscall
	
	slt	$t0,$v0,$s1	#If $v0 (int) < $s1 (min), $t0 = 1, else $t0 = 0
	beqz	$t0,maxst	#skip setting int to min, check max
	add	$s1,$zero,$v0	#set min to int
	
maxst:	slt	$t0,$v0,$s2	#If $v0 (int) < $s2 (max), $t0 = 1, else $t0 = 0
	beq	$t0,1,cont	#skip setting int to max
	add	$s2,$zero,$v0	#set max to int

cont:	addi	$s0,$s0,-1	# count = count-1
	j	loop
	
	#print the min
done:	la	$a0,min
	li	$v0,4
	syscall
	add	$a0,$zero,$s1
	li	$v0,1
	syscall
	la	$a0,nl
	li	$v0,4
	syscall
	
	#print the max
	la	$a0,min
	li	$v0,4
	syscall
	add	$a0,$zero,$s2	
	li	$v0,1
	syscall
	la	$a0,nl
	li	$v0,4
	syscall
	
	#terminate normally
	li	$v0,10
	syscall
	
	
