; delay.S
;   nested loop delay (dumb!-->Fixed! See README.md)
; 
#include <avr/io.h>

        .section        .text
        .global         delay
;1/2 second delay
delay:
        ldi         r16, 41		; 1 cycle outer loop *** 1 total cycle
        ldi         r17, 150		; 1 cycle middle loop
	ldi         r18, 120		; 1 cycle inner lool
L1:					
        dec         r18			; 1 cycle
        brne        L1                  ; 2 cycles  inner loop
        dec         r17			; 1 cycle
        brne        L1                  ; 2 cycles middle loop
        dec         r16			; 1 cycle
        brne        L1                  ; 2 cycles outer loop
	nop				; 1 cycle        
	ret				; 4 cycles
