#include <iostream>
#include <string>

#include "store.h"

using namespace std;

int write(string strResult);

// add() definition
int add() {
    int num1 = addStack[top - 1];
    int num2 = addStack[top - 2];
    int addResult = addStack[top - 1] + addStack[top - 2];
    top--;
    write(to_string(addResult));
    cout << "The result of " << num1 << " + " << num2 << " is " << addResult        <<  endl;
    return addResult;
}
