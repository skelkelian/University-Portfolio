#include <iostream>

using namespace std;

int main()
{
    int theArray[6] = {1, 2, 3};
    int numberUsed = 6;

    int num;
    int counter = 0;
    do
    {
        theArray[counter++] = rand()%2;
    } while (counter < numberUsed);

    cout << "Enter a number: ";
    cin >> theArray[0];

    for (int i = 0; i < numberUsed; i++)
    {
        cout << theArray[i] << " ";
    }
    cout << endl;

    return 0;
}
