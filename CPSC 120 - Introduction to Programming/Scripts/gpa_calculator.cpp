#include <iostream>
#include <fstream>

using namespace std;

int main()
{
    ifstream inputFile;
    ofstream outputFile;

    outputFile.open("results.txt");

    inputFile.open("inputIntegers.txt");

    if (inputFile.fail() )
    {
        cout << "Cannot open inputFile!\n";
        exit(1);
    }

    int num1, num2;
    cout << "Results: \n";

    while (inputFile >> num1 >> num2)
    {
        if (num1 % num2 == 0 || num2 % num1 == 0)
        {
            outputFile << num1 << " and " << num2 << " are factors\n";
            cout << num1 << " and " << num2 << " are factors\n";
        }
        else
            outputFile << "Not Results\n";
        cout << "Not Results\n";
    }

    return 0;
}