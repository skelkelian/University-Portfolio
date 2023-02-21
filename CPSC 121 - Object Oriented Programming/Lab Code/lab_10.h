#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

int lab10() {
    // Variables
    int userNum, counter, spacesToDraw, starsToDraw = 1, row;
    string output;

    do {
        // Input
        cout << "Enter an odd number: ";
        cin >> userNum;

        if (userNum % 2 == 0 || userNum > 15) {
            cout << "Invalid Input!" << endl;
        }

    } while (userNum % 2 == 0 || userNum > 15);

    // Calculations
    row = 1;
    spacesToDraw = (int)(userNum / 2);
    while (row <= (userNum + 1) / 2) {
        counter = 0;
        while (counter < spacesToDraw) {
            output = output + " ";
            counter++;
        }
        counter = 0;
        while (counter < starsToDraw) {
            output = output + "*";
            counter++;
        }
        output = output + "\n";
        spacesToDraw--;
        starsToDraw += 2;
        row++;
    } // while (row <= (userNum + 1) / 2)

    spacesToDraw = 1;
    starsToDraw = userNum - 2;
    while (row >= 1) {
        counter = 0;
        while (counter < spacesToDraw) {
            output = output + " ";
            counter++;
        }
        counter = 0;
        while (counter < starsToDraw) {
            output = output + "*";
            counter++;
        }
        output = output + "\n";
        spacesToDraw++;
        starsToDraw -= 2;
        row--;
    } // while (row >= (userNum + 1) / 2)

    // Output
    cout << output;

    return 0;
}