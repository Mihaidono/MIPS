.data
    #var pentru ex 6
    n: .word 0x80000002
    m: .word 0x80000003
    #var pentru ex 7
    num1: .half 10
    num2: .half 30
.text
    main:
    #cod pentru ex 6
        lw $s0, n
        lw $s1, m
        add $s2, $s0, $s1
    #cod pentru ex 7
        lh $t1, num1
        lh $t2, num2
        mul $t0, $t1, $t2   
