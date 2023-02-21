#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Function prototype
double calcSurfaceArea(double length, double width, double height);
double calcVolume(double length, double width, double height);

int lab16() {
    // Variables
    double length, width, height;
    double surfaceArea, volume;

    // Input
    cout << "Enter the length: ";
    cin >> length;
    cout << "Enter the width: ";
    cin >> width;
    cout << "Enter the height: ";
    cin >> height;

    // Calculate
    surfaceArea = calcSurfaceArea(length, width, height);
    volume = calcVolume(length, width, height);

    // Output
    cout << "Surface area: " << surfaceArea << endl;
    cout << "Volume: " << volume << endl;
    return 0;
}

// Function definition
double calcSurfaceArea(double length, double width, double height) {
    // Variables
    double surfaceArea;

    // Calculate
    surfaceArea = (length * width) + (length * (pow((width / 2) * (width / 2) + (height * height), 0.5))) + (width * (pow((length / 2) * (length / 2) + (height * height), 0.5)));

    // Output
    return surfaceArea;
}

double calcVolume(double length, double width, double height) {
    // Variables
    double volume;

    // Calculate
    volume = (length * width * height) / 3;

    // Output
    return volume;
}

