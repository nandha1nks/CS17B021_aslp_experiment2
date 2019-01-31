	.file	1 "Q2.c"
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
	.frame	$fp,72,$31		# vars= 40, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72			#adds register sp and adds -72 and stores it in $sp thus representing 9 integers space created
	sw	$31,68($sp)			#stores $31 in 68($sp) indicating the end of the array
	sw	$fp,64($sp)			#stores the $fp in memory location 64($sp)
	move	$fp,$sp				#moves $fp to $sp
	lui	$28,%hi(__gnu_local_gp)		#moves %hi(__gnu_local_gp) left by 16 bit and stores it in $28
	addiu	$28,$28,%lo(__gnu_local_gp)	#adds %lo(__gnu_local_gp) and value in $28 and stores it in $28
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)	#assigns the value in $28+%got(__stack_chk_guard) to $2
	lw	$2,0($2)			#loads the value in $2+0 to $2
	sw	$2,60($fp)			#stores the value in $fp to $fp+60
	li	$2,1			# 0x1	#loads $2 with 1
	sw	$2,40($fp)			#stores the value in $2 to memory location $fp+40
	li	$2,2			# 0x2	#loads $2 with 2
	sw	$2,44($fp)			#stores the value in $2 to memory location $fp+44
	li	$2,3			# 0x3	#loads $2 with 3
	sw	$2,48($fp)			#stores the value in $2 to memory location $fp+48
	li	$2,4			# 0x4	#loads $2 with 4
	sw	$2,52($fp)			#stores the value in $2 to memory location $fp+52
	li	$2,5			# 0x5	#loads $2 with 5
	sw	$2,56($fp)			#stores the value in $2 to memory location $fp+56
	li	$2,5			# 0x5	#loads $2 with 5
	sw	$2,32($fp)			#stores the value in $2 to memory location $fp+32
	li	$2,2			# 0x2	#loads $2 with 2
	sw	$2,36($fp)			#stores the value in $2 to memory location $fp+36
	sw	$0,28($fp)			#stores the value in $0 to memory location $fp+28
	b	$L2				#unconditional branch to Label2
	nop					#does nothing

$L3:
	lw	$2,28($fp)			#loads the value in $fp to $2
	sll	$2,$2,2				#stores the value of $2<<2 in $2
	addiu	$3,$fp,64			#unsignly adds $fp and 64 and stores it in $3
	addu	$2,$3,$2			#adds $3 and $2 and stores it in $2
	lw	$3,-24($2)			#loads the value in $2-24 to $3
	lw	$2,36($fp)			#loads the value in $fp+32 to $2
	addu	$3,$3,$2			#adds the $2 and $3 and assigns it to $3
	lw	$2,28($fp)			#loads $2 with $fp+28
	sll	$2,$2,2				#explained in line 51
	addiu	$4,$fp,64			#unsignly adds $fp and 64 and stores it in $4
	addu	$2,$4,$2			#adds $4 and $2 and stores it in $2
	sw	$3,-24($2)			#stores $3 in $2-32
	lw	$2,28($fp)			#loads $fp to $2
	addiu	$2,$2,1				#assigns the $2 with $2+1
	sw	$2,28($fp)			#stores $2 in $fp+28
$L2:
	lw	$3,28($fp)			#loads $fp+28 in $3
	lw	$2,32($fp)			#loads $fp+32 in $2
	slt	$2,$3,$2			#if ($3<$2) then $2 = 1 else no
	bne	$2,$0,$L3			#checks if ($2!=0), if yes then branches to Lable3
	nop					#does nothing

	move	$2,$0				#moves $0 to $2
	lw	$3,%got(__stack_chk_guard)($28)	#loads %got(__stack_chk_guard)($28) to $3
	lw	$4,60($fp)			#loads $fp+60 to $4
	lw	$3,0($3)			#loads $3+0 to $3
	beq	$4,$3,$L5			#if $4 == $3 branches to Label5
	nop					#does nothing

	lw	$2,%call16(__stack_chk_fail)($28)	#loads %call16(__stack_chk_fail)($28) to $2
	move	$25,$2					#moves $2 to $25
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25					#calls the subroutine $25
	nop						#does nothing

$L5:
	move	$sp,$fp			#moves $fp to $sp
	lw	$31,68($sp)		#loads $sp+68 with $31
	lw	$fp,64($sp)		#loads 64($sp) to $fp  #dereferencing fp
	addiu	$sp,$sp,72		#adds $sp and 72 and stores it $sp #dereferncing $sp
	j	$31			#jumps to $31
	nop				#does nothing

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
