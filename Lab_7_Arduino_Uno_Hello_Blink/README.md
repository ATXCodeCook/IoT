Patrick Cook Lab 7 Blink- COSC 2325-001 HLC Tues/Thurs
#####################

The purpose of lab 7 is to commincate with the Arduino
UNO board and make it blink a pattern of:
on for 0.5 seconds  -->assumed 1/ as given in lab is meant to be 1/2
off for 1 second
on for 1 second
off for 0.5 seconds
repeat continuously

For the 1/2 second timer we need 8,000,000 cycles.
19 cycles are used before and after the delay loop.
The loop will need 8,000,000-28 cycles.
Using the standard formula for a 3 loop delay with simple dec and brne gives:

3 + 3 * R18 + (256 * 3 + 2)(R17 - 1) - 1 + 3 + 
	((256 * 3 * 2) * (256 - 1 + 3)(R16 - 1) + 4

Simplified gives:
10 + 3 * R18 + 770 (R17 - 1) + 197122 (R16 - 1)

The cycles needed after overhead is 8000000 - 10 - 19 = 
For the outer loop: 7999971/197122 = 40 remainder 115091
For the middle loop: 115091/770 = 149 remainder 361
For the inner loop: 361/3 = 120 remainder 1 (add 1 nop)
R16 = 40 + 1 = 41
R17 = 149 + 1 = 150
R18 = 120
add nop for the remainder 1


Working this out gives:
10 + 3(120) + 770(150 - 1) + 197122(41 - 1) + 1 = 7999981
for the delay and 19 overhead. 

