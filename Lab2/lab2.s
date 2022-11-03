.data
    sir1: .ascii "Buna ziua\n"
    sir2: .asciiz "Buna seara"

.text
.globl main
    li $v0, 4   # 4 este folosit pentru printarea stringurilor
    la $a0, sir1
    syscall

    li $v0, 4
    la $a0, sir2
    syscall
