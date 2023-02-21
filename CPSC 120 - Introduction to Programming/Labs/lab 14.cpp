#include <iostream>
#include <cstring>

using namespace std;

int main()
{
    char theString[5] = "abef";
//    theString can store 4 characters, with \0 at the end.
//    can only assign with the "=" on initialization.

    strcpy(theString, "cd");

    cout << theString << "k" << endl;

    strcat(theString, "fg");

    cout << theString << "k" << endl;

    cout << strlen(theString) << " is the length.\n";

//    strcat(theString, "hi");

    cout << theString << "k" << endl;

//    cstring logic is reversed when comparing
    if(strcmp(theString, "cdfghi"))
        cout << "NOT the same\n";
    else
        cout << "The same\n";

    return 0;
}