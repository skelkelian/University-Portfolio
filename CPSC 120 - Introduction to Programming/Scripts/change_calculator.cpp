#include <iostream>

using namespace std;

int main(){
    int change, remainder, quarters, dimes, nickels, pennies;
    cout << "How much change? ";
    cin >> change;

    do {
        if (change >= 25)
        {
            quarters = change / 25;
            remainder = change % 25;
            change = change % 25;
        }
        else if (change >= 10)
        {
            dimes = change / 10;
            remainder = change % 10;
            change = change % 10;
        }
        else if (change >= 5)
        {
            nickels = change / 5;
            remainder = change % 5;
            change = change % 5;
        }
        else
        {
            pennies = change;
            remainder = pennies;
        }
    } while (remainder != pennies);

    cout << quarters << " quarters, " << dimes << " dimes, " << nickels << " nickels, " << pennies << " pennies\n";

    return 0;
}

