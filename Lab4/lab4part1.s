.data
sir: .asciiz "It's tuesday morning"
sir2: .asciiz "Don't know MIPS"
sir3:.asciiz "ToacsimusPrime is the last MIPS"
.text
main:
    la      $a0,    sir
    li      $t0,    0               # counter for str length
    jal     strlen

    la      $a0,    sir2
    li      $t0,    0               # counter for str length
    jal     strlen

    la      $a0,    sir3
    li      $t0,    0               # counter for str length
    jal     strlen

    j exit

strlen:
    lb      $a1,    0($a0)
    beq     $a1,    $0,     strlen_end
    addi    $a0,    1               # add $a0=$a0+1
    addi    $t0,    1
    j       strlen

strlen_end:
    add     $a0,    $0,     $t0

    li      $v0,    1               # 1=print_int
    syscall 

    li $a0,13   #special codes 
    li $v0,11   #for printing in console
    syscall
    jr $ra
    


exit:
    li $v0,10
    syscall