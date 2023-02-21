#include <iostream>

using namespace std;

int main() {
    float d, r;

    cout << "<";
    cout << "<";
    cout << "<";
    cout << "<";
    cout << ">";
    cout << ">";
    cout << ">";
    cout << ">" << endl;

    cout << "x/d = 7-r" << endl;

    cout << "Enter a number d: ";
    cin >> d;

    cout << "Enter a number r: ";
    cin >> r;

    float x = (7-r)*d;

    cout << "If d = " << d << " and r = " << r << ", then x = " << x << endl;

    return 0;
}
