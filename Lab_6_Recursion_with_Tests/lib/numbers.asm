; basic stub file for lab 5

        bits    64
        global  n_len, n_dtoi, n_btoi

        section .text

	
; in each of these functions, the address of the string is in rdi
; you may use rax, rcx, rdx freely. Do not modify rbx or rbp
n_len:
        ; loop over all chars looking for null byte
        xor     rax, rax     ; cheap zero
        xor     rcx, rcx

len_loop:
        mov     dl, [rdi+rax]
        cmp     dl, 0       ; is it a zero byte
        jz      len_done
        inc     rax
        jmp     len_loop
len_done:
        ret

     ;check if binary starts with '0b_'
btoi_check:
	mov     dl, [rdi+rax]
        cmp     dl, '0'       ; is it a zero byte
        jnz     n_btoi_done
        inc     rax
        jmp     len_loop
	mov     dl, [rdi+rax]
        cmp     dl, 'b'       ; is it a 'b' byte
        jnz     n_btoi_done
        inc     rax
        jmp     len_loop
	mov     dl, [rdi+rax]
        cmp     dl, '_'       ; is it a '_' byte
        jnz     n_btoi_done
        inc     rax
        jmp     len_loop
bcheck_done:
	ret

	;begin lab 5 code-Patrick Cook
	;decimal string to unsigned int function
n_dtoi:
	xor	rax, rax
	xor	rcx, rcx

n_dtoi_loop:
	mov	dl, [rdi+rax]	;move first char in num string to convert
	cmp	dl, 0		;if zero complete
	jz	n_dtoi_done
	inc	rax		;increment rax for next loop
	sub	rdx, '0'	;subtract ascii value for zero to get int
	push	rdx		;move current digit in dl to stack
	imul	rdx, 10		;multiply by 10
	pop	rdx		;get accumulated value
	add	rax, rdx	;add newest placevalue to current value
	jmp	n_dtoi_loop	;loop function
n_dtoi_done:
	ret
	;End n_dtio
	

	;binary string to unsigned int function
	;comments are the same as above accept where noted
n_btoi:
	xor	rax, rax
	xor	rcx, rcx
	jmp	btoi_check  	;perform inc and check for '0b_' before beginning

n_btoi_loop:
	mov	dl, [rdi+rax]
	inc	rax
	sub	rdx, '0'
	imul	rdx, 2		;multiply by 2
	add	rax, rdx
	jmp	n_btoi_loop
n_btoi_done:	
        ret
	;End n_btoi function

