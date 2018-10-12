; test_if- test if NASM assembly language program

    bits 64
    global main
    extern puts

    section .data
A   dd      3
B   dd      7
LC0 db      "TRUE"
LC1 db      "FALSE"

    section .text
main:
        ; function setup
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32

        ; user code goes here
        mov edx, [A]		;fetch value at the memory address of A in store in edx
        mov eax, [B]		;fetch value at the memory address of B in store in eax
        cmp edx, eax		;compare the values of edx and eax
        jle L2			;if previous is less than or equal jump to L2
        call    puts            ; output the message to the screen (if not jump to L2)

L2:     mov edi, LC1		;store address of string LC1 in edi
        call    puts		;output message to the screen


        ; function return
        mov     eax, 0
        add     rsp, 32
        pop     rbp
        ret
