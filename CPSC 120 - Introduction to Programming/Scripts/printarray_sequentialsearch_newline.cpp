#include <iostream>

using namespace std;

//arrays are always "call by reference"
void printArray( int theArray[], int numberUsed)
{
    for (int i = 0; i < numberUsed; i++)
    {
        cout << theArray[i] << " ";
    }
    cout << endl;
}

int sequentialSearch(int theArray[], int numberUsed, int target)
{
    for (int i = 0; i < numberUsed; i++)
    {
        if(theArray[i] == target)
            return i;
    }
    return -1;
}

void newLine()
{
    char c;

    do {
        cin.get(c);
    } while (c != '\n');
}

int main()
{
    int theArray[9] = {6, 9, 11, 12, 18, 20, 25, 26, 28};
    int numberUsed = 9;

    printArray(theArray, numberUsed);

    int target;
    cout << "Enter a number to search for: ";
    cin >> target;
    newLine();

    int index = sequentialSearch(theArray, numberUsed, target);

    if (index == -1)
        cout << "Number not found! \n";
    else
        cout << "Number found at index " << index << endl;

    return 0;
}