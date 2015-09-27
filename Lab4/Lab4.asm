# KJ Sweet
# Lab4 Part 3
# All work is mine unless otherwise stated
# Some code copied from io.asm by Bob Roos
# This program performs various operations on 2 integers and print out the results, labeled. 
	
	.data
	.align	2
x:	.space	4
y:	.space	4
prompt:	.asciiz "Please enter two integers; they must be entered on seperate lines.\n"
nl:	.asciiz	"\n"
a:	.asciiz "the logical and of x and y: "
b:	.asciiz	"the logical or of x and y: "
c:	.asciiz	"the logical xor of x and y: "
d1:	.asciiz	"the logical left shift of x by 2 places: "
d2:	.asciiz	"the logical left shift of y by 2 places: "
e1:	.asciiz	"the logical right shift of x by 2 places: "
e2:	.asciiz	"the logical right shift of y by 2 places: "
f1:	.asciiz	"the arethmetic right shift of x by 2 places: "
f2:	.asciiz	"the arethmetic right shift of y by 2 places: "

	.text
	#print the prompt
	la	$a0,prompt
	li	$v0,4
	syscall
	
	li      $v0,5 	# code for read_int
	syscall         # perform the read
	sw 	$v0,x	#save in memory location x

	li      $v0,5   # load code for read_int
	syscall         # perform the read
	sw	$v0,y	#save in memory location
	
	#Execute a
	la	$a0,a
	li	$v0,4
	syscall
	
	lw	$t1,x	#$t1 will be x for the whole program
	lw	$t2,y	#$t2 will be y for the whole program
	and	$t0,$t1,$t2
	add	$a0,$zero,$t0
	li	$v0,1
	syscall
	
	la      $a0,nl
        li      $v0,4
        syscall
        
        #Execute b
	la	$a0,b
	li	$v0,4
	syscall
	
	or	$t0,$t1,$t2
	add	$a0,$zero,$t0
	li	$v0,1
	syscall
	
	la      $a0,nl
        li      $v0,4
        syscall
        
        #Execute c
	la	$a0,c
	li	$v0,4
	syscall
	
	xor	$t0,$t1,$t2
	add	$a0,$zero,$t0
	li	$v0,1
	syscall
	
	la      $a0,nl
        li      $v0,4
        syscall
        
        #Execute d1
	la	$a0,d1
	li	$v0,4
	syscall
	
	sll	$t0,$t1,2
	add	$a0,$zero,$t0
	li	$v0,1
	syscall
	
	la      $a0,nl
        li      $v0,4
        syscall
        
        #Execute d2
	la	$a0,d2
	li	$v0,4
	syscall
	
	sll	$t0,$t2,2
	add	$a0,$zero,$t0
	li	$v0,1
	syscall
	
	la      $a0,nl
        li      $v0,4
        syscall
        
        #Execute e1
	la	$a0,e1
	li	$v0,4
	syscall
	
	srl	$t0,$t1,2
	add	$a0,$zero,$t0
	li	$v0,1
	syscall
	
	la      $a0,nl
        li      $v0,4
        syscall
        
        #Execute e2
	la	$a0,e2
	li	$v0,4
	syscall
	
	srl	$t0,$t2,2
	add	$a0,$zero,$t0
	li	$v0,1
	syscall
	
	la      $a0,nl
        li      $v0,4
        syscall
        
        #Execute f1
	la	$a0,f1
	li	$v0,4
	syscall
	
	sra	$t0,$t1,2
	add	$a0,$zero,$t0
	li	$v0,1
	syscall
	
	la      $a0,nl
        li      $v0,4
        syscall
        
        #Execute f2
	la	$a0,f2
	li	$v0,4
	syscall
	
	sra	$t0,$t2,2
	add	$a0,$zero,$t0
	li	$v0,1
	syscall
	
	la      $a0,nl
        li      $v0,4
        syscall
	
	#End Program
	li	$v0,10	# code for system exit
	syscall		# terminate program