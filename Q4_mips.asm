	.file	1 "Q4.c"
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
	.frame	$fp,32,$31		# vars= 24, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32		#stores $fp-32 in 4fp #assigns space for 4 integers
	sw	$fp,28($sp)		#stores $fp in 28(fp)
	move	$fp,$sp			#moves $sp to $fp
	li	$2,5			# 0x5	#loads 5 in $2
	sw	$2,12($fp)		#stores $2 in 12($fp)
	lw	$3,12($fp)		#loads 12($fp) in $3
	li	$2,-2147483648			# 0xffffffff80000000	#loads -2147483648 in $2
	ori	$2,$2,0x1		#bitwise or of $2 and 1 stores it in $2
	and	$2,$3,$2		#stores bitwise and of $3 and $2 in $2
	bgez	$2,$L2			#if($2>=0) branch Label2
	nop				#does nothing

	addiu	$2,$2,-1		#stores $2-1 in $2
	li	$3,-2			# 0xfffffffffffffffe	#loads -2 in $3
	or	$2,$2,$3		#srores bitwise or of $2 and $3 in $2
	addiu	$2,$2,1			#stores in $2+1 in $2
$L2:
	beq	$2,$0,$L4		#if($2==$0) branches Label4
	nop				#does nothing

	li	$3,1			# 0x1	#loads 1 in $3
	beq	$2,$3,$L5		#if($2==$3) branches Label5
	nop				#does nothing

	b	$L3			#unconditionally branch to L3
	nop				#does nothing

$L4:
	lw	$2,12($fp)		#loads 12($fp) in $2
	addiu	$2,$2,1			#adds $2+1 in $2
	sw	$2,12($fp)		#stores $2 in 12($fp) 
	b	$L3			#unconditionally branch to Label3
	nop				#does nothing

$L5:
	sw	$0,8($fp)		#stores $0 in 8($fp)
	li	$2,2			# 0x2	#stores 2 in $2
	sw	$2,4($fp)		#stores $2 in 4($fp)
	b	$L6			#unconditionally branch to Label6
	nop				#does nothing

$L9:
	lw	$3,12($fp)		#loads 12($fp) in $3
	lw	$2,4($fp)		#loads 4($fp) in $2
	teq	$2,$0,7			#checks whether it is an divide by zero error
	div	$0,$3,$2		#divides the values in $3 and $2 and stores it in $0
	mfhi	$2			#hi contains the remainder of the divison and stores this value in $2
	bne	$2,$0,$L7		#if($2!=$0) then branch to Label7
	nop				#does nothing

	li	$2,1			# 0x1	#stores 1 $2
	sw	$2,8($fp)		#stores 8($fp) in $2
	b	$L8			#unconditionally branch Label8
	nop				#does nothing

$L7:
	lw	$2,4($fp)		#loads 4($fp) in $2
	addiu	$2,$2,1			#stores $2+1 in $2
	sw	$2,4($fp)		#stores $2 in 4($fp)
$L6:
	lw	$2,12($fp)		#loads 12($fp) in $2
	srl	$3,$2,31		#stores $2>>31 in $3
	addu	$2,$3,$2		#stores $3+$2 in $2
	sra	$2,$2,1			#stores $2>>1 without signed bit in $2
	move	$3,$2			#moves $2 to $3
	lw	$2,4($fp)		#loads 4($fp) in $2
	slt	$2,$2,$3		#if($2<$3) then $2=1 else $2=0
	bne	$2,$0,$L9		#if($2!=$0) then branch Label9
	nop				#does nothing

$L8:
	lw	$2,8($fp)		#loads 8($fp) in $2
	bne	$2,$0,$L10		#if($2!=$0) branch to Label10
	nop				#does nothing

	lw	$2,12($fp)		#load 12($fp) in $2
	addiu	$2,$2,1			#stores $2+1 in $2
	sw	$2,12($fp)		#stores $2 in 12($fp)
	b	$L3			#unconditionally branch to Label3
	nop				#does nothing

$L10:
	lw	$2,12($fp)		#loads 12($fp) in $2
	addiu	$2,$2,-2		#loads $2-2 in $2
	sw	$2,16($fp)		#stores $2 in 16($fp)
	lw	$2,12($fp)		#loads 12($fp) in $2
	addiu	$2,$2,2			#stores $2+2 in $2
	sw	$2,20($fp)		#stores $2 in 20($fp)
$L21:
	sw	$0,8($fp)		#stores $0 in 8($fp)
	li	$2,3			# 0x3	#loads 3 in $2
	sw	$2,4($fp)		#stores $2 in 4($fp)
	b	$L11			#unconditionally branch in Label11
	nop				#does nothing

$L14:
	lw	$3,16($fp)		#load 16($fp) in $3
	lw	$2,4($fp)		#load 4($fp) in $2
	teq	$2,$0,7			#checks whether it is an divide by zero error
	div	$0,$3,$2		#divides the values in $3 and $2 and stores it in $0
	mfhi	$2			#hi contains the remainder of the divison and stores this value in $2
	bne	$2,$0,$L12		#if($2!=$0) branch $Label12
	nop				#does nothing

	li	$2,1			# 0x1	#loads 1 in $2
	sw	$2,8($fp)		#stores $2 in 8($fp)
	b	$L13			#unconditional branch to Label13
	nop				#does nothing

$L12:
	lw	$2,4($fp)		#loads 4($fp) in $2
	addiu	$2,$2,2			#stores $2+2 in $2
	sw	$2,4($fp)		#stores $2 in 4($fp)
$L11:
	lw	$2,16($fp)		#loads 16($fp) in $2
	srl	$3,$2,31		#stores $2>>31 in $3
	addu	$2,$3,$2		#stores $3+$2 in $2
	sra	$2,$2,1			#stores $2>>1(arithmetic) in $2
	move	$3,$2			#moves $2 to $3
	lw	$2,4($fp)		#loads 4($fp) to $2
	slt	$2,$2,$3		#if($2<$3) set $2=1, $2=0
	bne	$2,$0,$L14		#if($2==$0) branch $Label14
	nop				#does nothing

$L13:
	lw	$2,8($fp)		#loads 8($fp) in $2
	bne	$2,$0,$L15		#if($2!=$0) branches Label15
	nop				#does nothing

	lw	$2,16($fp)		#loads 16($fp) in $2
	sw	$2,12($fp)		#stores $2 in 12($fp)
	b	$L3			#unconditionally branch Label3
	nop				#does nothing

$L15:
	sw	$0,8($fp)		#stores $0 in 8($fp)
	li	$2,3			# 0x3	#loads 3 in $2
	sw	$2,4($fp)		#stores $2 in 4($sp)
	b	$L16			#unconditionally branch Label16
	nop				#does nothing

$L19:
	lw	$3,16($fp)		#load 16($fp) to $3
	lw	$2,4($fp)		#load 4($fp) to $2
	teq	$2,$0,7			#checks whether it is an divide by zero error
	div	$0,$3,$2		#divides the values in $3 and $2 and stores it in $0
	mfhi	$2			#hi contains the remainder of the divison and stores this value in $2
	bne	$2,$0,$L17		#if($2!=$0) then branches to Label17
	nop				#does nothing

	li	$2,1			# 0x1	#loads 1 to $2
	sw	$2,8($fp)		#stores $2 in 8($fp)
	b	$L18			#unconditionally branch in Label18
	nop				#does nothing

$L17:
	lw	$2,4($fp)		#load 4($fp) in $2
	addiu	$2,$2,2			#stores $2+2 in $2
	sw	$2,4($fp)		#stores $2 in 4($fp)
$L16:
	lw	$2,16($fp)		#loads 16($fp) in $2
	srl	$3,$2,31		#stores $2>>31 in $3
	addu	$2,$3,$2		#stores $3+$2 in $2
	sra	$2,$2,1			#stores $2>>1(arithmetic) in $2
	move	$3,$2			#moves $2 to $3
	lw	$2,4($fp)		#loads 4($fp) in $2
	slt	$2,$2,$3		#if($2<$3) then $2=1, $2=0
	bne	$2,$0,$L19		#if($2==$0) then braches Label19
	nop				#does nothing

$L18:
	lw	$2,8($fp)		#loads 8($fp) in $2
	bne	$2,$0,$L21		#if($2!=$0) then branch to Label21
	nop				#does nothing

	lw	$2,16($fp)		#load 16($fp) in $2
	sw	$2,12($fp)		#stores $2 in 12($fp)
$L3:
	move	$2,$0			#moves $0 to $2
	move	$sp,$fp			#moves $fp to $sp
	lw	$fp,28($sp)		#loads 28($sp) in $fp	#dereferencing fp
	addiu	$sp,$sp,32		#stores $sp+32 in $32	#dereferencing sp
	j	$31			#jumps $31
	nop				#does nothing

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
