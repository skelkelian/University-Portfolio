#include <iostream>
#include <fstream>                          // Inputting and outputting files
#include <string>

using namespace std;

// Function Prototype
string convertToLetter(int hexidecimalValue);

int lab25() {
    // Variables
    double redDecimal, greenDecimal, blueDecimal;
    int redWholeDigit, greenWholeDigit, blueWholeDigit;
    double redRemainingDigit, greenRemainingDigit, blueRemainingDigit;
    string hexidecimalValue = "0x";

    // Input
    cout << "Enter a decimal value for red: ";
    cin >> redDecimal;
    cout << "Enter a decimal value for green: ";
    cin >> greenDecimal;
    cout << "Enter a decimal value for blue: ";
    cin >> blueDecimal;

    // Calculate
    redWholeDigit = (int)(redDecimal / 16);
//    cout << "redWholeDigit: " << redWholeDigit << endl;
    greenWholeDigit = (int)(greenDecimal / 16);
//    cout << "greenWholeDigit: " << greenWholeDigit << endl;
    blueWholeDigit = (int)(blueDecimal / 16);
//    cout << "blueWholeDigit: " << blueWholeDigit << endl;

    redRemainingDigit = ((redDecimal / 16) - redWholeDigit) * 16;
//    cout << "redRemainingDigit: " << redRemainingDigit << endl;
    greenRemainingDigit = ((greenDecimal / 16) - greenWholeDigit) * 16;
//    cout << "greenRemainingDigit: " << greenRemainingDigit << endl;
    blueRemainingDigit = ((blueDecimal / 16) - blueWholeDigit) * 16;
//    cout << "blueRemainingDigit: " << blueRemainingDigit << endl;

    hexidecimalValue = hexidecimalValue + convertToLetter(redWholeDigit);
    hexidecimalValue = hexidecimalValue + convertToLetter(redRemainingDigit);
    hexidecimalValue = hexidecimalValue + convertToLetter(greenWholeDigit);
    hexidecimalValue = hexidecimalValue + convertToLetter(greenRemainingDigit);
    hexidecimalValue = hexidecimalValue + convertToLetter(blueWholeDigit);
    hexidecimalValue = hexidecimalValue + convertToLetter(blueRemainingDigit);

    // Output
    cout << "Hexidecimal value: " << hexidecimalValue;

    return 0;
}

string convertToLetter(int hexidecimalValue) {
    string output = "";
    if (hexidecimalValue == 15) {
        output = "F";
    }
    else if (hexidecimalValue == 14) {
        output = "E";
    }
    else if (hexidecimalValue == 13) {
        output = "D";
    }
    else if (hexidecimalValue == 12) {
        output = "C";
    }
    else if (hexidecimalValue == 11) {
        output = "B";
    }
    else if (hexidecimalValue == 10) {
        output = "A";
    }
    else if (hexidecimalValue == 9) {
        output = "9";
    }
    else if (hexidecimalValue == 8) {
        output = "8";
    }
    else if (hexidecimalValue == 7) {
        output = "7";
    }
    else if (hexidecimalValue == 6) {
        output = "6";
    }
    else if (hexidecimalValue == 5) {
        output = "5";
    }
    else if (hexidecimalValue == 4) {
        output = "4";
    }
    else if (hexidecimalValue == 3) {
        output = "3";
    }
    else if (hexidecimalValue == 2) {
        output = "2";
    }
    else if (hexidecimalValue == 1) {
        output = "1";
    }
    else {
        output = "0";
    }
    return output;
}