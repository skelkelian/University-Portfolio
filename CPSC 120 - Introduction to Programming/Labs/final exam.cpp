#include <iostream>
#include <fstream>

using namespace std;

void printArray(int theArray[])
{
    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < 5; j++) {
            cout << inputArray[i][j] << " "
        }
        cout << endl;
    }
}
//
//void newLine()
//{
//    char c;
//
//    do {
//        cin.get(c);
//    } while (c != '\n');
//}
//
//void getInput(int &num1)
//{
//    cout << "How many characters? ";
//    cin >> num1;
//
//    while (cin.fail() || num1 > 99)
//    {
//        cout << "How many characters? ";
//        cin.clear();
//        newLine();
//
//        cin >> num1;
//    }
//
//    newLine();
//}

int main() {
    ifstream inputFile;

    inputFile.open("rngNumbers.txt");

    if (inputFile.fail()) {
        cout << "Cannot open inputFile!\n";
        exit(1);
    }

    int inputArray[30][5];
    int mathResult[15];
    int outputArray[3][5];

    int counter = 0, tempDifference = 0, rows = 1000, columns = 5;

    for (int i = 0; i < 30; i++) {
        for (int j = 0; j < columns; j++) {
            inputFile >> inputArray[i][j];
        }
    }

    printArray(inputArray);

//    for (int i = 0; i < 30; i++) {
//        for (int j = 0; j < columns; j++) {
//            cout << inputArray[i][j] << " ";
//        }
//    }

}

//    counter = 0;
//    for row in inputarray
//         tempdiff = 0;
//         for column in input array
//              tempdiff -= inputarray[i][j]
//         mathresult[counter] = divide by 3
//         counter ++
//    counter1 = 0;
//    for row in outputarray
//         for column in output array
//              outputArray[i][j] = mathresult[counter1]
//              counter1 ++

//    for (int index = 0; index < 5; index++)
//    {
//
//    }


//  cout
//  cin.getline(var, \n)
//  int size = length(var);
//  get random number from 0 to value of size
//  cout string
//  string modstring;
//  modstring = string.substr(0, random_num) + string.substr(random_num + 5, size);
//  cout modstring
//  cout << random number
//  cout << string.substr(random_num, random_num + 4);