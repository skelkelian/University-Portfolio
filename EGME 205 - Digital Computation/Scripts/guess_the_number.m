% guess_the_number.m
% Author: Serop Kelkelian
% Date modified: 3/16/2020
% Description: Guessing a number from 1-100

clear;
clc;

% Computer chooses a random number between 1-100
randnum=ceil(100*rand);
trys=0;

% Player chooses a number between 1-100
fprintf('Hello! I am thinking of an integer between 1 and 100\n')
guess=input('Can you guess what it is? ');

% Respond to their guess
while guess~=randnum
    if guess<0
        guess=input('Out of range, guess a number between 1-100: ');
    elseif guess>100
        guess=input('Out of range, guess a number between 1-100: ');
    elseif guess<randnum
        guess=input('Nope! Think higher: ');
    elseif guess>randnum
        guess=input('Nope! Think lower: '); 
    end
    trys=trys+1;
end

if guess==randnum
    fprintf('It only took you %d tries\n\n', trys)
end
