#include <iostream>
#include <cmath>

using namespace std;

int main() {
    cout << "//\\\\(\"\" ^ \"\")\n   ||\n\n";

    float radius, decimal_places;

    cout << "Enter a radius: ";
    cin >> radius;
    cout << "How many decimal places? ";
    cin >> decimal_places;

    float answer = 4 * 3.14159 * pow(radius, 2);

    cout.setf(ios::fixed);
    cout.setf(ios::showpoint);
    cout.precision(decimal_places);

    cout << "The surface area is " << answer << " units squared." << endl;

    return 0;
}
