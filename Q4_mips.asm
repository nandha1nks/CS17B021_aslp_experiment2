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
	addiu	$sp,$sp,-32
	sw	$fp,28($sp)
	move	$fp,$sp
	li	$2,5			# 0x5
	sw	$2,12($fp)
	lw	$3,12($fp)
	li	$2,-2147483648			# 0xffffffff80000000
	ori	$2,$2,0x1
	and	$2,$3,$2
	bgez	$2,$L2
	nop

	addiu	$2,$2,-1
	li	$3,-2			# 0xfffffffffffffffe
	or	$2,$2,$3
	addiu	$2,$2,1
$L2:
	beq	$2,$0,$L4
	nop

	li	$3,1			# 0x1
	beq	$2,$3,$L5
	nop

	b	$L3
	nop

$L4:
	lw	$2,12($fp)
	addiu	$2,$2,1
	sw	$2,12($fp)
	b	$L3
	nop

$L5:
	sw	$0,8($fp)
	li	$2,2			# 0x2
	sw	$2,4($fp)
	b	$L6
	nop

$L9:
	lw	$3,12($fp)
	lw	$2,4($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	bne	$2,$0,$L7
	nop

	li	$2,1			# 0x1
	sw	$2,8($fp)
	b	$L8
	nop

$L7:
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
$L6:
	lw	$2,12($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	move	$3,$2
	lw	$2,4($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L9
	nop

$L8:
	lw	$2,8($fp)
	bne	$2,$0,$L10
	nop

	lw	$2,12($fp)
	addiu	$2,$2,1
	sw	$2,12($fp)
	b	$L3
	nop

$L10:
	lw	$2,12($fp)
	addiu	$2,$2,-2
	sw	$2,16($fp)
	lw	$2,12($fp)
	addiu	$2,$2,2
	sw	$2,20($fp)
$L21:
	sw	$0,8($fp)
	li	$2,3			# 0x3
	sw	$2,4($fp)
	b	$L11
	nop

$L14:
	lw	$3,16($fp)
	lw	$2,4($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	bne	$2,$0,$L12
	nop

	li	$2,1			# 0x1
	sw	$2,8($fp)
	b	$L13
	nop

$L12:
	lw	$2,4($fp)
	addiu	$2,$2,2
	sw	$2,4($fp)
$L11:
	lw	$2,16($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	move	$3,$2
	lw	$2,4($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L14
	nop

$L13:
	lw	$2,8($fp)
	bne	$2,$0,$L15
	nop

	lw	$2,16($fp)
	sw	$2,12($fp)
	b	$L3
	nop

$L15:
	sw	$0,8($fp)
	li	$2,3			# 0x3
	sw	$2,4($fp)
	b	$L16
	nop

$L19:
	lw	$3,16($fp)
	lw	$2,4($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	bne	$2,$0,$L17
	nop

	li	$2,1			# 0x1
	sw	$2,8($fp)
	b	$L18
	nop

$L17:
	lw	$2,4($fp)
	addiu	$2,$2,2
	sw	$2,4($fp)
$L16:
	lw	$2,16($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	move	$3,$2
	lw	$2,4($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L19
	nop

$L18:
	lw	$2,8($fp)
	bne	$2,$0,$L21
	nop

	lw	$2,16($fp)
	sw	$2,12($fp)
$L3:
	move	$2,$0
	move	$sp,$fp
	lw	$fp,28($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
