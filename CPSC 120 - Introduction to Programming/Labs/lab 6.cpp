#include <iostream>
#include <fstream>

using namespace std;

int main()
{
    ifstream inputFile;
    ofstream outputFile;

    outputFile.open("simResults.txt");

    inputFile.open("someRNG.txt");

    if (inputFile.fail() )
    {
        cout << "Cannot open inputFile!\n";
        exit(1);
    }

    int probability = 0, input_value, counter = 1;
    cout << "What is the probability of winning? ";
    cin >> probability;

    while (inputFile >> input_value)
    {
        if (input_value <= probability)
        {
            outputFile << counter << ". Win" << endl;
        }
        else
            outputFile << counter << ". Lose" << endl;
        counter += 1;
    }

    cout << "\nSimulation Done.\n";

    return 0;
}
