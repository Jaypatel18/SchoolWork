
#Lab 3: Copy the elements of an array into another.
#author: Jay Patel

#Assembler Directives
.data
.word 7
.word 3
.word 1
.word 12
.word 10
.word 2
.word 5
.word 9
.word 16
.word 11
.text
.globl main

main:
add $s0, $zero, $zero
add $t0, $zero, $zero

lui $s0, 0x1001
ori $s0,$s0,0
#$s0 contains the address of the first element of the first array

lui $t0, 0x1001
ori $t0, $t0, 0x0040
#$t0 contains the address of the first element of the second array

#############################################
# Put your code here:
add $s1 $zero $zero
addi $s2 $zero 10
Loop:lw $s3 0($s0)
sw $s3 0($t0)
addi $s0 $s0 4
addi $t0 $t0 4
addi $s1 $s1 1
bne $s1 $s2 Loop
#
#############################################

jr $ra