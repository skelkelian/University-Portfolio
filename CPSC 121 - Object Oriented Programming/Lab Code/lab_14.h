#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Function prototype
int getUserInput(int parameter1);
string translateThreeDigitNumber(int userNum);

int lab14() {
    // Variables
    int userNum, tempNum, billions, millions, thousands, hundreds;
    string output = "";

    // Input
    cout << "Enter any integer: ";
    cin >> userNum;

    tempNum = userNum;

    // Calculations
    if (tempNum >= 1000000000) {
        billions = (int)(tempNum/1000000000);                   // get number of billions (max 1 digit)
        tempNum = tempNum - (int)(billions * 1000000000);       // subtract tempNum to millions
    }
    if (tempNum >= 1000000) {
        millions = (int)(tempNum/1000000);                      // get number of millions (max 3 digits)
        tempNum = tempNum - (int)(millions * 1000000);          // subtract tempNum to thousands
    }
    if (tempNum >= 1000) {
        thousands = (int)(tempNum/1000);                        // get number of thousands (max 3 digits)
        tempNum = tempNum - (int)(thousands * 1000);            // subtract tempNum to hundreds
    }

    hundreds = tempNum;                                         // remaining number of hundreds (max 3 digits)

    if (billions >= 1) {                                        // if your inputted number is at least a billion
        output = output + translateThreeDigitNumber(billions) + "Billion ";     // get billions value in words
    }
    if (millions >= 1) {                                        // if your inputted number is at least a million
        output = output + translateThreeDigitNumber(millions) + "Million ";     // get millions value in words
    }
    if (thousands >= 1) {                                       // if your inputted number is at least a thousand
        output = output + translateThreeDigitNumber(thousands) + "Thousand ";   // get thousands value in words
    }
    if (hundreds >= 1) {                                        // if your inputted number is at least one
        output = output + translateThreeDigitNumber(hundreds);                  // get hundreds value in words
    }

    // Output
    cout << output;

    return 0;
}

// Function definition
string translateThreeDigitNumber(int userNum) {
    int tempNum = userNum;
    string output = "";


    if (userNum >= 100) {
        tempNum = (int)(userNum / 100);

        if (tempNum == 9) {
            output = output + "Nine Hundred ";
        }
        else if (tempNum == 8) {
            output = output + "Eight Hundred ";
        }
        else if (tempNum == 7) {
            output = output + "Seven Hundred ";
        }
        else if (tempNum == 6) {
            output = output + "Six Hundred ";
        }
        else if (tempNum == 5) {
            output = output + "Five Hundred ";
        }
        else if (tempNum == 4) {
            output = output + "Four Hundred ";
        }
        else if (tempNum == 3) {
            output = output + "Three Hundred ";
        }
        else if (tempNum == 2) {
            output = output + "Two Hundred ";
        }
        else if (tempNum == 1) {
            output = output + "One Hundred ";
        }
        tempNum = userNum - tempNum * 100;
    } // if (tempNum >= 100)
    if (tempNum >= 10) {
        if (tempNum >= 90) {
            output = output + "Ninety ";
        }
        else if (tempNum >= 80) {
            output = output + "Eighty ";
        }
        else if (tempNum >= 70) {
            output = output + "Seventy ";
        }
        else if (tempNum >= 60) {
            output = output + "Sixty ";
        }
        else if (tempNum >= 50) {
            output = output + "Fifty ";
        }
        else if (tempNum >= 40) {
            output = output + "Forty ";
        }
        else if (tempNum >= 30) {
            output = output + "Thirty ";
        }
        else if (tempNum >= 20) {
            output = output + "Twenty ";
        }
        else if (tempNum == 19) {
            output = output + "Nineteen ";
        }
        else if (tempNum == 18) {
            output = output + "Eighteen ";
        }
        else if (tempNum == 17) {
            output = output + "Seventeen ";
        }
        else if (tempNum == 16) {
            output = output + "Sixteen ";
        }
        else if (tempNum == 15) {
            output = output + "Fifteen ";
        }
        else if (tempNum == 14) {
            output = output + "Fourteen ";
        }
        else if (tempNum == 13) {
            output = output + "Thirteen ";
        }
        else if (tempNum == 12) {
            output = output + "Twelve ";
        }
        else if (tempNum == 11) {
            output = output + "Eleven ";
        }
        else if (tempNum == 10) {
            output = output + "Ten ";
        }

        if (tempNum >= 10 && tempNum < 20) {
            tempNum = 0;
        }
        else {
            tempNum = tempNum - (int)(tempNum / 10) * 10;
        }
    } // if (tempNum >= 10)
    if (tempNum < 10) {
        if (tempNum == 9) {
            output = output + "Nine ";
        }
        else if (tempNum == 8) {
            output = output + "Eight ";
        }
        else if (tempNum == 7) {
            output = output + "Seven ";
        }
        else if (tempNum == 6) {
            output = output + "Six ";
        }
        else if (tempNum == 5) {
            output = output + "Five ";
        }
        else if (tempNum == 4) {
            output = output + "Four ";
        }
        else if (tempNum == 3) {
            output = output + "Three ";
        }
        else if (tempNum == 2) {
            output = output + "Two ";
        }
        else if (tempNum == 1) {
            output = output + "One ";
        }

    } // if (tempNum < 10)

    return output;
}