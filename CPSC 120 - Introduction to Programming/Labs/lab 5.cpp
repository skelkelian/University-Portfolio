#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    char choice;
    double val;
    int asterisks, numPer;

    do {
        cout << "Enter a choice: ";
        cin >> choice;

        switch(choice)
        {
            case 'm':
            case 'M': cout << "Enter a number: ";
                cin >> val;
                cout << "Answer: " << log10(val) << endl; break;
            case 'g':
            case 'h':
            case 'H':
            case 'G': cout << "How many asterisks? ";
                cin >> asterisks;
                cout << "How many per row? ";
                cin >> numPer;

                for (int i = 0; i < asterisks; i++)
                {
                    cout << "* ";
                    if((i+1) % numPer == 0)
                        cout << endl;

                }
                cout << endl;
                break;

            case 'e':
            case 'E': cout << "Good bye!\n"; break;
            default: cout << "Invalid choice!\n";
        }

        if(choice == 'e' || choice == 'E')
            break;


    } while (choice != 'e');

    return 0;
}