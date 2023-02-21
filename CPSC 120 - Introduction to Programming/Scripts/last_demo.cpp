#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main()
{
    ifstream inputFile("poem1.txt");

    if (inputFile.fail() )
    {
        cout << "Cannot open inputFile!\n";
        exit(1);
    }

    char c;
    string s1 = "";

//    inputFile.get(c);
//    inputFile >> s1;
    getline(inputFile, s1, '\n');

//    while (getline(inputFile, s1))
//    {
//
//    }

    cout << s1 << "k\n";

    s1 = "hello world";
    string s2 = s1.substr(2, 3);
    cout << s2 << "k\n";

    s2 = s1.insert(6, "my ");
    cout << s2 << "k\n";

    s1.erase(6, 3);
    cout << s1 << "k\n";

    int index = s1.find("or");
    if (index == -1)
    {
        cout << "not found!\n";
    }
    else
    {
        cout << "found at index " << index << endl;
    }

    if(s1.empty());
    {
        cout << "it's empty\n";
    }

    if(s1.length() > 2)
    {
        cout << "it's longer than 2\n";
    }

    if(s1[0] == 'I')
    {
        cout << "first letter is an I!\n";
    }

    return 0;
}