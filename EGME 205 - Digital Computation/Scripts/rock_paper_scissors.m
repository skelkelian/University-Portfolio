% rps.m
% Author : Serop Kelkelian
% Date modified : 3/8/2020
% Description : Rock , paper , scissors !

close all ;
clear ;
clc ;

gameover=0;
while gameover==0
    %
    % GENERATE PLAYER 2'S CHOICE RANDOMLY
    %
    player2=ceil(3*rand);
    %
    % DISPLAY PLAYER 1'S OPTIONS
    %
    fprintf('You can pick 1, 2 or 3 to choose either rock, paper or scissors \n 1 = rock \n 2 = paper \n 3 = scissors \n')
    %
    % PROMPT PLAYER 1 FOR THEIR CHOICE UNTIL 
    % A VALID CHOICE IS SELECTED
    %
    player1=input('Enter your choice either rock(1), paper(2), or scissors(3): ');
    while player1~=1 && player1~=2 && player1~=3
        player1=input('Please select either 1, 2 or 3: ');
    end
    %
    % DETERMINE THE WINNER
    %
    if player1==player2
        winner=0;
    elseif player1==1 && player2==2
        winner=2;
    elseif player1==1 && player2==3
        winner=1;
    elseif player1==2 && player2==1
        winner=1;
    elseif player1==2 && player2==3
        winner=2;
    elseif player1==3 && player2==2
        winner=1;
    elseif player1==3 && player2==1
        winner=2;
    end
    %
    % CONVERT PLAYER 2'S MOVE TO A STRING
    %
    if player2==1
        player2=('rock');
    elseif player2==2
        player2=('paper');
    elseif player2==3
        player2=('scissors');
    end
    %
    % DISPLAY PLAYER 2?S CHOICE
    %
    fprintf('Player2 chose %s\n\n', player2) 
    %
    % DISPLAY THE OUTCOME
    %
    if winner==0
        fprintf('Draw!\n\n')
    elseif winner==1
        fprintf('You win!\n\n')
    elseif winner==2
        fprintf('You lose!\n\n')
    end
    % G
    x=input('Do you want to play again? (1:Yes,2:No)');
    while x~=1 && x~=2
        x=input('Do you want to play again? (1:Yes,2:No)');
    end
    if x==2
        gameover=1;
    end
end

