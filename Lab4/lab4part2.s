.text
main:
    li      $v0,    5
    syscall 
    addu    $t0,    $0,     $v0     # read from keyboard

    add     $a0,    $t0,    $0      # print on console
    li      $v0,    1
    syscall 