.data
array:    .space 100
ask:      .asciiz "Cate numere vor fi introduse: "
intask:   .asciiz "Introdu un numar intreg: "

min:      .asciiz "Numar minim: "
max:      .asciiz "Numar maxim: "

display:  .asciiz "Array: "
space:    .asciiz " "
nextline: .asciiz "\n"
.text
.globl main
main:
    la      $a0,    ask                 # ask --> cat va fi lungimea array-ului
    li      $v0,    4                   # 4=print_string
    syscall 
    li      $v0,    5                   # 5=read_int
    syscall 

    move    $t1,    $v0                 # lungime array retinuta in $t1
                                        # add $t1, $0, $v0

    la      $t0,    array               # incarcare adresa array
    li      $t2,    0                   # counter = 0
    lw      $t3,    ($t0)               # initializare min = array[0]
    lw      $t4,    ($t0)               # initializare max = array[0]
while:
    la      $a0,    intask              # utilizatorul a introdus un nr intreg
    li      $v0,    4                   # 4=print_string --> printarea mesajului in consola
    syscall 
    li      $v0,    5                   # 5=read_int --> citirea intregului de la tastatura
    syscall 
    sw      $v0,    ($t0)               # stocare nr
end:
    add     $t0,    $t0,        4       # incrementare array la indexul urmator
    add     $t2,    $t2,        1       # incrementare counter   --> counter++
    blt     $t2,    $t1,        while   # verificare daca counter < lungime array introdusa
endw:
    la      $a0,    display             # Display "Array:"
    li      $v0,    4
    syscall 
    li      $t0,    0                   # initilizare array index = 0
    li      $t2,    0                   # initialzare counter=0
    la      $t0,    array               # incarcare adresa array in $t0
sprint:
    lw      $t6,    ($t0)               # incarcare sir in reg $t6 - pentru prelucrare
    move    $a0,    $t6                 # mutare in reg $a0 pentru printare
    li      $v0,    1                   # 1=print_int
    syscall 
    la      $a0,    space               # Display " "
    li      $v0,    4
    syscall 
    add     $t0,    $t0,        4       # incrementare - index++
    add     $t2,    $t2,        1       # incrementare - counter++
    blt     $t2,    $t1,        sprint  # branch to while counter < lungime array   blt = Branch on Less Than
    li      $t2,    0                   # initialare size counter = zero
    la      $t0,    array               # incarcare adresa array in $t0
    add     $t0,    $t0,        4       # incrementare - index++
    add     $t2,    $t2,        1       # incrementare - counter++
loop:
    lw      $t8,    ($t0)               # t8 = elementu urmator in array
    bge     $t8,    $t3,        notMin  # array element >= min goto notMin
    move    $t3,    $t8                 # min = array[i]
    j       notMax
notMin:
    ble     $t8,    $t4,        notMax  # if array element <= max goto notMax   ble = Branch on Less Than Equal
    move    $t4,    $t8                 # max = array[i]
notMax:
    add     $t2,    $t2,        1       # incr counter
    add     $t0,    $t0,        4       # incrementare - index++
    blt     $t2,    $t1,        loop    # counter < lungime, reluare loop
cons_print:
    la      $a0,    nextline            # Display "\n"
    li      $v0,    4
    syscall 
    la      $a0,    min                 # Display "Numar minim:"
    li      $v0,    4
    syscall 
    move    $a0,    $t3                 # displays min number in array
    li      $v0,    1
    syscall 
    la      $a0,    nextline            # Display "\n"
    li      $v0,    4
    syscall 
    la      $a0,    max                 # Display "Numar maxim:"
    li      $v0,    4
    syscall 
    move    $a0,    $t4                 # displays max number in array
    li      $v0,    1
    syscall 
    li      $v0,    10                  # End Of Program
    syscall 