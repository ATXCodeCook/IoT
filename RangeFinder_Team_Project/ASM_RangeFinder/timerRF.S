;timerRF.S - timer for the range finder

#include "configRF.inc"

.equ	PRESET		,1
.equ	PULSE_TIME	,235

		.section	.text

		.global		timer_delay
		.global		timer_init
		.global		pulse_timer_init
		.global		pulse_timer_start
		.global		pulse_timer_delay

timer_init:
		ldi		r16, (1<<CS02)|(0<<CS01)|(1<<CS00)	;divide by 1024 
		out		_TCCR0B, r16					;set timer clock
		ldi		r16, 1 << TOV0				 	;clear interrupt flag
		out		_TIFR0, r16
		ldi		r16, PRESET
		out		 _TCNT0, r16
		ret

timer_delay:
        in      r16, _TIFR0                      ; check the flag 
        sbrs    r16, TOV0                       ; skip if overflow set
        rjmp    timer_delay                     ; wait for it
        ldi     r16, 1 << TOV0                  ; clear the interrupt flag
        out     _TIFR0, r16                      ; clear the interrupt flag
        ldi     r16, PRESET                     ; reload the counter
        out     _TCNT0, r16                      ; set preset in
        ret  

pulse_timer_init:
		ldi		r16, (0<<CS02)|(0<<CS01)|(0<<CS00)	
		out		_TCCR0B, r16					;timer is stopped
		ldi		r16, 1 << TOV0				 	;clear interrupt flag
		out		_TIFR0, r16
		ldi		r16, PULSE_TIME					;load 235 to timer
		out		 _TCNT0, r16
		ret

pulse_timer_start:
		ldi		r16, (0<<CS02)|(1<<CS01)|(0<<CS00)					
												;divide by8
		out		_TCCR0B, r16					;start timer clock
pulse_timer_delay:
        in      r16, _TIFR0                     ; check the flag 
        sbrs    r16, TOV0                       ; skip if overflow set
        rjmp    pulse_timer_delay               ; wait for it
												;total time should be
												; 0.5 us * 20 = 10us
		call pulse_timer_init;					;stop timer & reset values
        ret  

