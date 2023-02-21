#include <iostream>

using namespace std;

void print2DArray(int theM[][8], int xNumberUsed)
{
    for (int i = 0; i < xNumberUsed; i++)
    {
        for (int j = 0; j < 8; j++)
        {
            cout << theM[i][j] << " ";
        }
        cout << endl;
    }

}

int main() {
    int theMatrix[5][8] = {
            {1, 2, 3, 4, 5, 6, 7, 8},
            {0},
            {3, 7, 2, 1, 8, 5, 9},
            {0},
            {5, 7, 2, 9, 8, 7, 5, 2}

    };

    int xNumberUsed = 5;
    int yNumberUsed = 8;
    print2DArray(theMatrix, xNumberUsed);

    int xRow = 2;
    int yRow = 3;

    char direction;
    do {
        cout << "You are at (" << xRow << ", " << yRow << "), with a value of " << theMatrix[xRow][yRow] << "\n";

        cout << "Where to? ";
        cin >> direction;

        switch (direction) {
            case 'l':
            case 'L': yRow = yRow - 1; break;
            case 'r':
            case 'R': yRow = yRow + 1; break;
            case 'u':
            case 'U': xRow = xRow - 1; break;
            case 'd':
            case 'D': xRow = xRow + 1; break;

            default: cout << "Invalid choice!\n";
        }
    } while (0 <= xRow && 0 <= yRow && xRow < xNumberUsed && yRow < yNumberUsed);

    return 0;
}