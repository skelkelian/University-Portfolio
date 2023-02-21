#include <iostream>
#include <iomanip>

using namespace std;

// Constants
const double TAXRATE = 0.0875;

int lab3() {
    // Variables
    double item1Cost;
    double item2Cost;
    double item3Cost;
    double item4Cost;
    double item5Cost;
    double total;
    double taxTotal;
    double grandTotal;

    // Calculations
    cout << "Item 1 Cost: $";
    cin >> item1Cost;

    cout << "Item 2 Cost: $";
    cin >> item2Cost;

    cout << "Item 3 Cost: $";
    cin >> item3Cost;

    cout << "Item 4 Cost: $";
    cin >> item4Cost;

    cout << "Item 5 Cost: $";
    cin >> item5Cost;

    total = item1Cost + item2Cost + item3Cost + item4Cost + item5Cost;
    cout << "Total: $" << setprecision(4) << total << endl;

    taxTotal = total * TAXRATE;
    cout << "Tax: $" << setprecision(3) << taxTotal << endl;

    grandTotal = total + taxTotal;
    cout << "Grand Total: $" << setprecision(4) << grandTotal << endl;
    return 0;
}