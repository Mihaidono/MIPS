.text
main:
    lui $s0,1
    ori $s0, 4
    lui $t0, 4096
    sw $s0, 0($t0)