#include <iostream>
#include <cmath>

using namespace std;

int main()
{
//    Question: Can the inputted number be a negative number?
//    I am assuming that every "valid" number would be positive.

//    Question: Can the inputted number have a decimal value?
//    I am assuming that this program only accepts integers as "valid" numbers.
    int user_input, last_digit, bamboozable = 0, not_bamboozable = 0, total = 0;
    string output_str = "";
    float percent;
    do {
        cout << "Enter a number: ";
        cin >> user_input;
        total++;

        last_digit = user_input % 10;


        if (last_digit + 1 != 7 && last_digit + 2 != 7 && last_digit + 3 != 7 && last_digit + 4 != 7 && last_digit + 5 != 7)
        {
            output_str = output_str + to_string(user_input) + " was bamboozable.\n";
            bamboozable++;
        }
        else
        {
            output_str = output_str + to_string(user_input) + " was NOT bamboozable.\n";
            not_bamboozable++;
        }

    } while (user_input != 77);

    cout << "\n";
    cout << output_str << endl;

    cout.setf(ios::fixed);
    cout.setf(ios::showpoint);
    cout.precision(2);

    percent = bamboozable*100.0/total;
    cout << "Bamboozable percentage: " << percent << " %" << endl;

    return 0;
