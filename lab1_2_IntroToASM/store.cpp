#include <iostream>
#include <string>

#include "store.h"

using namespace std;



int addStack [MAX_SIZE] = {0}; //Stack to hold values to add
int top = 0; //top of stack

// write() definition
int write(string intVal) {
    if(top < MAX_SIZE) {
        int tmpNum = 0;
        tmpNum = stoi(intVal);
        addStack[top] = tmpNum;
        cout << "Loading top of stack with " << addStack[top] << endl;
        top++;
        return 0;
    } else {return 1;}

}

// ***read() definition
int read() {
    if(top > 1) {
        int tmpReadInt = 0;
        tmpReadInt = addStack[top];
        top--;
        return tmpReadInt;
    } else {return -1;}

}
