#include <iostream>
#include <cmath>

using namespace std;

// Constants
const double PI = 3.14159265358979323846;

int lab5() {
    // Variables
    double radius;
    double surfaceArea;
    double volume;

    // Input
    cout << "Enter the radius of a sphere: ";
    cin >> radius;

    // Calculations
    surfaceArea = 4 * PI * pow(radius, 2.0);
    volume = 4.0 / 3.0 * PI * pow(radius, 3.0);

    // Output
    cout << "Surface Area: " << surfaceArea << endl;
    cout << "Volume: " << volume << endl;

    return 0;
}