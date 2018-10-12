; configuration for blink
#include <avr/io.h>
#include "../include/AVRSpecialRegs.inc"

;#define PINB		    0x03
#define PINB4       4
#define LED_PIN     5           ;LED Red inches
#define	LED_PIN2    3           ;LED Blue feet
#define TRIG_PIN    2
#define ECHO_PIN    4
#define LED_DIR     _DDRB       ;define led direction as ddrb
#define SONAR_DIR   _DDRB       ;define sonar direction port
#define LED_PORT    _PORTB      ;duplicate define led port as port b
#define SONAR_PORT  _PORTB      ;define sonar port
#define temp        R16         ;temp register
#define maxCount    R17         ;maximum counter value for reset
#define timerCount  R23         ;simple timer counter: 1 count = 1 microsecond
#define ZERO        R22         ;zero register
