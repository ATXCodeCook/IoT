# Makefile for aBlinkBuzz

TARGET	= main.S timer.S task1.S task2.S task3.S

ASRCS 	= $(wildcard *.S)
INTTBL	= FALSE

# board definition
MCU	= atmega328p
F_CPU	= 16000000

# uncomment one of these linesand check for your system:
#PORT	= COM3    # ***changed from COM4 112516
PORT	= /dev/ttyACM2
#PORT	= /dev/cu.usbmodem1411
#PORT	= /dev/ttyACM3

# uncomment one of thes elines
MAKE_BASE = ../
#MAKE_BASE = /usr/local/
include $(MAKE_BASE)include/AVRMakefile.mak
