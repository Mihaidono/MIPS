.data
sir: .asciiz "Este joi dimineata"
.text
main:
    la      $a0,    sir
    li      $t0,    0               # counter pentru lungime sir

loop:
    lb      $a1,    0($a0)
    beq     $a1,    $0,     exit
    addi    $a0,    1               # add $a0=$a0+1
    addi    $t0,    1
    j       loop

exit:
    add     $a0,    $0,     $t0

    li      $v0,    1               # 1=print_int
    syscall 

    li      $v0,    10              # 10=exit
    syscall 