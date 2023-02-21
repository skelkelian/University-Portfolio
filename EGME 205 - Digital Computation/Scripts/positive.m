
% positive.m
% Author: John W. Sanders
% Date modified: 09/11/2017
% Description: A simple game: "Enter a positive number"

close all;
clear all;
clc;

gameover = 0;   % gameover==1 means 'Game Over'
points = 0;     % number of points player has earned

% Prompt player as long as positive numbers are entered
while gameover==0
    % Prompt the player for a positive number
    x = input('Enter a positive number: ');
    % If the number is positive, award the player one point
    if x>0
        points = points + 1;
    % Otherwise, Game Over
    else
        gameover = 1;
    end
end

% Display Game Over message and final score
fprintf('Game Over!\n');
fprintf('Final Score: %d points\n',points);