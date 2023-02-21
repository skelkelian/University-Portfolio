#include <iostream>
#include <fstream>

using namespace std;

void printArray(int inputArray[], int rows)
{
    for (int i = 0; i < rows; i++) {
        cout << inputArray[i] << " ";
    }
    cout << endl;
}

int main() {
    srand(time(0));
    ifstream inputFile;

    inputFile.open("rngNumbers.txt");

    if (inputFile.fail()) {
        cout << "Cannot open inputFile!\n";
        exit(1);
    }

    int inputArray[1000][5];
    double mathResult[15];

    int counter = 0, rows = 1000, columns = 5;

    for (int i = 0; i < rows; i++) {
        double tempDifference = 0;
        for (int j = 0; j < columns; j++) {
            inputFile >> inputArray[i][j];
            if (j != 0)
            {
                tempDifference -= inputArray[i][j];
            }
            else
            {
                tempDifference = inputArray[i][0];
            }
        }
        mathResult[counter] = (tempDifference * 1.0 / 3.0);
        counter++;
    }
    for (int index = 0; index < 15; index++)
    {
        cout << mathResult[index] << " ";
        if (index == 4 || index == 9 || index == 14)
        {
            cout << endl;
        }
    }

    string sentence = "";
    cout << "Enter sentences and then press \"enter\": ";
    getline(cin, sentence);

    int size = sentence.length();

    int randomNumber = rand() % size;

    cout << "\nModified string: " << sentence << endl;
    cout << "Chosen random index: " << randomNumber << endl;

    string modSentence = "";
    modSentence = sentence.substr(0, randomNumber) + sentence.substr(randomNumber + 4, size);

    cout << modSentence << endl;

    string erasedString = "";

    erasedString = sentence.substr(randomNumber, 4);
    cout << "Erased string: \"" << erasedString << "\"" << endl;
}