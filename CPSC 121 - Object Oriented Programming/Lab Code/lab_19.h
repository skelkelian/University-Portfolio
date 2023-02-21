#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Function prototype
void getUserInput(int &rentToOccupyAllUnits, int &increaseInRentResultingInAVacantUnit, int &amountToMaintainRentedUnit, int &numOfApartments);
int calcNumOfUnits(int rentToOccupyAllUnits, int increaseInRentResultingInAVacantUnit, int amountToMaintainRentedUnit, int numOfApartments);

int lab19() {
    // Variables
    int rentToOccupyAllUnits, increaseInRentResultingInAVacantUnit, amountToMaintainRentedUnit, numOfApartments, optimizedApartments;

    // Input
    getUserInput(rentToOccupyAllUnits, increaseInRentResultingInAVacantUnit, amountToMaintainRentedUnit, numOfApartments);

    // Calculate
    optimizedApartments = calcNumOfUnits(rentToOccupyAllUnits, increaseInRentResultingInAVacantUnit, amountToMaintainRentedUnit, numOfApartments);
    cout << "To maximize profits " << optimizedApartments << " apartments should be rented." << endl;

    return 0;
}

// Function definition
void getUserInput(int &rentToOccupyAllUnits, int &increaseInRentResultingInAVacantUnit, int &amountToMaintainRentedUnit, int &numOfApartments) {
    // Input
    cout << "How many apartment units are in the complex? ";
    cin >> numOfApartments;
    cout << "What is the rent to occupy all the units? ";
    cin >> rentToOccupyAllUnits;
    cout << "What is the increase in rent that results in a vacant unit? ";
    cin >> increaseInRentResultingInAVacantUnit;
    cout << "What is the amount to maintain a rented unit? ";
    cin >> amountToMaintainRentedUnit;
}

int calcNumOfUnits(int rentToOccupyAllUnits, int increaseInRentResultingInAVacantUnit, int amountToMaintainRentedUnit, int numOfApartments) {
    // Variables
    int profit, previousProfit = 0, vacantUnits = 0;

    // Calculate
    profit = (numOfApartments - vacantUnits) * rentToOccupyAllUnits - (numOfApartments - vacantUnits) * amountToMaintainRentedUnit;
    while (profit > previousProfit) {
        previousProfit = profit;
        rentToOccupyAllUnits = rentToOccupyAllUnits + increaseInRentResultingInAVacantUnit;
        vacantUnits++;
        profit = (numOfApartments - vacantUnits) * rentToOccupyAllUnits - (numOfApartments - vacantUnits) * amountToMaintainRentedUnit;

        // Output
//        cout << "Profit: " << profit << ", Vacant units: " << vacantUnits << ", Rent: " << rentToOccupyAllUnits << endl;
    }

    return (numOfApartments - (vacantUnits - 1));
}

