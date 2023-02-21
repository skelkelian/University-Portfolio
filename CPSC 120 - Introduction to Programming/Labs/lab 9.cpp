#include <iostream>
#include <fstream>
#include <cctype>
#include <cmath>
#include <ctime>

using namespace std;

void newLine()
{
    char c;

    do {
        cin.get(c);
    } while (c != '\n');
}

void getInput(double &num1)
{
    cout << "How much do you already have? ";
    cin >> num1;

    while (cin.fail())
    {
        cout << "Invalid Input" << endl;
        cout << "How much do you already have? ";
        cin.clear();
        newLine();

        cin >> num1;
    }

    newLine();
}

void getSplitFactor(double &num1)
{
    cout << "What is the split factor? ";
    cin >> num1;

    while (cin.fail())
    {
        cout << "Invalid Input" << endl;
        cout << "What is the split factor? ";
        cin.clear();
        newLine();

        cin >> num1;
    }

    newLine();
}

bool storeTotal(double &add, double dividend)
{
    if (dividend == 0) {
        return false;
    }
    double result;
    result = 256 / dividend;
    result += add;
    add = result;
    return true;
}

int main() {
    double add, dividend;
    getInput(add);
    getSplitFactor(dividend);
    if (storeTotal(add, dividend) == false) {
        cout << "That didn't go to well, you still have " << scientific << add << "\n\n";
    } else {
        cout << "You now have " << scientific << add << "\n\n";
    }

    getInput(add);
    getSplitFactor(dividend);
    storeTotal(add, dividend);
    if (storeTotal(add, dividend) == false) {
        cout << "That didn't go to well, you still have " << scientific << add << "\n\n";
    } else {
        cout << "You now have " << scientific << add << "\n\n";
    }
}

