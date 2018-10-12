// Example Arduino code to sound a Piezo buzzer
// COSC 2325 HLC   December 15, 2016
// Patrick Cook

#include <avr/io.h>
#include <util/delay.h>

#define CLOCK_PRESCALE(n)   (CLKPR = 0x80, CLKPR = (n))
#define BUZZER_CONFIG       (DDRB |= (1<<4)) 
#define BUZZ_ON             (PORTB |= (1<<4))
#define BUZZ_OFF            (PORTB &= ~(1<<4))
