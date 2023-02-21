#include <iostream>

using namespace std;

int lab2() {
    // Variables
    int userNumToBeSquared;
    int squaredResult;
    int userNumToBeCubed;
    int cubedResult;
    int userNum1;
    int userNum2;
    int modulusResult;

    // Calculations
    cout << "Enter an integer to be squared: ";
    cin >> userNumToBeSquared;
    squaredResult = userNumToBeSquared * userNumToBeSquared;
    cout << userNumToBeSquared << " squared equals " << squaredResult << endl;

    cout << "Enter an integer to be cubed: ";
    cin >> userNumToBeCubed;
    cubedResult = userNumToBeCubed * userNumToBeCubed * userNumToBeCubed;
    cout << userNumToBeCubed << " cubed equals " << cubedResult << endl;

    cout << "Enter integer 1: ";
    cin >> userNum1;

    cout << "Enter integer 2: ";
    cin >> userNum2;
    modulusResult = userNum1 % userNum2;
    cout << "The remainder of " << userNum1 << " divided by " << userNum2 << " equals " << modulusResult << endl;

    return 0;
}