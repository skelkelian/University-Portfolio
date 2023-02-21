#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Function prototype
int getNumberOfPerfectNumbers();
void perfectNumberCalculator(int userNum);

int lab15() {
    // Output
    perfectNumberCalculator(getNumberOfPerfectNumbers());
    return 0;
}

// Function definition
int getNumberOfPerfectNumbers() {
    // Variables
    int userNum;

    // Input
    cout << "How many Perfect Numbers do you want to see? (From 1 to 4): ";
    cin >> userNum;

    return userNum;
}

void perfectNumberCalculator(int userNum) {
    // Variables
    int numbersDisplayed = 0, potentialPerfectNum = 2, factorsSum;
    string listOfPerfectNums = "";

    // Calculations
    while (numbersDisplayed < userNum) {                        // if you haven't gotten the number of perfect numbers desired yet
        for (int i = 1; i <= potentialPerfectNum / 2; i++) {
            if (potentialPerfectNum % i == 0) {                 // if the iterable is a factor for the potential perfect number
                factorsSum = factorsSum + i;                    // increment sum of factors variable by the factor
            }
        }
        if (factorsSum == potentialPerfectNum) {                // if sum of factors is the same as the potential perfect number
            listOfPerfectNums = listOfPerfectNums + to_string(potentialPerfectNum) + ", ";
            numbersDisplayed += 1;
        }
        factorsSum = 0;                                         // reset sum of factors
        potentialPerfectNum += 1;                               // increment potential perfect number
    }

    // Output
    listOfPerfectNums.erase(listOfPerfectNums.length() - 2, 2);         // remove extra space and comma
    cout << listOfPerfectNums << endl;
}

