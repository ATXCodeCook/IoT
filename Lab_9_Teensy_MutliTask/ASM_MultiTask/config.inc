; config.inc - pin assignments for this project

#include <avr/io.h>
#include "../include/AVRSpecialRegs.inc"


#define     LED_PORT   _PORTB
#define     LED_DIR    _DDRB
#define     LED_PIN    5

#define     BUZZ_PORT  _PORTB
#define     BUZZ_DIR   _DDRB
#define     BUZZ_PIN1  4

#define     PULSE_DIR  _DDRD
#define     PULSE_PORT _PORTD
#define     PULSE_PIN  7

