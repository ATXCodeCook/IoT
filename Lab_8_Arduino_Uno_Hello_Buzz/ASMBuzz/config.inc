// Example Arduino code to sound a Piezo buzzer
// COSC 2325 HLC December 15, 2016
// Patrick Cook

; configuration for blink
#include <avr/io.h>
#include "../include/AVRSpecialRegs.inc"

#define BUZZ_PIN     4
#define BUZZ_DIR     _DDRB
#define BUZZ_PORT    _PORTB
