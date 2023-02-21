#include <iostream>
#include <fstream>
#include <cctype>

using namespace std;

int demo_lab7()
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
    char c1, c2, c3, c4;
    cout << "Enter two numbers: ";
    cin.get(c1);
    cin.get(c2);

    cout << c1 << c2 << "k" << endl;

    cout << "Enter more numbers: ";
    cin >> c3 >> c4;

    while (inputFile.get(c1))
    {
        if (isalpha(c1))
        {

        }
        else if (c1 == '\n')
        {

        }
    }
    return 0;
}
