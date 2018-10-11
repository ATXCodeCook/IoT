#Makefile for lab1
FILES = \
	function.h\
	message.cpp\
	machine.cpp\
	main.cpp\
	store.h\
	store.cpp\
	calculator.cpp\

OBJS = $(FILES:.cpp=.o)
ASMS = $(FILES:.cpp=.s)

all: Lab1_machine

Lab1_machine: $(OBJS)
	g++ -std=c++11 -o Lab1Machine $(OBJS)

asmfiles:	$(ASMS)

%.o:	%.cpp
	g++ -std=c++11 -c $< -o $@

%.s:	%.cpp
	g++ -std=c++11 -S $< -o $@

clean:
	rm -f *.o *.s
