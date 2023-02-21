#include <iostream>

using namespace std;

int main()
{
    string play_again;
    do {
        int temperature_stat, tasks, time_allotted;
        temperature_stat = 70;

        do {
            cout << "Temperature: " << temperature_stat << "\n";
            cout << "Enter number of tasks: ";
            cin >> tasks;

            while (tasks < 4 || tasks > 20) {
                cout << "Invalid Input!\n\n";
                cout << "Temperature: " << temperature_stat << "\n";
                cout << "Enter number of tasks: ";
                cin >> tasks;
            }

            cout << "Time allotted: ";
            cin >> time_allotted;
            cout << "\n";

            if (time_allotted > 3 * tasks)
            {
                temperature_stat = temperature_stat - 5;
            }
            else
            {
                temperature_stat = temperature_stat + 5;
            }


        } while (temperature_stat > 60 && temperature_stat < 85);

        cout << "Temperature: " << temperature_stat << "\n";
        cout << "Task Scheduler must rest!\n";
        cout << "Turn on again? ";
        cin >> play_again;
        cout << "\n";
    } while (play_again == "Yes" || play_again == "yes");

    return 0;
}
