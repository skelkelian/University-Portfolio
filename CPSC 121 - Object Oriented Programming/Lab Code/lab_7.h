#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

// Constants

int lab7() {
    // Variables
    double quiz1, quiz2, quiz3, quiz4, quiz5, percent;
    double sumOfStuWeightedQuizScores, sumOfMaxWeightedQuizScores;
    double quiz1weight, quiz2weight, quiz3weight, quiz4weight, quiz5weight;
    string letterGrade;
    int age, quiz1MaxScore = 200, quiz2MaxScore = 150, quiz3MaxScore = 275, quiz4MaxScore = 175, quiz5MaxScore = 225;

    // Input
    cout << "Enter the age of the student: ";
    cin >> age;
    cout << "Enter the score for quiz 1: ";
    cin >> quiz1;
    cout << "Enter the score for quiz 2: ";
    cin >> quiz2;
    cout << "Enter the score for quiz 3: ";
    cin >> quiz3;
    cout << "Enter the score for quiz 4: ";
    cin >> quiz4;
    cout << "Enter the score for quiz 5: ";
    cin >> quiz5;

    // Calculations
    if (age < 18) {
        quiz1weight = 0.2;
        quiz2weight = 0.15;
        quiz3weight = 0.25;
        quiz4weight = 0.1;
        quiz5weight = 0.3;
    }
    else {
        quiz1weight = 0.25;
        quiz2weight = 0.3;
        quiz3weight = 0.35;
        quiz4weight = 0.05;
        quiz5weight = 0.05;
    }
    sumOfStuWeightedQuizScores = quiz1 * quiz1weight + quiz2 * quiz2weight + quiz3 * quiz3weight + quiz4 * quiz4weight + quiz5 * quiz5weight;
    sumOfMaxWeightedQuizScores = quiz1MaxScore * quiz1weight + quiz2MaxScore * quiz2weight + quiz3MaxScore * quiz3weight + quiz4MaxScore * quiz4weight + quiz5MaxScore * quiz5weight;
    percent = (sumOfStuWeightedQuizScores / sumOfMaxWeightedQuizScores) * 100;

    if (percent >= 90) {
        letterGrade = "A";
    }
    else if (percent >= 80) {
        letterGrade = "B";
    }
    else if (percent >= 70) {
        letterGrade = "C";
    }
    else if (percent >= 60) {
        letterGrade = "D";
    }
    else {
        letterGrade = "F";
    }

    // Output
    cout << "Overall percent: " << setprecision(3) << percent << "%" << endl;
    cout << "Letter Grade: " << letterGrade << endl;

    return 0;
}