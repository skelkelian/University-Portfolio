#include <iostream>
#include <fstream>

using namespace std;

void fillUpArray(int theArray[], int &numberUsed)
{
    ifstream inputFile;

    inputFile.open("villagers.txt");

    if (inputFile.fail() )
    {
        cout << "Cannot open inputFile!\n";
        exit(1);
    }

    inputFile >> numberUsed;

    int counter = 0;
    while (inputFile >> theArray[counter])
    {
        counter++;
    }
}

void newLine()
{
    char c;

    do {
        cin.get(c);
    } while (c != '\n');
}

void printArray(int theArray[], int numberUsed) {
    for (int i = 0; i < numberUsed; i++)
    {
        cout << theArray[i] << " ";
    }
    cout << endl;
}

void mySwap (int &num1, int &num2) {

    int temp = num1;

    num1 = num2;

    num2 = temp;

}

int binarySearch(int theA[], int numberUsed, int target){

    int leftIndex = 0;
    int rightIndex = numberUsed - 1;

    do{

        int middleIndex = (leftIndex + rightIndex)/2;

        if(theA[middleIndex] == target)
            return middleIndex;


        if(target > theA[middleIndex])
            leftIndex = middleIndex + 1;
        else
            rightIndex = middleIndex - 1;
    } while (leftIndex <= rightIndex);
    return -1;
}

int main()
{
    cout << "Contents:\n";
    int numberUsed = 101;
    int theArray[101] = {};
    fillUpArray(theArray, numberUsed);
    printArray(theArray, numberUsed);

    int input1, input2, index1, index2;
    cout << "Which two numbers? ";
    cin >> input1 >> input2;
    newLine();
    index1 = binarySearch(theArray, numberUsed, input1);
    index2 = binarySearch(theArray, numberUsed, input2);

    if (index1 == -1 || index2 == -1)
    {
        cout << "At least one of the numbers was not found.\n";
    }
    else
    {
        mySwap(theArray[index1], theArray[index2]);
        printArray(theArray, numberUsed);
    }
}