; Hello Blinky World for AVR
; Author: Patrick Cook
; Date: December 17, 2016

#include "config.inc"

        .section .text
        .global     main
        .extern     delay          
        .org        0x0000

main:
        ; set up the stack
        ldi         r28, (RAMEND & 0x00ff)
        ldi         r29, (RAMEND >> 8)
        out         _SPH, r29
        out         _SPL, r28

        ; initilaize the chip for blinking
        call        init      

        ; enter the blink loop
1:      call        toggle		; initial toggle on
        call        delay		;assuming that 1/ is meant to be 1/2 ("half second")
	call	    toggle		; toggle off
        call	    delay		; wait 1/2 seconds x 2
	call	    delay
	call	    toggle		; toggle on
	call	    delay		; wait 1/2 seconds x 2
	call	    delay
	call	    toggle		; toggle off
	call	    delay		; wait 1/2 second and loop back (to 1/2 second on)
        rjmp        1b

init:   eor         r1, r1                  ; zero out the r1 register
        out         _SREG, r1               ; initialize the status reg
        ldi         r24, 0x80
        sts         CLKPR, r24              ; allow access to clock setup
        sts         CLKPR, r1               ; run at full speed
        
        ; set up the LED port
        sbi         LED_DIR, LED_PIN        ; set LED pin to output
        cbi         LED_PORT, LED_PIN       ; start with the LED off
        ret

toggle:
        in          r24, LED_PORT           ; get current bits
        ldi         r25, (1 << LED_PIN)     ; LED is pin 5
        eor         r24, r25                ; flip the bit
        out         LED_PORT, r24           ; write the bits back
        ret
