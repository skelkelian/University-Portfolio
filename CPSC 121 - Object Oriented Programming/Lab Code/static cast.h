#include <iostream>
#include <cmath>

using namespace std;

int staticCast() {
    // Variables
    int asciiValue;
    char charValue;

    // Input
    cout << "Enter integer from 33 to 126: ";
    cin >> asciiValue;
    cout << "Enter a character: ";
    cin >> charValue;

    // Output
    cout << "ASCII value " << asciiValue << " represents character: " << static_cast<char>(asciiValue) << endl;
    cout << "Character " << charValue << " is ASCII value: " << static_cast<int>(charValue) << endl;

    return 0;
}