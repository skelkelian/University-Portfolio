#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Constants
int houseX1 = 1, houseY1 = 2, houseX2 = 9, houseY2 = 1, houseX3 = 7, houseY3 = 9;

// Function prototype
double distanceCalculator(int towerX, int towerY);

int lab17() {
    // Variables
    double totalDistance = 150;
    int towerX = 1, towerY = 1, finalX, finalY;

    // Calculate
    for (towerX; towerX <= 10; towerX++) {
        for (towerY; towerY <= 10; towerY++) {
            if (distanceCalculator(towerX, towerY) < totalDistance) {
                totalDistance = distanceCalculator(towerX, towerY);
                finalX = towerX;
                finalY = towerY;
            }
//            cout << towerX << ", " << towerY << endl; (used for debugging)
        }
        if (towerY >= 10) {
            towerY = 1;
        }
//        cout << towerX << ", " << towerY << endl; (used for debugging)
    }

    // Output
    cout << "The best location for the water tower has a distance of: " << totalDistance << endl;
    cout << "The best location for the water tower is located at (" << finalX << ", " << finalY << ")" << endl;
    return 0;
}

// Function definition
double distanceCalculator(int towerX, int towerY) {
    // Variables
    double distance1, distance2, distance3, distanceSum;

    // Calculate
    distance1 = pow( pow((houseX1 - towerX), 2) + pow((houseY1 - towerY), 2), 0.5 );
    distance2 = pow( pow((houseX2 - towerX), 2) + pow((houseY2 - towerY), 2), 0.5 );
    distance3 = pow( pow((houseX3 - towerX), 2) + pow((houseY3 - towerY), 2), 0.5 );

    distanceSum = distance1 + distance2 + distance3;

    // Output
    return distanceSum;
}

