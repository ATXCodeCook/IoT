; test_output - output NASM assembly language program

    bits 64
    global main
    extern puts

    section .data
A   dd      3
B   dd      7
LC0 db      "Test output."

    section .text
main:
        ; function setup
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32

        ; user code goes here
        mov     edi, LC0            ; point to the message
        call    puts                ; output message to screen

        ; function return
        mov     eax, 0
        add     rsp, 32
        pop     rbp
        ret
