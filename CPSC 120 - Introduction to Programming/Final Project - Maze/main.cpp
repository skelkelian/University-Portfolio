#include <iostream>
#include <algorithm>
#include <fstream>
#include <cstdlib>

using namespace std;

void print2DArray(int (*theArray)[30], int xNumberUsed)
{
    for (int i = 0; i < xNumberUsed; i++)
    {
        for (int j = 0; j < xNumberUsed; j++)
        {
            cout << theArray[i][j] << " ";
        }
        cout << endl;
    }
}

void printBigBoss(int (*theArray)[30])
{
    for (int i = 0; i < 30; i++)
    {
        for (int j = 0; j < 30; j++)
        {
            cout << theArray[i][j] << " ";
        }
        cout << endl;
    }
}

void fillUpArray(int (*theArray)[30], int xNumberUsed, string file_name)
{
    ifstream inputFile;
    inputFile.open(file_name);

    if (inputFile.fail() )
    {
        cout << "Cannot open inputFile!\n";
        exit(1);
    }

    for (int i = 0; i < xNumberUsed; i++)
    {
        for (int j = 0; j < xNumberUsed; j++)
        {
            inputFile >> theArray[i][j];
        }
    }
}

int fillUpBigBoss(int (*bigBoss)[30], int (*theArray)[30])
{
    theArray = bigBoss;
    printBigBoss(theArray);
    return ((*theArray)[30]);
}

void modifyArray(int &x, int &y, int (*maze)[30])
{
    maze[x][y] = 2;
}

void goUp(int &x, int &y, int (*maze)[30])
{
    if ((maze[x - 1][y] == 0 || maze[x - 1][y] == 9) && x > 0)
    {
        x = x - 1;
        cout << x << endl;
        modifyArray(x, y, maze);
    }
    else
    {
        cout << "Invalid move!" << endl;
    }
}

void goDown(int &x, int &y, int (*maze)[30], int mazeSize)
{
    if ((maze[x + 1][y] == 0 || maze[x + 1][y] == 9) && x < mazeSize)
    {
        x = x + 1;
        cout << x << endl;
        modifyArray(x, y, maze);
    }
    else
    {
        cout << "Invalid move!" << endl;
    }
}

void goRight(int &x, int &y, int (*maze)[30], int mazeSize)
{
    if ((maze[x][y + 1] == 0 || maze[x][y + 1] == 9 || maze[x][y + 1] == 8 || maze[x][y + 1] == 7 || maze[x][y + 1] == 6) && y < mazeSize)
    {
        y = y + 1;
        cout << y << endl;
        modifyArray(x, y, maze);
    }
    else
    {
        cout << "Invalid move!" << endl;
    }
}

void goLeft(int &x, int &y, int (*maze)[30])
{
    if ((maze[x][y - 1] == 0) && y > 0)
    {
        y = y - 1;
        cout << y << endl;
        modifyArray(x, y, maze);
    }
    else
    {
        cout << "Invalid move!" << endl;
    }
}

bool didYouLose(int &x, int &y, int (*maze)[30])
{
    bool gameOver = false;
    cout << "X is: " << x << " and Y is: " << y << endl;
    if (maze[x][y + 1] != 0 && maze[x + 1][y] != 0 && maze[x - 1][y] != 0 && maze[x][y + 1] != 9 && maze[x][y + 1] != 8 && maze[x][y + 1] != 7 && maze[x][y + 1] != 6)
    {
        cout << "You are stuck, you cannot get out!\n";
        cout << "You are lost in the maze :(\n\n";
        gameOver = true;
    }
    return gameOver;
}

bool didYouLoseNoOutput(int &x, int &y, int (*maze)[30])
{
    bool gameOver = false;
    if (maze[x][y + 1] != 0 && maze[x + 1][y] != 0 && maze[x - 1][y] != 0)
    {
        gameOver = true;
    }
    return gameOver;
}

void getInput(string &input1);
void getInputNumber(int &num1);
void getNumberOfTasks(int &num1);
void getNumberOfSteps(int &num1);

void newLine();

int main() {
    srand(time(0));
    ifstream inputFile;

    int mazeSize = 1;
    cout << "Welcome to this maze game!" << endl;

    do {
        cout << "What size would you like the maze to be? You can pick either 8, 9, 10, 11, 12, 13, 14 or 30. ";
        cin >> mazeSize;
    } while (mazeSize != 8 && mazeSize != 9 && mazeSize != 10 && mazeSize != 11 && mazeSize != 12 && mazeSize != 13 && mazeSize != 14 && mazeSize != 30);

    int maze[30][30] = { { } };

    if (mazeSize == 8) {
        fillUpArray(maze, mazeSize, "maze8.txt");
        print2DArray(maze, mazeSize);
        cout << "\nHere is your 8x8 maze." << endl;
        cout << "Your goal is to navigate to the number 9." << endl;
        cout << "This maze has multiple characters: Zeros are your pathways and ones are your blockades." << endl;
    }
    else if (mazeSize == 9) {
        fillUpArray(maze, mazeSize, "maze9.txt");
        print2DArray(maze, mazeSize);
        cout << "\nHere is your 9x9 maze." << endl;
        cout << "Your goal is to navigate to the number 9." << endl;
        cout << "This maze has multiple characters: Zeros are your pathways and ones are your blockades." << endl;
    }
    else if (mazeSize == 10) {
        fillUpArray(maze, mazeSize, "maze10.txt");
        print2DArray(maze, mazeSize);
        cout << "\nHere is your 10x10 maze." << endl;
        cout << "Your goal is to navigate to the number 8." << endl;
        cout << "This maze has multiple characters: Zeros are your pathways and ones are your blockades." << endl;
    }
    else if (mazeSize == 11) {
        fillUpArray(maze, mazeSize, "maze11.txt");
        print2DArray(maze, mazeSize);
        cout << "\nHere is your 11x11 maze." << endl;
        cout << "Your goal is to navigate to the number 8." << endl;
        cout << "This maze has multiple characters: Zeros are your pathways and ones are your blockades." << endl;
    }
    else if (mazeSize == 12) {
        fillUpArray(maze, mazeSize, "maze12.txt");
        print2DArray(maze, mazeSize);
        cout << "\nHere is your 12x12 maze." << endl;
        cout << "Your goal is to navigate to the number 7." << endl;
        cout << "This maze has multiple characters: Zeros are your pathways and ones are your blockades." << endl;
    }
    else if (mazeSize == 13) {
        fillUpArray(maze, mazeSize, "maze13.txt");
        print2DArray(maze, mazeSize);
        cout << "\nHere is your 13x13 maze." << endl;
        cout << "Your goal is to navigate to the number 7." << endl;
        cout << "This maze has multiple characters: Zeros are your pathways and ones are your blockades." << endl;
    }
    else if (mazeSize == 14) {
        fillUpArray(maze, mazeSize, "maze14.txt");
        print2DArray(maze, mazeSize);
        cout << "\nHere is your 14x14 maze." << endl;
        cout << "Your goal is to navigate to the number 6." << endl;
        cout << "This maze has multiple characters: Zeros are your pathways and ones are your blockades." << endl;
    }
    else {
        int bigBoss[30][30] = {
                {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0} ,
                {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0} ,
                {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0} ,
                {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0} ,
                {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0} ,
                {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0} ,
                {0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0} ,
                {0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0} ,
                {0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0} ,
                {0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0} ,
                {0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0} ,
                {0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0} ,
                {0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0} ,
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0} ,
                {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0} ,
                {0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0} ,
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0} ,
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0} ,
                {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0} ,
                {0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0} ,
                {0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0} ,
                {0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0} ,
                {0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 6} ,
                {0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0} ,
                {0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0} ,
                {0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0} ,
                {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0} ,
                {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0} ,
                {0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0} ,
                {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0} ,
        };

        fillUpBigBoss(bigBoss, maze);
        cout << "\n";

        int steps;
        steps = 1;

        cout << "\nHere is the Big Boss! It is a 30x30 array" << endl;
        cout << "Your goal is to predict the least amount of steps needed to navigate to the number 6." << endl;
        cout << "This maze has multiple characters: Zeros are your pathways and ones are your blockades." << endl;
        getNumberOfSteps(steps);
        int difference;
        if (steps > 65)
        {
            difference = steps - 65;
        }
        else
        {
            difference = 65 - steps;
        }

        if (steps == 65)
        {
            cout << "You got it spot on! Nice job!\n";
        }
        else if (difference <= 3)
        {
            cout << "You were really close but not quite there! You were off by " << difference << ".\n";
        }
        else if (difference <= 5)
        {
            cout << "You were close but did not get it! You were off by " << difference << ".\n";
        }
        else if (difference <= 10)
        {
            cout << "You were not that close! You were off by " << difference << ".\n";
        }
        else
        {
            cout << "You were not close whatsoever! You were off by " << difference << ".\n";
        }
    }

    int x = 0;
    int y = 0;

    if (mazeSize != 30)
    {
        do {
            string direction;
            cout << "Would you like to go up, down, left, or right? ";
            cin >> direction;

            if (direction == "left" || direction == "LEFT")
            {
                goLeft(x, y, maze);
            }
            else if (direction == "right" || direction == "RIGHT")
            {
                goRight(x, y, maze, mazeSize);
            }
            else if (direction == "up" || direction == "UP")
            {
                goUp(x, y, maze);
            }
            else if (direction == "down" || direction == "DOWN")
            {
                goDown(x, y, maze, mazeSize);
            }
            else
            {
                cout << "You have selected an invalid direction.\n";
            }

            print2DArray(maze, mazeSize);

            if (didYouLose(x, y, maze))
            {
                break;
            }

        } while (y + 1 != mazeSize);

        if (!didYouLoseNoOutput(x, y, maze))
        {
            cout << "Congratulations! You made it out of the maze!\n";
        }
    }

    string wannaPlay;
    getInput(wannaPlay);

    if (wannaPlay == "no" || wannaPlay == "NO")
    {
        cout << "You have decided not to play 20 questions.\n";
        return 1;
    }

    cout << "\nYou have decided to play 20 questions!\n";
    cout << "\nHere are the rules!\n";
    cout << "There are two players. Player 1 must come up with an answer. Player 2 needs to ask questions about \n";
    cout << "player 1's answer to narrow down the possibilities. Player 1 answers the questions truthfully without \n";
    cout << "giving away the answer in his response. You can ask up to 20 questions before you must guess what the \n";
    cout << "answer is. Also, if you feel confident you have the answer before the 20 questions are up, you may \n";
    cout << "decide to answer early, but be careful, when you decide to answer, your answer is FINAL. \n";
    cout << "Good luck!\n\n";

    int counter;
    counter = 0;

    int stop_limit;
    stop_limit = 20;

    string answer;
    answer = " ";

    string answerLowercase;
    answerLowercase = " ";

    string question;
    question = " ";

    string reply;
    reply = " ";

    string yes_no;
    yes_no = " ";

    string guess;
    guess = " ";

    string guessLowercase;
    guessLowercase = " ";

    cout << "Player 1: What would you like your answer to be? ";
    getline(cin, answer);

    for (counter; counter < stop_limit; counter++)
    {
        cin.ignore(99999, '\n');
        cout << "Player 2: Ask your question to player 1! ";
        getline(cin, question);
        cout << "\n";

        cout << "Here was the question: " << question << endl;

        cin.ignore(99999, '\n');
        cout << "Player 1: Reply to player 2's question: ";
        getline(cin, reply);
        cout << "\n";

        cout << "Here is the response: " << reply << endl;

        cout << "Would you like to guess the answer? ";
        cin >> yes_no;

        if (yes_no != "YES" && yes_no != "NO" && yes_no != "yes" && yes_no != "no")
        {
            do {
                cout << "Please answer yes or no: ";
                cin >> yes_no;
            } while (yes_no != "YES" && yes_no != "NO" && yes_no != "yes" && yes_no != "no");
        }
        cout << "\n";

        if (yes_no == "yes" || yes_no == "YES")
        {
            cout << "What do you think the answer is? ";
            cin >> guess;

            int index;
            index = 0;

            int length;
            length = guess.length();

            int i;
            i = 0;

            int length1;
            length1 = guess.length();

            char c;
            char c1;

            for (index; index < length; index++)
            {
                c = tolower(guess[index]);
                guessLowercase = guessLowercase + c;
            }

            for (i; i < length1; i++)
            {
                c1 = tolower(answer[i]);
                answerLowercase = answerLowercase + c1;
            }

            if (answerLowercase == guessLowercase)
            {
                cout << "Congratulations! You guessed right!\n";
            }
            else
            {
                cout << "I'm sorry! You were wrong, good try!\n";
            }

            break;
        }
        else if (counter == 19)
        {
            cout << "It is your last question, you need to make a guess now.\n";
            cout << "What do you think the answer is? ";
            cin >> guess;

            int index;
            index = 0;

            int length;
            length = guess.length();

            int i;
            i = 0;

            int length1;
            length1 = guess.length();

            char c;
            char c1;

            for (index; index < length; index++)
            {
                c = tolower(guess[index]);
                guessLowercase = guessLowercase + c;
            }

            for (i; i < length1; i++)
            {
                c1 = tolower(answer[i]);
                answerLowercase = answerLowercase + c1;
            }

            if (answerLowercase == guessLowercase)
            {
                cout << "Congratulations! You guessed right!\n";
            }
            else
            {
                cout << "I'm sorry! You were wrong, good try!\n";
            }
        }

    }

    int scopeOfNumbers;
    scopeOfNumbers = 2;

    int choice;
    choice = 2;

    cout << "\nThe next game is a number guessing game!\n";

    getInputNumber(scopeOfNumbers);

    cout << "You selected " << scopeOfNumbers << endl;
    cout << "This means that you can select any integer from 1 to " << scopeOfNumbers << ": ";
    cin >> choice;

    while (choice > scopeOfNumbers || choice < 1)
    {
        cout << "Please select integer between 1 and " << scopeOfNumbers << ": ";
        cin >> choice;
    }

    cout << "You selected " << choice << endl;

    int random_digit;
    random_digit = rand() % scopeOfNumbers + 1;
    cout << random_digit << " is the random digit\n";

    bool winner;
    winner = false;

    if (random_digit == choice)
    {
        cout << "You guessed right!\n";
        winner = true;
    }
    else
    {
        cout << "You guessed wrong :(\n";
    }

    double odds;
    odds = 1 / (scopeOfNumbers * 1.0) * 100;

    if (winner)
    {
        if (scopeOfNumbers >= 5000)
        {
            cout << "GO OUT AND BUY A LOTTERY TICKET RIGHT NOW.\n";
            cout << "There was a " << odds << "% chance that you would have guessed right.\n";
        }
        if (scopeOfNumbers >= 1000)
        {
            cout << "You are legendary! There was a " << odds << "% chance that you would have guessed right.\n";
        }
        else if (scopeOfNumbers >= 500)
        {
            cout << "You are incredible! There was a " << odds << "% chance that you would have guessed right.\n";
        }
        else if (scopeOfNumbers >= 100)
        {
            cout << "You are awesome! There was a " << odds << "% chance that you would have guessed right.\n";
        }
        else if (scopeOfNumbers >= 50)
        {
            cout << "That was really cool! There was a " << odds << "% chance that you would have guessed right.\n";
        }
        else if (scopeOfNumbers >= 10)
        {
            cout << "That was alright. There was a " << odds << "% chance that you would have guessed right.\n";
        }
        else
        {
            cout << "There was a " << odds << "% chance that you would have guessed right.\n";
        }
    }
    else
    {
        if (scopeOfNumbers >= 5000)
        {
            cout << "Maybe don't go buy a lottery ticket today. There was a " << odds << "% chance that you would have guessed right.\n";
        }
        if (scopeOfNumbers >= 1000)
        {
            cout << "You tried to be legendary! Unfortunately, it didn't work out. There was a " << odds << "% chance that you would have guessed right.\n";
        }
        else if (scopeOfNumbers >= 500)
        {
            cout << "You tried to be incredible! Unfortunately, it didn't work out. There was a " << odds << "% chance that you would have guessed right.\n";
        }
        else if (scopeOfNumbers >= 100)
        {
            cout << "You tried to be awesome! Unfortunately, it didn't work out. There was a " << odds << "% chance that you would have guessed right.\n";
        }
        else if (scopeOfNumbers >= 50)
        {
            cout << "That was almost cool! Unfortunately, it didn't work out. There was a " << odds << "% chance that you would have guessed right.\n";
        }
        else if (scopeOfNumbers >= 10)
        {
            cout << "There was a " << odds << "% chance that you would have guessed right. Unfortunately, it didn't work out.\n";
        }
        else
        {
            cout << "That was embarrassing. There was a " << odds << "% chance that you would have guessed right and u still didn't get it.\n";
        }
    }

    int numberOfTasks;
    numberOfTasks = 1;
    cout << "\nThe last game is going to help you create your todolist for the day!\n";
    getNumberOfTasks(numberOfTasks);

    if (numberOfTasks >= 15)
    {
        cout << "Wow you will barely have any time for yourself today! Lets get started with this list.\n";
    }
    else if (numberOfTasks >= 10)
    {
        cout << "You are going to have a busy day today! Lets get started with this list.\n";
    }
    else if (numberOfTasks >= 7)
    {
        cout << "Nice! Today will be a productive day! Lets get started with this list.\n";
    }
    else if (numberOfTasks >= 5)
    {
        cout << "You have a nice relaxing day today! Lets get started with this list.\n";
    }
    else
    {
        cout << "Awesome! You should get to bed nice and early today! Lets get started with this list.\n";
    }

    int index1;
    index1 = 0;

    string task;
    task = "";

    string todoList;
    todoList = "";

    for (index1; index1 < numberOfTasks; index1++)
    {
        cin.ignore(99999, '\n');
        cout << "What is your number " << index1 + 1 << " task you need to complete today? ";
        getline(cin, task);
        todoList = todoList + "\n" + to_string(index1 + 1) + ". " + task;
    }
    cout << todoList << endl;

    return 0;
}

void getInput(string &input1)
{
    cout << "The next game is 20 questions! Would you like to play? ";
    cin >> input1;

    while (input1 != "yes" && input1 != "no" && input1 != "YES" && input1 != "NO")
    {
        cout << "Would you like to play, yes or no? ";
        cin.clear();
        newLine();

        cin >> input1;
    }

    newLine();
}

void getNumberOfSteps(int &num1)
{
    cout << "What are the least amount of steps needed to reach the number 6? ";
    cin >> num1;

    while (cin.fail())
    {
        cout << "Enter a number greater than 1: ";
        cin.clear();
        newLine();

        cin >> num1;
    }

    newLine();
}

void getInputNumber(int &num1)
{
    cout << "How many numbers do you want to pick from? ";
    cin >> num1;

    while (cin.fail())
    {
        cout << "Enter a number greater than 1: ";
        cin.clear();
        newLine();

        cin >> num1;
    }

    newLine();
}

void getNumberOfTasks(int &num1)
{
    cout << "How many tasks do you have for today? ";
    cin >> num1;

    while (cin.fail())
    {
        cout << "Enter a number greater than or equal to 1: ";
        cin.clear();
        newLine();

        cin >> num1;
    }

    newLine();
}

void newLine()
{
    char c;

    do {
        cin.get(c);
    } while (c != '\n');
}