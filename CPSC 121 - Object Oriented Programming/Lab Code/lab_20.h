#include <iostream>

using namespace std;

// Constants

// Function prototype
int factorial(int numToCalculate);
int pascalNum(int row, int element);

int lab20() {
    // Variables
    int userNum, rowCounter = 0, elementCounter = 0, elementsPerRow = 1, spaces, initialSpaces, counter;
    string output;

    // Input
    do {
        cout << "Enter an integer from 1 to 10: ";
        cin >> userNum;

        if (userNum < 1 || userNum > 10) {
            cout << "Invalid Input!" << endl;
        }

    } while (userNum < 1 || userNum > 10);

    // Calculations
    initialSpaces = (int)((userNum - 1) * 2);
    while (rowCounter + 1 <= userNum) {
        counter = 0;
        while (counter <= initialSpaces) {
            output = output + " ";
            counter++;
        }
        while (elementCounter < elementsPerRow) {
            output = output + to_string(pascalNum(rowCounter, elementCounter));

            // Calculate length of numbers
            if (pascalNum(rowCounter, elementCounter) < 10) {
                spaces = 3;
            }
            else if (pascalNum(rowCounter, elementCounter) < 100) {
                spaces = 2;
            }
            else if (pascalNum(rowCounter, elementCounter) < 1000) {
                spaces = 1;
            }

            while (spaces > 0) {
                output = output + " ";
                spaces -= 1;
            }
            elementCounter++;
        } // while (elementCounter <= elementsPerRow)

        // Go to next line
        output = output + "\n";

        // Reset numbers for next iteration
        elementsPerRow++;
        elementCounter = 0;
        initialSpaces -= 2;
        rowCounter++;
    } // while (rowCounter + 1 <= userNum)

    // Output
    cout << output << endl;

    return 0;
}

// Function definition
int factorial(int numToCalculate) {
    int factorial = 1;
    while (numToCalculate > 1) {
        factorial = factorial * numToCalculate;
        numToCalculate -= 1;
    }

    return factorial;
}

int pascalNum(int row, int element) {
    int pascalNumber = 1;
    pascalNumber = factorial(row)/(factorial(element) * factorial(row - element));

    return pascalNumber;
}