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
     } while (!isValid(tmpString) && tmpString != "quit") ;  //end do-while

    return tmpString;

}

// isValid definition
bool isValid( string tmpString) {

    if(tmpString == "add") {return 1;}
    // Test for invalid char
    int isInt = tmpString.find_first_not_of("0123456789");

    if(isInt != string::npos){return 0;}  //Return for invalid char.
    else {return 1;}
    // Catch other invalid situations.
    cout << "An unknown error occurred." << endl;
    return 0;
}
