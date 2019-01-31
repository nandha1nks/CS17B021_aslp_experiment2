	.file	1 "Q1.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24			#Adds register sp and adds -24 and stores in sp(used to assign memory)
	sw	$fp,20($sp)				#stores register fp in the memory of location sp+20
	move	$fp,$sp				#stroes the value of sp in fp
	li	$2,7			# 0x7	#stores 7(numeric value) in $2
	sw	$2,4($fp)				#stores value is $2 in memory location of fp+4
	li	$2,5			# 0x5	#stores 5(numeric value) in $2
	sw	$2,8($fp)				#stores value is $2 in memory location of fp+8
	lw	$3,4($fp)				#accesssing data from memory, stores value at fp+4 in $3
	lw	$2,8($fp)				#accesssing data from memory, stores value at fp+8 in $2
	addu	$2,$3,$2			#adds values in $2 and $3 and stores it in $2
	sw	$2,12($fp)				#stores value in $2 in fp+12
	lw	$3,4($fp)				#explained above in line 28
	lw	$2,8($fp)				#explained above in line 29
	subu	$2,$3,$2			#subtracts the values in $3 and $2 and stores in $2
	sw	$2,12($fp)				#stores the value of $2 in fp+12 memory location
	lw	$3,4($fp)				#explained in line 28
	lw	$2,8($fp)				#explained in line 29
	mul	$2,$3,$2				#multiplies the values at $3 and $2 and stores the result in $2
	sw	$2,12($fp)				#explained in line 35
	lw	$3,4($fp)				#explained in line 28
	lw	$2,8($fp)				#explained in line 29
	teq	$2,$0,7					#checks whether it is an divide by zero error
	div	$0,$3,$2				#divides the values in $3 and $2 and stores it in $0
	mfhi	$2					#hi contains the remainder of the divison and stores this value in $2
	mflo	$2					#lo contains the quotient of the divison and stores this value in $2
	sw	$2,12($fp)				#explained in line 35
	lw	$2,4($fp)				#explained in line 28
	beq	$2,$0,$L2
	nop

	lw	$2,8($fp)
	beq	$2,$0,$L2
	nop

	li	$2,1			# 0x1
	b	$L3
	nop

$L2:
	move	$2,$0
$L3:
	sw	$2,12($fp)
	lw	$2,4($fp)
	bne	$2,$0,$L4
	nop

	lw	$2,8($fp)
	beq	$2,$0,$L5
	nop

$L4:
	li	$2,1			# 0x1
	b	$L6
	nop

$L5:
	move	$2,$0
$L6:
	sw	$2,12($fp)
	lw	$2,4($fp)
	sltu	$2,$2,1
	andi	$2,$2,0x00ff
	sw	$2,12($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
