#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Constants

int lab12() {
    // Variables
    int userNum, rows, columns;
    string output;

    // Input
    do {
        cout << "Enter a side value for the square: ";
        cin >> userNum;

        if (userNum < 1) {
            cout << "Invalid Input" << endl;
        }

    } while (userNum < 1);

    // Calculations
    rows = 1;
    while (rows <= userNum) {
        columns = 1;
        while (columns <= userNum) {
            output = output + "*";
            columns++;
        }
        output = output + "\n";
        rows++;
    }

    // Output
    cout << output;

    return 0;
}