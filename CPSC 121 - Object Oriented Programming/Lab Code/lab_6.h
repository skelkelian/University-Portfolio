#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Constants

int lab6() {
    // Variables
    double hoursWorked, hourlyWage, regularPay, overtimePay, totalPay;

    // Input
    cout << "Enter the number of hours worked: ";
    cin >> hoursWorked;
    cout << "Enter your hourly wage: $";
    cin >> hourlyWage;

    // Calculations
    if (hoursWorked > 40) {
        overtimePay = (hoursWorked - 40) * hourlyWage;
        regularPay = 40 * hourlyWage;
    }
    else {
        overtimePay = 0.00;
        regularPay = hoursWorked * hourlyWage;
    }
    totalPay = regularPay + overtimePay;

    // Output
    cout << "Regular pay: $" << setprecision(2) << fixed << regularPay << endl;
    cout << "Overtime pay: $" << setprecision(2) << fixed << overtimePay << endl;
    cout << "Total pay: $" << setprecision(2) << fixed << totalPay << endl;

    return 0;
}