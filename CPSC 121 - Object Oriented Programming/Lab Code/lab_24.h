#include <iostream>
#include <fstream>                          // Inputting and outputting files
#include <string>

using namespace std;

// Constants
const int ARRAYSIZE = 20;

int lab24() {
    // Variables
    int currentLine[ARRAYSIZE];
    int currentNumber, column, largestIndex, lengthOfSequence = 0, maxLengthOfSequence = 0, count;
    char outputCharacters[20], alphaNumber;
    string sequence;

    // read input file
    // loop over each line and put into array/list
    // loop over each element in array and find largest sequence

    ifstream readFromFile;

    // User input
    readFromFile.open("sequenceInput.txt");

    // Read input file
    while (!readFromFile.eof()) {             // reads until reaches end of file
        readFromFile >> currentNumber;
        column = 0; // start at beginning of array

        while (currentNumber != -1) {
            currentLine[column] = currentNumber;
            readFromFile >> currentNumber;
            column++;
        }
        currentLine[column] = currentNumber; // adds the -1 to show array has ended

        column = 0;
        while (currentLine[column] != -1) {
            if (currentLine[column] + 1 == currentLine[column + 1]) {
                lengthOfSequence++;
            }
            else if (lengthOfSequence > maxLengthOfSequence) {
                maxLengthOfSequence = lengthOfSequence;
                largestIndex = column - 1;
                lengthOfSequence = 1;
            }
            column++;
        }

        count = 1;
        lengthOfSequence = 0;
        // Output
        while (count <= maxLengthOfSequence) {
            sequence = sequence + " " + to_string(currentLine[largestIndex - maxLengthOfSequence + count + 1]);
            lengthOfSequence++;
            count++;
        }
        cout << "Length: " << lengthOfSequence << "; Sequence:" << sequence << endl;
        sequence = "";
        maxLengthOfSequence = 1;
        lengthOfSequence = 1;

    } // while (!readFromFile.eof())

    // Close files
    readFromFile.close();

    return 0;
}