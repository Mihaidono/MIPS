.data
    m: .word 10
    n: .word 5
    space: .asciiz "  \n"

.text
main:
    li $t0, 5
    addi $a0, $t0, 100

    li $v0, 1
    syscall

    lw $a1, m
    lw $a2, n

    add $a0, $a1, $a2
    
    li $v0, 1
    syscall

    li $v0, 10
    syscall