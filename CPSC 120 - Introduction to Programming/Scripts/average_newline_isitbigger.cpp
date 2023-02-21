#include <iostream>
#include <fstream>
#include <cctype>

using namespace std;

//function declaration
double findAvg(int num1, int num2, int num3);
bool isItBigger(double value1, double value2);
void newLine(); //no return type is void

int main()
{
    int num1, num2, num3;

    cout << "Enter 3 numbers: ";
    cin >> num1 >> num2 >> num3;

    newLine();

    double result = findAvg(num1, num2, num3);

    cout << findAvg(num1, num2, num3) << endl;

    if (isItBigger(num1, result) == true)
        cout << num1 << " is bigger\n";
    else
        cout << result << " is bigger\n";
}

//function definition
double findAvg (int num1, int num2, int num3) //function header
{
    double result = static_cast<double>(num1 + num2 + num3)/3;

    return result;
}

bool isItBigger (double value1, double value2) //function header
{
    if (value1 > value2)
        return true;
    else
        return false;
}

void newLine()
{
    char c;

    do {
        cin.get(c);
    } while (c != '\n');
}