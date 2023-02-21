#include <iostream>

using namespace std;

int main()
{
    int m;
    bool isPrime = true;

    cout << "Enter a number: ";
    cin >> m;

    for (int i = 2; i < m; i++)
    {
        if(m % i == 0)
        {
            isPrime = false;
            break;
        }
    }

    if(isPrime == true)
    {
        cout << m << " is Prime\n";
    }
    else
    {
        cout << m << " is NOT Prime\n";
    }

    return 0;
}