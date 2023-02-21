#include <iostream>

using namespace std;

int main() {
    int chocolates, boxes, full_boxes, pieces, total_boxes_needed;

    string first_name = "", last_name = "", full_name = "";

    double proportion;

    cout << "How many chocolates? ";
    cin >> chocolates;

    cout << "How many boxes? ";
    cin >> boxes;

    full_boxes = chocolates/9;
    pieces = chocolates%9;

    cout << full_boxes << " full boxes of chocolates, with " << pieces << " pieces left over.\n";

    if(pieces!=0)
    {
        total_boxes_needed = full_boxes + 1;
    }
    else
    {
        total_boxes_needed = full_boxes;
    }

    cout << "We need " << total_boxes_needed << " boxes to fill all the chocolates.\n";

    proportion = total_boxes_needed*1.0/boxes;

    cout.setf(ios::fixed);
    cout.setf(ios::showpoint);
    cout.precision(2);

    cout << "The proportion of boxes is " << proportion;

    cout << "\nEnter your name, first name and then last: ";
    cin >> first_name;
    cin >> last_name;

    full_name = last_name + ", " + first_name;

    cout << full_name << endl;

    return 0;
}

