; delay.S
;   nested loop delay (Slow: Need to rework)
#include <avr/io.h>

        .section        .text
        .global         long_delay
		.global			micro_delay

long_delay:
        ldi         r16, 130            ; outer loop = 1 sec
1:
        ldi         r17, 200            ; middle loop
2:      
        ldi         r18, 200            ; inner lool
3:
        dec         r18
        brne        3b                  ; inner loop
        dec         r17
        brne        2b                  ; middle loop
        dec         r16
        brne        1b                  ; outer loop
        ret

micro_delay:
		ldi			r19, 1
4:
		ldi			r20, 2
5:
		dec			r20
		brne		5b
		dec 		r19
		brne		4b
		ret


  		
