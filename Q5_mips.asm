	.file	1 "Q5.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.rdata
	.align	2
$LC0:
	.word	1
	.word	2
	.word	3
	.word	1
	.word	2
	.word	3
	.word	1
	.word	2
	.word	3
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,152,$31		# vars= 120, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-152			#Adds $sp with -152 and stores it in $sp(creating space for 19 integers)
	sw	$31,148($sp)			#stores $31 in $sp+148
	sw	$fp,144($sp)			#stores $fp in $sp+144
	move	$fp,$sp				#moves $fp to $sp
	lui	$28,%hi(__gnu_local_gp)		#stores %hi(__gnu_local_gp)<<16 in $28
	addiu	$28,$28,%lo(__gnu_local_gp)	#stores $28+%lo(__gnu_local_gp) in $28
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)	#loads %got(__stack_chk_guard)($28) in $2
	lw	$2,0($2)			#loads $2+0 to $2
	sw	$2,140($fp)			#stores $2 in $fp+140
	lui	$2,%hi($LC0)			#stores %hi($LC0)<<16 in $2
	addiu	$3,$fp,32			#stores $fp+32 in $3
	addiu	$2,$2,%lo($LC0)			#stores $2+%lo($L0) in $2
	li	$4,36			# 0x24	#stores 36 in $4
	move	$6,$4				#moves $4 to $6
	move	$5,$2				#moves $2 to $5
	move	$4,$3				#moves $3 to $4
	lw	$2,%call16(memcpy)($28)		#loads $28+%call16(memcpy) in $2
	move	$25,$2				#moves $2 to $25
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25				#jumps to subroutine $25
	nop					#does nothing

	lw	$28,16($fp)			#loads $fp+16 in $28
	lui	$2,%hi($LC0)			#stores %hi($LC0) in $2
	addiu	$3,$fp,68			#stores $fp + 68 in $3
	addiu	$2,$2,%lo($LC0)			#stores $2+%lo($LC0) in $2
	li	$4,36			# 0x24	#stores 36 in $4
	move	$6,$4				#moves $4 to $6
	move	$5,$2				#moves $2 to $5
	move	$4,$3				#moves $3 to $4
	lw	$2,%call16(memcpy)($28)		#loads %call16(memcpy)($28) in $2
	move	$25,$2				#moves $2 to $25
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25				#jumps to subroutine $25
	nop					#does nothing

	lw	$28,16($fp)			#loads $fp+16 in $28
	sw	$0,24($fp)			#loads $0 in $fp+24
	b	$L2				#conditionally branch to Label2
	nop					#does nothing

$L5:
	sw	$0,28($fp)			#stores $0 in $fp+28
	b	$L3				#unconditionally branch to Label3
	nop					#does nothing

$L4:
	lw	$3,24($fp)			#loads $fp+24 in $3
	move	$2,$3				#moves $3 to $2
	sll	$2,$2,1				#stores $2<<1 in $2
	addu	$2,$2,$3			#stores $2+$3 in $2
	lw	$3,28($fp)			#loads $fp+28 in $3
	addu	$2,$2,$3			#stores $2 + $3 in $2
	sll	$2,$2,2				#stores $2<<2 in $2
	addiu	$3,$fp,144			#stores $fp+144 in $3
	addu	$2,$3,$2			#stores $3+$2 in $2
	lw	$4,-112($2)			#loads $2-112 in $4
	lw	$3,24($fp)			#loads $fp+24 in $3
	move	$2,$3				#moves $3 to $2
	sll	$2,$2,1				#stores $2<<1 in $2
	addu	$2,$2,$3			#stores $2+$3 in $2
	lw	$3,28($fp)			#loads $fp+28 in $3
	addu	$2,$2,$3			#stores $2+$3 in $2
	sll	$2,$2,2				#stores $2<<2 in $2
	addiu	$3,$fp,144			#stores $fp+144 in $3
	addu	$2,$3,$2			#stores $3+$2 in $2	
	lw	$2,-76($2)			#loads $2-76 in $2
	addu	$4,$4,$2			#stores $4+$2 in $4
	lw	$3,24($fp)			#stores $fp+24 in $3
	move	$2,$3				#moves $3 to $2
	sll	$2,$2,1				#stores $2<<1 in $2
	addu	$2,$2,$3			#stores $2+$3 in $2
	lw	$3,28($fp)			#loads $fp+28 in $3
	addu	$2,$2,$3			#stores $2+$3 in $2
	sll	$2,$2,2				#stores $2<<2 in $2
	addiu	$3,$fp,144			#stores $fp+144 in $3
	addu	$2,$3,$2			#stores $3+$2 in $2
	sw	$4,-40($2)			#stores $2-40 in $4
	lw	$2,28($fp)			#loads 28($fp) in $2
	addiu	$2,$2,1				#stores $2 + 1 in $2
	sw	$2,28($fp)			#stores 28($fp) in $2
$L3:
	lw	$2,28($fp)			#loads 28($fp) in $2
	slt	$2,$2,3				#if($2<3) $2=1 else $2=0
	bne	$2,$0,$L4			#if($2!=$0) then branch Label4
	nop					#does nothing

	lw	$2,24($fp)			#loads 24($fp) in $2
	addiu	$2,$2,1				#srores $2 + 1 in $2
	sw	$2,24($fp)			#stores $2 in 24($fp)
$L2:
	lw	$2,24($fp)			#loads 24($fp) in $2
	slt	$2,$2,3				#if($2<3) then $2 = 1, else $s =0
	bne	$2,$0,$L5			#if($2!=$0) branch label 5
	nop					#does nothing

	move	$2,$0				#moves $0 to $2
	lw	$3,%got(__stack_chk_guard)($28)	#loads %got(__stack_chk_guard)($28) in $3
	lw	$4,140($fp)			#loads 140($fp) in $4
	lw	$3,0($3)			#loads 0($3) in $3
	beq	$4,$3,$L7			#if($4==$3) then branch Label7
	nop					#does nothing

	lw	$2,%call16(__stack_chk_fail)($28)	#loads %call16(__stack_chk_fail)($28) in $2
	move	$25,$2					#move $2 to $25
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25					#jump to subroutine $25
	nop						#does nothing

$L7:
	move	$sp,$fp				#moves $fp to $sp
	lw	$31,148($sp)			#loads $148($sp) in $31
	lw	$fp,144($sp)			#loads $144(s0) in $fp #dereferencing $fp
	addiu	$sp,$sp,152			#stores $sp+152 in $sp #dereferencing $sp
	j	$31				#jumps to $31  #indicating the end
	nop					#does nothing

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
