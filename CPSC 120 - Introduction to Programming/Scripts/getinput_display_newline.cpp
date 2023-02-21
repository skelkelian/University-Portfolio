#include <iostream>
#include <fstream>
#include <cctype>

using namespace std;

void getInput(int &num1);

void display(int n);

void newLine(); //no return type is void

int main()
{
    int number;

    getInput(number);
    display(number);

    return 0;
}

void display(int n)
{
    cout << "You entered " << n << endl;
    n = n + 1;
}

void getInput(int &num1)
{
    cout << "Enter a number: ";
    cin >> num1;

    while (cin.fail())
    {
        cout << "Enter a number! ";
        cin.clear();
        newLine();

        cin >> num1;
    }

    newLine();
}

void newLine()
{
    char c;

    do {
        cin.get(c);
    } while (c != '\n');
}