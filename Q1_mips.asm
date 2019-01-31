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
	addiu	$sp,$sp,-24				#Adds register sp and adds -24 and stores in sp(used to assign memory)
	sw	$fp,20($sp)				#stores register fp in the memory of location sp+20
	move	$fp,$sp					#stroes the value of sp in fp
	li	$2,7			# 0x7		#stores 7(numeric value) in $2
	sw	$2,4($fp)				#stores value is $2 in memory location of fp+4
	li	$2,5			# 0x5		#stores 5(numeric value) in $2
	sw	$2,8($fp)				#stores value is $2 in memory location of fp+8
	lw	$3,4($fp)				#accesssing data from memory, stores value at fp+4 in $3
	lw	$2,8($fp)				#accesssing data from memory, stores value at fp+8 in $2
	addu	$2,$3,$2				#adds values in $2 and $3 and stores it in $2
	sw	$2,12($fp)				#stores value in $2 in fp+12
	lw	$3,4($fp)				#explained above in line 28
	lw	$2,8($fp)				#explained above in line 29
	subu	$2,$3,$2				#subtracts the values in $3 and $2 and stores in $2
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
	beq	$2,$0,$L2				#checks whether $2 == 0, if yes then program branches to Label2
	nop						#do nothing

	lw	$2,8($fp)				#explained in line 29
	beq	$2,$0,$L2				#explained in line 48
	nop						#does nothing

	li	$2,1			# 0x1		#stores 1 in $2
	b	$L3					#unconditionally branches to  L3
	nop						#does nothing

$L2:
	move	$2,$0					#moves $0 to $2
$L3:
	sw	$2,12($fp)				#assigns value in $2 to memory location 12($fp)
	lw	$2,4($fp)				#explained in line 28
	bne	$2,$0,$L4				#checks if $2 != 0, if yes then branches to label4
	nop						#does nothing

	lw	$2,8($fp)				#explained in line 29
	beq	$2,$0,$L5				#checks whether $2 == 0, if yes then program branches to label5
	nop						#does nothing

$L4:
	li	$2,1			# 0x1		#assigns 1 to $2
	b	$L6					#unconditional branch to L6
	nop						#does nothing

$L5:
	move	$2,$0					#moves $0 to $2
$L6:
	sw	$2,12($fp)				#stores the $2 in memory location 12($fp)
	lw	$2,4($fp)				#explained in line 28
	sltu	$2,$2,1					#checks if unsigned($2 < 1) if yes then $2 = 1, else $2 = 0
	andi	$2,$2,0x00ff				#stores the value of $2 && 0x00ff in $2
	sw	$2,12($fp)				#stores the value in $2 to memory location 12($fp)
	move	$2,$0					#moves $0 to $2  #dereferencing $2
	move	$sp,$fp					#moves $fp to $sp
	lw	$fp,20($sp)				#loads 20($sp) to $fp #dereferencing the frame pointer
	addiu	$sp,$sp,24				#add 24 to register sp #dereferencing the register
	j	$31					#jumps to register 31  #indicating the end
	nop						#does nothing

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
