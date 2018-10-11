#include <iostream>
#include <string>

#include "function.h"

using namespace std;

// message.cpp output message function

void message(string inMessage = "> ") {
    // display prompt without endline else with endline
    if(inMessage == "> "){
        cout << inMessage;
    } else {
    cout << inMessage << endl;
    }
}

// message(void) definition
void message() {message("> ");}
