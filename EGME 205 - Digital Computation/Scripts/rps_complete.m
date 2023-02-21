 % rps.m
 % Author: 
 % Date modified: 
 % Description: Rock, paper, scissors!
 %
 close all;
 clear;
 clc;
 
 gameover = 0;
 
 while gameover==0
     %
     % GENERATE PLAYER 2'S CHOICE RANDOMLY
     %
     % Set "player2" equal to either 1, 2, 
     % or 3. Each of these three outcomes 
     % should be equally probable
     %
     %%%%%%%%%% INSERT CODE BELOW %%%%%%%%%% 
     player2 = ceil(3*rand);
    %  player2 = floor(1 + 3*rand);

     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %
     % DISPLAY PLAYER 1'S OPTIONS
     %
     % Display Player 1's options to the 
     % command prompt:
     %    1 = rock
     %    2 = paper
     %    3 = scissors
     %
     %%%%%%%%%% INSERT CODE BELOW %%%%%%%%%% 
     fprintf('1 = rock\n2 = paper\n3 = scissors\n');

     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %
     % PROMPT PLAYER 1 FOR THEIR MOVE UNTIL 
     % A VALID MOVE IS SELECTED
     %
     % Set "player1" equal to Player 1's
     % choice (either 1, 2, or 3). Do not
     % allow Player 1 to choose anything
     % else
     %
     %%%%%%%%%% INSERT CODE BELOW %%%%%%%%%%
     player1 = input('Enter your choice here: ');
    %  while ~(player1==1 || player1 == 2 || player1 == 3)
     while (player1~=1 && player1~=2 && player1~=3)
         player1 = input('Enter your choice here: ');
     end

     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %
     % DETERMINE THE WINNER
     %
     % Set "winner" equal to either 0, 1, 
     % or 2, based on the outcome 
     %
     %    player1   player2   winner
     %    1         1         0
     %    1         2         2
     %    1         3         1
     %    2         1         1
     %    2         2         0
     %    2         3         2
     %    3         1         2
     %    3         2         1
     %    3         3         0
     %
     %%%%%%%%%% INSERT CODE BELOW %%%%%%%%%%   
     if player1==1 && player2==1
         winner = 0;
     elseif player1==1 && player2==2
         winner = 2;
     elseif player1==1 && player2==3
         winner = 1;
     elseif player1==2 && player2==1
         winner = 1;
     elseif player1==2 && player2==2
         winner = 0;
     elseif player1==2 && player2==3
         winner = 2;
     elseif player1==3 && player2==1
         winner = 2;
     elseif player1==3 && player2==2
         winner = 1;
     else
         winner = 0;
     end

     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     % 
     % CONVERT PLAYER 2'S MOVE TO A STRING
     %
     % Set "player2" equal to 'rock',
     % 'paper', or 'scissors', depending
     % on Player 2's choice
     %    1 => 'rock'
     %    2 => 'paper'
     %    3 => 'scissors'
     %
     %%%%%%%%%% INSERT CODE BELOW %%%%%%%%%% 
     if player2==1
         player2 = 'rock';
     elseif player2==2
         player2 = 'paper';
     else
         player2 = 'scissors';
     end

     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     % 
     % DISPLAY PLAYER 2'S CHOICE
     %
     % Display Player 2's choice to the
     % command prompt:
     %    Player 2 chose ___________.
     %
     %%%%%%%%%% INSERT CODE BELOW %%%%%%%%%% 
     fprintf('Player 2 chose %s\n',player2);

     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %
     % DISPLAY THE OUTCOME
     %
     % Display one of the following to the
     % command prompt, depending on the
     % outcome:
     %    You win!
     %    You lose!
     %    Draw!
     %
     %%%%%%%%%% INSERT CODE BELOW %%%%%%%%%%
     if winner==1
         fprintf('You win!\n');
     elseif winner==2
         fprintf('You lose!\n');
     else
         fprintf('Draw!\n');
     end

     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
     % Give player option to play again
     x = input('Do you want to play again? (1:Yes,2:No)');
%      while ~(x==1 || x==2)
     while x~=1 && x~=2
         x = input('Do you want to play again? (1:Yes,2:No)');
     end
     if x==2
         gameover = 1;
     end
 end