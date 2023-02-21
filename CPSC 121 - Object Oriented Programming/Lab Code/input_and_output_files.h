#include <iostream>
#include <fstream>                          // Inputting and outputting files
#include <string>

using namespace std;

int inputOutputFiles() {
    // Variables
    string name = "";
    string temp = "";
    ifstream readFromFile;
    ofstream writeToFile;

    // User input
    readFromFile.open("input.txt");
//    writeToFile.open("output.txt");                       // Overwrites output file at every run
    writeToFile.open("output.txt", ios::app);       // Allows you to append to the end of the file

    // Read input file
    // Option 1
//    while (getline(readFromFile, temp)) {
//        name = name + " " + temp;
//    }

    // Option 2
//    getline(readFromFile, name);

    // Option 3
    while (!readFromFile.eof()) {             // reads until reaches end of file
        getline(readFromFile, temp);
        name = name + "Hello " + temp + "\n";
    }

    // String concatenation (only needed for options 1 and 2)
//    name = "Hello" + name;

    // Write to output file
    writeToFile << name;
    cout << "The following has been written to output.txt " << endl << name << endl;

    // Close files
    readFromFile.close();
    writeToFile.close();

    return 0;
}