#include <iostream>
#include <string>

using namespace std;

// Constants

// Function prototype
bool isPrime(int possPrimePar);
bool isEmirp(int possEmirpPar);
int reversedNumber(int numToBeReversed);

int lab22() {
    // Variables
    string output = "";
    int userNum, numOfEmirp = 0, possPrimeNum = 13, possEmirpNum = 0;

    // Input
    do {
        cout << "How many EMIRPS do you want to display: ";
        cin >> userNum;

        if (userNum < 1 || userNum > 20) {
            cout << "Invalid Input! Enter a number between 1 and 20!" << endl;
        }

    } while (userNum < 1 || userNum > 20);

    // Calculations
    while (numOfEmirp < userNum) {

        possEmirpNum = reversedNumber(possPrimeNum);

        if (isEmirp(possEmirpNum) && isPrime(possPrimeNum)) {
            output = output + to_string(possPrimeNum) + " ";
            numOfEmirp++;
        }

        possPrimeNum += 2;
    }

    // Output
    cout << output << endl;
    return 0;
}

// Function definition
bool isPrime(int possPrimePar) {
    bool result = true;
    for (int i = 2; i < possPrimePar; i++) {
        if (possPrimePar % i == 0) {
            result = false;
            break;
        }
    }

    return result;
}

bool isEmirp(int possEmirpPar) {
    bool result = true;
    for (int i = 2; i < possEmirpPar; i++) {
        if (possEmirpPar % i == 0) {
            result = false;
            break;
        }
    }

    return result;
}

int reversedNumber(int numToBeReversed) {
    int reversedNumber = 0, remainder, ogNumber = numToBeReversed, notPrimeNumber = 200;

    while(numToBeReversed != 0) {
        remainder = numToBeReversed % 10;
        reversedNumber = reversedNumber * 10 + remainder;
        numToBeReversed /= 10;
    }

    if (reversedNumber == ogNumber) {
        return notPrimeNumber;
    }
    return reversedNumber;
}