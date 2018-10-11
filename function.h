#pragma once

#include <iostream>
#include <string>

using namespace std;

//prototypes
int machine( void );  //defined in machine.cpp
extern void message( string ); //defined in message.cpp
extern void message( void ); //overloaded message() definition
bool isValid( string );  // defined in machine.cpp
extern int write( string ); //defined in store.cpp
extern int read(); //defined in store.cpp
extern int add( void ); //defined in calculator.cpp


