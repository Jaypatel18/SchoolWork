.text
.globl main

Fibonacci:
	li $t0, 0
	li $t1, 1
	li $t2, 2
	sub $t3, $a0, $t1
	bgtz  $t3, rec
	bne $a0, $t0, Loop1
	li $v0, 0
Loop1:  bne $a0, $t1, Loop2
	li $v0, 1
Loop2:  jr $ra

rec:
	sub $sp, 8
	sw $s0, 0($sp)
	sw $ra, 4($sp)

	move $t5, $a0
	sub  $a0, 1
	jal  Fibonacci
	move $s0, $v0

	move $a0, $t5
	sub  $a0, 2
	jal  Fibonacci
	move $s1, $v0

	add $v0, $s1, $s0

	lw   $s0,($sp)
	lw   $ra,4($sp)
	add  $sp,8
	jr   $ra
main:
	li $a0, 2
	sub $sp, 4
	sw $ra, 0($sp)
	jal Fibonacci
	move $t1, $v0
	lw $ra, 0($sp)
	add $sp, 4
	jr $ra