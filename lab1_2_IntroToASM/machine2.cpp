#include <iostream>
#include <string>

#include "function.h"
//#include "store.h"

using namespace std;

void message(string tmpString);
void message(void);
string cycle(void);

int machine() {
    string tmpIn = "";

    do {
        tmpIn = cycle();  //fetch and validate
        message(tmpIn);  //confirm input

        if(tmpIn == "add") {add();}
        else if(tmpIn != "quit") {
            write(tmpIn);
        }

    } while(tmpIn != "quit");
        return 0;
}

string cycle() {
    string tmpString = "";

//Make this a function and feed the monster
    do{
        message();
        cout << endl;
        cout << "Enter an Integer, 'add' or 'quit':  " << endl;
        message();
        getline (cin, tmpString);
     } while (!isValid(tmpString));  //end do-while

    return tmpString;

}

