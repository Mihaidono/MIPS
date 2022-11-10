.data
                                                    # Definirea in memorie a vectorului

s0: .half 4, -23, 78, 45, 72, -10
len0: .half 6

.text
.globl main

main:
    la      $a0,        s0                          # adresa de memorie
    li      $t0,        0                           # counter
    li      $t2,        -32768                      # maximul din vect s0 (-32768 este valoarea minima pe care o poate lua .half)
    lh      $t1,        len0                        # lungime vect s0
    jal     maxim

    j       exit

maxim:

    subu    $sp,        $sp,        32              # Se alocă 32 bytes in stivă
    sw      $ra,        20($sp)                     # Se salvează adresa de revenire curentă
    sw      $t2,        16($sp)                     # Se salvează valoarea curentă a registrului $t2


    beq     $t0,        $t1,        afisare_maxim   # daca counter = lungimea vectorului atunci se trece la afisare_maxim
    lh      $s3,        0($a0)                      # primul element din vector este pus in $s3
    addi    $a0,        $a0,        2               # incrementare adresa de memorie pt a obtine urmatorul element din vector
    addi    $t0,        $t0,        1               # incrementare counter
    slt     $s1,        $t2,        $s3             # compar elementul curent cu valoarea maximului
    bne     $s1,        1,          maxim           # salt daca numerele nu sunt egale
    add     $t2,        $0,         $s3             # maximul devine noua valoare
    j       maxim

# XPERI - luiza paraschivescu - 0740477042 pick it 3 TM

afisare_maxim:

    jal     afisare

    lw      $ra,        20($sp)
    lw      $t2,        16($sp)

    addu    $sp,        $sp,        32

    jr      $ra


afisare:

    add     $a0,        $0,         $t2             # se trece numarul care urmeaza a fi afisat in $a0
    li      $v0,        1                           # incarcarea codului in $v0
    syscall 

# li $a0, 13			 # 13 = carriage return
# li $v0, 11 	     # 11 = vertical tab
# syscall

    jr      $ra

exit:
    li      $v0,        10
    syscall 