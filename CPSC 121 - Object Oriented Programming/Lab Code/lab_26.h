#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Function prototype
double customDistanceCalculator(int towerX, int towerY, int houseX1, int houseY1, int houseX2, int houseY2, int houseX3, int houseY3);

int lab26() {
    // Variables
    double totalDistance = 150, currentDistance = 200, grid[15][15] = {};
    int towerX = 1, towerY = 1, finalX, finalY;
    int houseX1, houseY1, houseX2, houseY2, houseX3, houseY3;

    // Input
    cout << "House 1 x axis position: ";
    cin >> houseX1;
    cout << "House 1 y axis position: ";
    cin >> houseY1;
    cout << "House 2 x axis position: ";
    cin >> houseX2;
    cout << "House2 y axis position: ";
    cin >> houseY2;
    cout << "House 3 x axis position: ";
    cin >> houseX3;
    cout << "House 3 y axis position: ";
    cin >> houseY3;

//    grid[houseX1][houseY1] = 1;
//    grid[houseX2][houseY2] = 1;
//    grid[houseX3][houseY3] = 1;

    // Calculate
    for (towerX; towerX <= 15; towerX++) {
        for (towerY; towerY <= 15; towerY++) {
            grid[towerX][towerY] = customDistanceCalculator(towerX, towerY, houseX1, houseY1, houseX2, houseY2, houseX3, houseY3);
            currentDistance = grid[towerX][towerY];
            if (currentDistance < totalDistance) {
                finalX = towerX;
                finalY = towerY;
                totalDistance = currentDistance;
            }
//            cout << grid[towerX][towerY] << ", "; // (used for debugging)
        }
        if (towerY >= 15) {
            towerY = 1;
//            cout << endl; // (used for debugging)
        }
    }

    // Output
    cout << "The best location for the water tower has a distance of: " << totalDistance << endl;
    cout << "The best location for the water tower is located at (" << finalX << ", " << finalY << ")" << endl;
    return 0;
}

// Function definition
double customDistanceCalculator(int towerX, int towerY, int houseX1, int houseY1, int houseX2, int houseY2, int houseX3, int houseY3) {
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

