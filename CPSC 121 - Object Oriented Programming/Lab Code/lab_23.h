#include <iostream>
#include <string>
#include <vector>

using namespace std;

// Function prototype
int repetitionFreeNumber(int startingNumber);


int lab23() {
    // Variables
    string output = "";
    int userNum, result;

    // Input
    cout << "Enter a whole number: ";
    cin >> userNum;

    // Calculations
    result = repetitionFreeNumber(userNum);

    // Output
    cout << "The next repetition free number is " << result << endl;
    return 0;
}

// Function definition
int repetitionFreeNumber(int startingNumber) {
    int nextNumber, lengthOfNumber, tempNumber;
    nextNumber = startingNumber + 1;
    string nextNumberStr = to_string(nextNumber);
    lengthOfNumber = nextNumberStr.length();
    bool foundRepetitionFreeNumber = false, freeOfZeroes = false;

    while (!foundRepetitionFreeNumber || !freeOfZeroes) {
        tempNumber = nextNumberStr.find("0", 0);

        if (tempNumber >= 0) {
            freeOfZeroes = false;
            nextNumber += 1;
            nextNumberStr = to_string(nextNumber);
        }
        else {
            freeOfZeroes = true;
        }

        for (int i = 0; i < lengthOfNumber; i++) {

            for (int j = i + 1; j < lengthOfNumber; j++) {

                if (nextNumberStr.substr(i, 1) == nextNumberStr.substr(j, 1)) {
                    foundRepetitionFreeNumber = false;
                    break;
                }
                else {
                    foundRepetitionFreeNumber = true;
                }

            }

            if (!foundRepetitionFreeNumber) {
                nextNumber += 1;
                nextNumberStr = to_string(nextNumber);
                break;
            }
        }
    }

    return nextNumber;
}
