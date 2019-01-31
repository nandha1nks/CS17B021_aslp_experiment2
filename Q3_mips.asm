	.file	1 "Q3.c"
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
	.frame	$fp,456,$31		# vars= 424, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-456				#adds $sp and -456 and assigns to $sp(allocating space for intergers 57
	sw	$31,452($sp)				#stores $31 to $sp+452
	sw	$fp,448($sp)				#stores $fp to $sp+448
	move	$fp,$sp					#moves $sp to $fp
	lui	$28,%hi(__gnu_local_gp)			#stores %hi(__gnu_local_gp)<<16 into $28
	addiu	$28,$28,%lo(__gnu_local_gp)		#unsigned adds %lo(__gnu_local_gp)+$28 to $28
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)		#loads %got(__stack_chk_guard)($28) to $2
	lw	$2,0($2)				#loads $2+0 to $2
	sw	$2,444($fp)				#stores $2 in $fp+444
	li	$2,2			# 0x2		#assigns 2 to $2
	sw	$2,28($fp)				#stores $2 in $fp+28
	sw	$0,36($fp)				#stores $0 in $fp+36
	b	$L2					#unconditionally branch to Label2
	nop						#does nothing

$L8:
	sw	$0,40($fp)				#stores $0 in $fp+40
	li	$2,2			# 0x2		#assigns 2 in $2
	sw	$2,32($fp)				#stores $2 in $fp+32
	b	$L3					#unconditionally branch to Label3
	nop						#does nothing

$L6:
	lw	$3,28($fp)				#loads $fp+28 to $3
	lw	$2,32($fp)				#loads $fp+32 to $2
	teq	$2,$0,7					#checks whether it is an divide by zero error
	div	$0,$3,$2				#divides the values in $3 and $2 and stores it in $0
	mfhi	$2					#hi contains the remainder of the divison and stores this value in $2
	bne	$2,$0,$L4				#if($2!=$0) branches to Label4
	nop						#does nothing

	li	$2,1			# 0x1		#assigns 1 to $2
	sw	$2,40($fp)				#stores $2 in $fp+40
	b	$L5					#unconditionally branches to Label5
	nop						#does nothing

$L4:
	lw	$2,32($fp)				#stores $fp+32 in $2
	addiu	$2,$2,1					#adds $2+1 to $2
	sw	$2,32($fp)				#stores $2 to $sp+32
$L3:
	lw	$2,28($fp)				#loads $fp+28 to $2
	srl	$3,$2,31				#stores $2+32 to $3
	addu	$2,$3,$2				#stores $2 + $3 to $2
	sra	$2,$2,1					#stores $2>>1 to $2
	move	$3,$2					#moves $2 to $3
	lw	$2,32($fp)				#loads $fp+32 to $2
	slt	$2,$2,$3				#if($2<$3) then $2 = 1, $2 =0
	bne	$2,$0,$L6				#if($2!=$0) jump to Label6
	nop						#does nothing

$L5:
	lw	$2,40($fp)				#loads $2 with $fp+40
	bne	$2,$0,$L7				#if($2!=$0) then branches to Label7
	nop						#does nothing

	lw	$2,36($fp)				#loads $fp+36 to $2
	addiu	$3,$2,1					#adds $2+1 to $3
	sw	$3,36($fp)				#stores $3 to $fp+36
	sll	$2,$2,2					#stores $2<<2 to $2
	addiu	$3,$fp,448				#stores $fp + 448 to $3
	addu	$2,$3,$2				#stores $2 + $3 to $2
	lw	$3,28($fp)				#stores $fp+28 to $3
	sw	$3,-404($2)				#stores $2-404 to $3
$L7:
	lw	$2,28($fp)				#loads $fp+28 to $2
	addiu	$2,$2,1					#stores $2 + 1 to $2
	sw	$2,28($fp)				#stores $2 to $fp+28
$L2:
	lw	$2,28($fp)				#loads $fp+28 to $2
	slt	$2,$2,101				#if($2<101) then $2 = 1, then $2=0
	bne	$2,$0,$L8				#if($2!=$0) then branches to Label8
	nop						#does nothing

	move	$2,$0					#moves $2 to $0
	lw	$3,%got(__stack_chk_guard)($28)		#loads $3 with %got(__stack_chk_guard)($28)
	lw	$4,444($fp)				#loads $4 with $fp+444
	lw	$3,0($3)				#loads $3 with $3+0
	beq	$4,$3,$L10				#if($4==$3) branches to Label10
	nop						#does nothing

	lw	$2,%call16(__stack_chk_fail)($28)	#$loads $2 with %got(__stack_chk_guard)($28)
	move	$25,$2					#moves $25 with $2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail		
1:	jalr	$25					#jumps to subroutine $25
	nop						#does nothing

$L10:
	move	$sp,$fp					#moves $sp to $fp
	lw	$31,452($sp)				#loads $31 with $sp+452
	lw	$fp,448($sp)				#loads $fp with $sp+448   #dereferencing $fp
	addiu	$sp,$sp,456				#loads $sp + 448 with $sp
	j	$31					#loads $31
	nop						#does nothing

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
