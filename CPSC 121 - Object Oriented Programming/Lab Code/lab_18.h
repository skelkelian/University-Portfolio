#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Function prototype
void addFractions(int numerator1, int denominator1, int numerator2, int denominator2);

int lab18() {
    // Variables
    int numerator1, denominator1, numerator2, denominator2;

    // Input
    cout << "Enter numerator 1: ";
    cin >> numerator1;
    cout << "Enter denominator 1: ";
    cin >> denominator1;
    cout << "Enter numerator 2: ";
    cin >> numerator2;
    cout << "Enter denominator 2: ";
    cin >> denominator2;

    // Calculate
    addFractions(numerator1, denominator1, numerator2, denominator2);

    return 0;
}

// Function definition
void addFractions(int numerator1, int denominator1, int numerator2, int denominator2) {
    // Variables
    int numeratorSum, lowestCommonDenominator, multiple1, multiple2, wholeMixedNumber, remainder;

    // Calculate
    if (denominator1 > denominator2) {
        lowestCommonDenominator = denominator1;
    }
    else {
        lowestCommonDenominator = denominator2;
    }

    while(lowestCommonDenominator % denominator1 != 0 || lowestCommonDenominator % denominator2 != 0) {
        lowestCommonDenominator++;
    }

    multiple1 = lowestCommonDenominator / denominator1;
    multiple2 = lowestCommonDenominator / denominator2;

    numerator1 = numerator1 * multiple1;
    numerator2 = numerator2 * multiple2;
    denominator1 = denominator1 * multiple1;
    denominator2 = denominator2 * multiple2;

    numeratorSum = numerator1 + numerator2;

    // Output
    if (numeratorSum > lowestCommonDenominator) {
        wholeMixedNumber = numeratorSum / lowestCommonDenominator;
        remainder = numeratorSum % lowestCommonDenominator;
        cout << numerator1 << "/" << denominator1 << " + " << numerator2 << "/" << denominator2 << " = " << wholeMixedNumber << " " << remainder << "/" << lowestCommonDenominator << endl;
    }
    else {
        cout << numerator1 << "/" << denominator1 << " + " << numerator2 << "/" << denominator2 << " = " << numeratorSum << "/" << lowestCommonDenominator << endl;
    }
}

