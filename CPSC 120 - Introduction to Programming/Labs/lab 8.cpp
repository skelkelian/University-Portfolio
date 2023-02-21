#include <iostream>
#include <fstream>
#include <cctype>
#include <cmath>
#include <cstdlib>
#include <ctime>

using namespace std;

//function declaration
void newLine();
string getMeASentence();
bool isItCloseEnough(double num1, double num2, double cutoff);

double num1, num2, cutoff;
int main() {
    srand(time(0));
    cout << "Sentence 1: " + getMeASentence() << endl;
    cout << "Sentence 2: " + getMeASentence() << endl;
    cout << "\nEnter three numbers: ";
    cin >> num1 >> num2 >> cutoff;
    newLine();
    isItCloseEnough(num1, num2, cutoff);
    cout << "\nEnter three numbers: ";
    cin >> num1 >> num2 >> cutoff;
    newLine();
    isItCloseEnough(num1, num2, cutoff);
    cout << "\nEnter three numbers: ";
    cin >> num1 >> num2 >> cutoff;
    newLine();
    isItCloseEnough(num1, num2, cutoff);
    cout << "\nEnter three numbers: ";
    cin >> num1 >> num2 >> cutoff;
    newLine();
    isItCloseEnough(num1, num2, cutoff);
}

//function definition
string getMeASentence() {
    string lowercase_letters = "", sentence = "";

    for (int counter = 0; counter < 5; counter++) {
        char c = (rand() % 26 + 97);

        lowercase_letters = lowercase_letters + c;
    }

    char inequality;
    inequality = (rand() % 3 + 60);

    int random_digit;
    random_digit = rand() % 9 + 1;

    sentence = lowercase_letters + " " + inequality + " " + to_string(random_digit);

    return sentence;

}

bool isItCloseEnough(double num1, double num2, double cutoff) {
    if (num1 - num2 <= cutoff && num2 - num1 <= cutoff) {
        cout << "Yes the numbers are within the cutoff.\n";
    } else {
        cout << "No the numbers are not within the cutoff.\n";
    }
}

void newLine()
{
    char c;

    do {
        cin.get(c);
    } while (c != '\n');
}