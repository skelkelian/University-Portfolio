#include <iostream>
#include <string>

using namespace std;

// Constants
const int BINARYNUMBERSIZE = 8;

// Function prototype
int binToInt(int binaryNumber);

int lab21() {
    // Variables
    string userInput, binaryString, output = "";
    int asciiNumber, nextBinaryIndex = 0, nextSpace = 0;
    char asciiValue;

    // Input
    cout << "Enter a series of binary numbers: ";
    getline(cin, userInput);

    // Calculations
    while (nextSpace != -1) {
        // Get 8 digit binary number
        binaryString = userInput.substr(nextBinaryIndex, BINARYNUMBERSIZE);

        // Convert 8 digit binary number to single number
        asciiNumber = binToInt(stoi(binaryString));

        // Convert asciiNumber to character
        asciiValue = static_cast<char>(asciiNumber);

        // String concatenate
        output = output + asciiValue;

        // Find next 8 digit binary number location
        nextSpace = userInput.find(" ", nextSpace + 1);

        // Remove extra spaces
        while(userInput.substr(nextSpace + 1, 1) == " ") {
            nextSpace++;
        }
        nextBinaryIndex = nextSpace + 1;
    }


    // Output
    cout << output << endl;
    return 0;
}

// Function definition
int binToInt(int binaryNumber) {
    int result;
    for (int i = 0; binaryNumber > 0; i++) {
        if (binaryNumber % 10 == 1) {
            result = result + pow(2, i);
        }
        binaryNumber = (int)(binaryNumber / 10);
    }

    return result;
}