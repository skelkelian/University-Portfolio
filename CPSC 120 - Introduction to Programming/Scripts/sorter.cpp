#include <iostream>

using namespace std;

void printArray(int theArray[], int numberUsed) {
    for (int i = 0; i < numberUsed; i++) {
        cout << theArray[i] << " ";
    }
    cout << endl;
}

void mySwap (int &num1, int &num2) {

    int temp = num1;

    num1 = num2;

    num2 = temp;

}

int findNextSmallestIndex(int theArray[], int numberUsed, int startingIndex)
{
    int smallestIndex = startingIndex;

    for (int i = startingIndex + 1; i < numberUsed; i++)
    {
        if (theArray[i] < theArray[smallestIndex])
            smallestIndex = i;
    }
    return smallestIndex;
}

void selectionSort(int theArray[], int numberUsed)
{
    for (int i = 0; i < numberUsed-1; i++)
    {
        int nextSmallestIndex = findNextSmallestIndex(theArray, numberUsed, i);
        mySwap(theArray[i], theArray[nextSmallestIndex]);
    }
}

int main()
{
    int theArray[6] = {26, 15, 22, 8, 11, 24};
    int numberUsed = 6;

    printArray(theArray, numberUsed);
    selectionSort(theArray, numberUsed);
    printArray(theArray, numberUsed);

    return 0;
}