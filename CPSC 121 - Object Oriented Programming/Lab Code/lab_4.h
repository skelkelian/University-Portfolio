#include <iostream>
#include <iomanip>

using namespace std;

// Constants
const int FIFTYDOLLARBILL = 50;

int lab4() {
    // Variables
    double userNum;
    double change;
    int numOfBills;

    // Input
    cout << "Enter the amount given to the teller: ";
    cin >> userNum;

    // Calculations
    numOfBills = static_cast<int>(userNum / FIFTYDOLLARBILL);
    change = userNum - numOfBills * FIFTYDOLLARBILL;

    // Output
    cout << "If you give me $" << userNum << ", I’ll give you " << numOfBills << " $50 bill(s) and your change will be $" << setprecision(4) << change << "." << endl;

    return 0;
}