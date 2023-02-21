#include <iostream>

using namespace std;

void printArray(int theArray[], int numberUsed) {
    for (int i = 0; i < numberUsed; i++)
    {
        cout << theArray[i] << " ";
    }
    cout << endl;
}

void arrayInsert(int theArray[], int &numberUsed, int where, int what)
{
    for(int i = numberUsed; i >= what ; i--)
    {
        theArray[i] = theArray[i - 1];
    }
    theArray[where] = what;
    numberUsed++;
}

int main()
{
    int theArray[500] = {8, 5, 10, 16, 14};
    int numberUsed = 5;

    int where, what;
    cout << "Enter where and what: ";
    cin >> where >> what;

    printArray(theArray, numberUsed);
    arrayInsert(theArray, numberUsed, where, what);
    printArray(theArray, numberUsed);
    return 0;
}