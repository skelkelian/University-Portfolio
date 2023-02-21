#include <iostream>
#include <fstream>
#include <cctype>

using namespace std;

int main()
{
    ifstream inputFile;
    ofstream outputFile;

    outputFile.open("clean.txt");

    inputFile.open("someNumbers.txt");

    if (inputFile.fail() )
    {
        cout << "Cannot open inputFile!\n";
        exit(1);
    }

    char c1;

    cout << "Output: \n";

    while (inputFile.get(c1))
    {
        if (isalpha(c1)) {
            char c2 = tolower(c1);
            cout << (c2);
            outputFile << (c2);
        } else if (isdigit(c1)) {
            cout << c1;
        } else if (c1 == ' ') {
            cout << " ";
            outputFile << " ";
        } else if (c1 == '\n') {
            cout << "\n";
            outputFile << "  ";
        } else {

        }
    }
    return 0;
}
