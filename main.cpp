#include <iostream>
#include <string>

#include "function.h"

using namespace std;

int main() {
    int errExists = 1;
    errExists = machine();
    if(errExists == 1){
        message("An error occurred calling machine()");
    }

    return 0;
}
