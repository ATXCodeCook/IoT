; test_while_nasm.asm - basic NASM assembly language program

    bits 64
    global main
    extern puts

    section .data
A   dd      3
B   dd      7
LC0 db      "Counting"

    section .text
main:
        ; function setup
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32

        ; user code goes here
        jmp L2			;jump to L2

L3:
        mov edi, LC0		;store address of string LC0 in edi
        call    puts		;output the message to the screen
        mov eax, [A]		;fetch value at the memory address of A and store in eax
        add eax, 1		;add 1 to the value in eax (increment)
        mov [A], eax		;store previous value in the memory address of A (then, continue loop L2;
L2:
        mov edx, [A]		;fetch value at the memory address of A and store in edx
        mov eax, [B]		;fetch value at the memory address of B and store in eax
        cmp edx, eax		;compare the values in edx and eax
        jl  L3			;if above is less than jump to L3

        ; function return
        mov     eax, 0
        add     rsp, 32
        pop     rbp
        ret
