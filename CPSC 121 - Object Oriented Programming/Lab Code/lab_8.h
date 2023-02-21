#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Constants

int lab8() {
    // Variables
    bool val1Bool, val2Bool, boolResult;
    char val1, val2, userInput;

    // Input
    cout << "Type T or F for the 1st Boolean value: ";
    cin >> val1;
    cout << "Type T or F for the 2nd Boolean value: ";
    cin >> val2;
    cout << "Type A for the AND operator or O for the OR operator: ";
    cin >> userInput;

    // Calculations
    if (val1 == 'T') {
        val1Bool = true;
    }
    else {
        val1Bool = false;
    }

    if (val2 == 'T') {
        val2Bool = true;
    }
    else {
        val2Bool = false;
    }

    if (userInput == 'A') {
        if (val1Bool && val2Bool) {
            boolResult = true;
        }
        else {
            boolResult = false;
        }
    }
    else {
        if (val1Bool || val2Bool) {
            boolResult = true;
        }
        else {
            boolResult = false;
        }
    }

    // Output
    if (userInput == 'A') {
        cout << "\n" << val1Bool << " AND " << val2Bool << " = " << boolResult << endl;
    }
    else {
        cout << "\n" << val1Bool << " OR " << val2Bool << " = " << boolResult << endl;
    }

    return 0;
}