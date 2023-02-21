#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Constants

int lab11() {
    // Variables
    int userNum, counter, spacesToDraw, starsToDraw = 1, row, column;
    string output;

    // Input
    do {
        cout << "Enter a whole number from 1 to 15: ";
        cin >> userNum;

        if (userNum < 1 || userNum > 15) {
            cout << "Invalid Input" << endl;
        }

    } while (userNum < 1 || userNum > 15);

    // Calculations
    row = 1;
    while (row <= userNum) {
        column = 1;
        while (column <= starsToDraw) {
            output = output + "*";
            column++;
        }
        output = output + "\n";
        starsToDraw++;
        row++;
    }

    // Output
    cout << output;

    return 0;
}