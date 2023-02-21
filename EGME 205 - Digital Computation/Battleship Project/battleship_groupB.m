% battleship_groupB.m
% group two
% date modified: 3/21/2020
% description: aim, fire!

clear;
clc;

% THREE ENHANCEMENTS
    % PLAY A SOUND AFTER A WIN
    % ADDITIONAL GOD MODE FOR COMPUTER
    % IF SOMEONE HITS A SHIP THEY CAN KEEP CHOOSING UNTIL THEY MISS
    

    % PRINT DIRECTIONS FRIEND OR COMPUTER?
    fprintf('If you want to play against a computer type 1 \nIf you want to play against a friend type 2\n')
    
    % ASK THEM HOW THEY WANT TO PLAY UNTIL
    % A VALID CHOICE IS SELECTED
    gameMode=input('Enter who you would like to play against a computer(1) or a friend(2): ');
    while gameMode~=1 && gameMode~=2
        gameMode=input('Please select either 1 or 2: '); 
    end
    
    % RUN THE CODE DEPENDING ON WHICH GAMEMODE THEY PICK 
    if gameMode==1
            % DISPLAY RULES FOR 1 PLAYER
            fprintf('\nYou have chose to play against a computer. \nTake turns choosing points on the computers 10x10 board \nin hopes of hitting a part of the ship. \nIf you hit every part of the ship it will be sunk and \nyou will continue picking points until you sink all ships. \nThe first player to sink all opponent ships wins. \n\nGoodluck, Have fun! \n\n')
            
            % ASK WHAT LEVEL PLAYER WANTS THE COMPUTER TO BE 
            gameDifficulty=input('Enter what level computer you would like to play against, easy(1), pro(2) or god(3): ');
            while gameDifficulty~=1 && gameDifficulty~=2 && gameDifficulty~=3
                gameDifficulty=input('Please select either 1, 2 or 3: '); 
            end
            
            % PLAYER 1 PICKING POINTS
            
            
            % CREATE THE PRIMARY BOARD FOR PLAYER 1
            PB1=zeros(10:10);

            % CARRIER

            % ASK PLAYER 1 FOR HORIZONTAL OR VERTICAL AXIS 
            CA1=input('Specify whether you would like your carrier to be horizontal(1) or vertical(2): '); % carrier axis player one
            while CA1~=1 && CA1~=2
                CA1=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 1 TO ASSIGN LOCATION FOR CARRIER
            CR1=input('Specify what row you would like to place the carrier: '); % carrier row player one
                while CR1~=1 && CR1~=2 && CR1~=3 && CR1~=4 && CR1~=5 && CR1~=6 && CR1~=7 && CR1~=8 && CR1~=9 && CR1~=10 
                    CR1=input('Please select a number between 1-10: ');
                end
            CC1=input('Specify what column you would like to place the carrier: '); % carrier column player one
                while CC1~=1 && CC1~=2 && CC1~=3 && CC1~=4 && CC1~=5 && CC1~=6 && CC1~=7 && CC1~=8 && CC1~=9 && CC1~=10 
                    CC1=input('Please select a number between 1-10: ');
                end

            % VERIFY THAT THE POINT IS VALID
            if CA1==1
                while CC1>6 || CC1<=0 || mod(CC1,1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    CR1=input('Try a row integer that is between 1 and 6: ');
                    CC1=input('Try a column integer that is between 1 and 6: ');   
                end
            else
                while CR1>6 || CR1<=0 || mod(CR1,1)~=0 
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    CR1=input('Try a row integer that is between 1 and 6: ');
                    CC1=input('Try a column integer that is between 1 and 6: ');   
                end
            end

            % DEPENDING ON WHAT THEY CHOOSE, PLACE THE REST OF THE POINTS            
            PB1 = placing_carrier_points(PB1, CA1, CR1, CC1);

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT          
            disp(PB1)
            fprintf('Your carrier has been placed \n\n')

            % BATTLESHIP

            % HORIZONTAL OR VERTICAL AXIS
            BA1=input('Specify whether you would like your battleship to be horizontal(1) or vertical(2): '); % battleship axis player one
            while BA1~=1 && BA1~=2
                BA1=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 1 TO ASSIGN LOCATION FOR BATTLESHIP
            BR1=input('Specify what row you would like to place the battleship: '); % battleship row player one
                while BR1~=1 && BR1~=2 && BR1~=3 && BR1~=4 && BR1~=5 && BR1~=6 && BR1~=7 && BR1~=8 && BR1~=9 && BR1~=10 
                    BR1=input('Please select a number between 1-10: ');
                end
            BC1=input('Specify what column you would like to place the battleship: '); % battleship column player one
                while BC1~=1 && BC1~=2 && BC1~=3 && BC1~=4 && BC1~=5 && BC1~=6 && BC1~=7 && BC1~=8 && BC1~=9 && BC1~=10 
                    BC1=input('Please select a number between 1-10: ');
                end

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if BA1==1
                while BC1>7 || BC1<=0 || mod(BC1,1)~=0 || PB1(BR1,BC1)~=0 || PB1(BR1,BC1+1)~=0 || PB1(BR1,BC1+2)~=0 || PB1(BR1,BC1+3)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    BR1=input('Try a row integer that is between 1 and 7: ');
                    BC1=input('Try a column integer that is between 1 and 7: ');   
                end
                PB1(BR1,BC1)=4;
                PB1(BR1,BC1+1)=4;
                PB1(BR1,BC1+2)=4;
                PB1(BR1,BC1+3)=4;
            else
                while BR1>7 || BR1<=0 || mod(BR1,1)~=0 || PB1(BR1,BC1)~=0 || PB1(BR1+1,BC1)~=0 || PB1(BR1+2,BC1)~=0 || PB1(BR1+3,BC1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    BR1=input('Try a row integer that is between 1 and 7: ');
                    BC1=input('Try a column integer that is between 1 and 7: ');   
                end
                PB1(BR1,BC1)=4;
                PB1(BR1+1,BC1)=4;
                PB1(BR1+2,BC1)=4;
                PB1(BR1+3,BC1)=4;
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT          
            disp(PB1)
            fprintf('Your battleship has been placed \n\n')

            % DESTROYER

            % HORIZONTAL OR VERTICAL AXIS
            DA1=input('Specify whether you would like your destroyer to be horizontal(1) or vertical(2): '); % destroyer axis player one
            while DA1~=1 && DA1~=2
                DA1=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 1 TO ASSIGN LOCATION FOR DESTROYER
            DR1=input('Specify what row you would like to place the destroyer: '); % destroyer row player one
                while DR1~=1 && DR1~=2 && DR1~=3 && DR1~=4 && DR1~=5 && DR1~=6 && DR1~=7 && DR1~=8 && DR1~=9 && DR1~=10 
                    DR1=input('Please select a number between 1-10: ');
                end
            DC1=input('Specify what column you would like to place the destroyer: '); % destroyer column player one
                while DC1~=1 && DC1~=2 && DC1~=3 && DC1~=4 && DC1~=5 && DC1~=6 && DC1~=7 && DC1~=8 && DC1~=9 && DC1~=10 
                    DC1=input('Please select a number between 1-10: ');
                end

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if DA1==1
                while DC1>8 || DC1<0 || mod(DC1,1)~=0 || PB1(DR1,DC1)~=0 || PB1(DR1,DC1+1)~=0 || PB1(DR1,DC1+2)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    DR1=input('Try a row integer that is between 1 and 8: ');
                    DC1=input('Try a column integer that is between 1 and 8: ');   
                end
                PB1(DR1,DC1)=3;
                PB1(DR1,DC1+1)=3;
                PB1(DR1,DC1+2)=3;
            else
                while DR1>8 || DR1<0 || mod(DR1,1)~=0 || PB1(DR1,DC1)~=0 || PB1(DR1+1,DC1)~=0 || PB1(DR1+2,DC1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    DR1=input('Try a row integer that is between 1 and 8: ');
                    DC1=input('Try a column integer that is between 1 and 8: ');   
                end
                PB1(DR1,DC1)=3;
                PB1(DR1+1,DC1)=3;
                PB1(DR1+2,DC1)=3;
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT          
            disp(PB1)
            fprintf('Your destroyer has been placed \n\n')

            % SUBMARINE

            % HORIZONTAL OR VERTICAL AXIS
            SA1=input('Specify whether you would like your submarine to be horizontal(1) or vertical(2): '); % submarine axis player one
            while SA1~=1 && SA1~=2
                SA1=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 1 TO ASSIGN LOCATION FOR SUBMARINE
            SR1=input('Specify what row you would like to place the submarine: '); % submarine row player one
                while SR1~=1 && SR1~=2 && SR1~=3 && SR1~=4 && SR1~=5 && SR1~=6 && SR1~=7 && SR1~=8 && SR1~=9 && SR1~=10 
                    SR1=input('Please select a number between 1-10: ');
                end
            SC1=input('Specify what column you would like to place the submarine: '); % submarine column player one
                while SC1~=1 && SC1~=2 && SC1~=3 && SC1~=4 && SC1~=5 && SC1~=6 && SC1~=7 && SC1~=8 && SC1~=9 && SC1~=10 
                    SC1=input('Please select a number between 1-10: ');
                end

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if SA1==1
                while SC1>8 || SC1<0 || mod(SC1,1)~=0 || PB1(SR1,SC1)~=0 || PB1(SR1,SC1+1)~=0 || PB1(SR1,SC1+2)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    SR1=input('Try a row integer that is between 1 and 8: ');
                    SC1=input('Try a column integer that is between 1 and 8: ');   
                end
                PB1(SR1,SC1)=1;
                PB1(SR1,SC1+1)=1;
                PB1(SR1,SC1+2)=1;
            else
                while SR1>8 || SR1<0 || mod(SR1,1)~=0 || PB1(SR1,SC1)~=0 || PB1(SR1+1,SC1)~=0 || PB1(SR1+2,SC1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    SR1=input('Try a row integer that is between 1 and 8: ');
                    SC1=input('Try a column integer that is between 1 and 8: ');   
                end
                PB1(SR1,SC1)=1;
                PB1(SR1+1,SC1)=1;
                PB1(SR1+2,SC1)=1;
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT
            disp(PB1)
            fprintf('Your submarine has been placed \n\n')

            % PATROL BOAT

            % HORIZONTAL OR VERTICAL AXIS
            PA1=input('Specify whether you would like your patrol boat to be horizontal(1) or vertical(2): '); % patrol boat axis player one
            while PA1~=1 && PA1~=2
                PA1=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 1 TO ASSIGN LOCATION FOR PATROL BOAT
            PR1=input('Specify what row you would like to place the patrol boat: '); % patrol boat row player one
                while PR1~=1 && PR1~=2 && PR1~=3 && PR1~=4 && PR1~=5 && PR1~=6 && PR1~=7 && PR1~=8 && PR1~=9 && PR1~=10 
                    PR1=input('Please select a number between 1-10: ');
                end
            PC1=input('Specify what column you would like to place the patrol boat: '); % patrol boat column player one
                while PC1~=1 && PC1~=2 && PC1~=3 && PC1~=4 && PC1~=5 && PC1~=6 && PC1~=7 && PC1~=8 && PC1~=9 && PC1~=10 
                    PC1=input('Please select a number between 1-10: ');
                end

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if PA1==1
                while PC1>9 || PC1<0 || mod(PC1,1)~=0 || PB1(PR1,PC1)~=0 || PB1(PR1,PC1+1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    PR1=input('Try a row integer that is between 1 and 9: ');
                    PC1=input('Try a column integer that is between 1 and 9: ');   
                end
                PB1(PR1,PC1)=2;
                PB1(PR1,PC1+1)=2;
            else
                while PR1>9 || PR1<0 || mod(PR1,1)~=0 || PB1(PR1,PC1)~=0 || PB1(PR1+1,PC1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    PR1=input('Try a row integer that is between 1 and 9: ');
                    PC1=input('Try a column integer that is between 1 and 9: ');   
                end
                PB1(PR1,PC1)=2;
                PB1(PR1+1,PC1)=2;
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT          
            disp(PB1)
            fprintf('Your patrol boat has been placed \n\n')
            
            
            % COMPUTER PLACING SHIPS
            
            
            % CREATE THE PRIMARY BOARD FOR THE COMPUTER
            PB2=zeros(10:10);
            
            % CARRIER

            % HAVE COMPUTER RANDOMLY PICK AN AXIS 
            CA2=ceil(2*rand); % carrier axis computer
           
            % HAVE COMPUTER RANDOMLY ASSIGN LOCATION FOR CARRIER
            CR2=ceil(10*rand); 
            
            CC2=ceil(10*rand);
            
            % VERIFY THAT POINT IS VALID
            if CA2==1
                while CC2>6
                    CR2=ceil(6*rand);
                    CC2=ceil(6*rand);
                end
            else
                while CR2>6
                    CR2=ceil(6*rand);
                    CC2=ceil(6*rand);
                end
            end

            % AUTOPLACE THE REST OF THE COMPUTER'S POINTS
            if CA2==1
                PB2(CR2,CC2)=5;
                PB2(CR2,CC2+1)=5;
                PB2(CR2,CC2+2)=5;
                PB2(CR2,CC2+3)=5;
                PB2(CR2,CC2+4)=5;
            else 
                PB2(CR2,CC2)=5;
                PB2(CR2+1,CC2)=5;
                PB2(CR2+2,CC2)=5;
                PB2(CR2+3,CC2)=5;
                PB2(CR2+4,CC2)=5; 
            end
                        
            % BATTLESHIP

            % HAVE COMPUTER RANDOMLY PICK AN AXIS
            BA2=ceil(2*rand);

            % HAVE COMPUTER RANDOMLY ASSIGN LOCATION FOR BATTLESHIP
            BR2=ceil(10*rand);
            
            BC2=ceil(10*rand);
            
            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if BA2==1
                while BC2>7 || PB2(BR2,BC2)~=0 || PB2(BR2,BC2+1)~=0 || PB2(BR2,BC2+2)~=0 || PB2(BR2,BC2+3)~=0
                    BR2=ceil(7*rand);
                    BC2=ceil(7*rand); 
                end
                PB2(BR2,BC2)=4;
                PB2(BR2,BC2+1)=4;
                PB2(BR2,BC2+2)=4;
                PB2(BR2,BC2+3)=4;
            else
                while BR2>7 || PB2(BR2,BC2)~=0 || PB2(BR2+1,BC2)~=0 || PB2(BR2+2,BC2)~=0 || PB2(BR2+3,BC2)~=0
                    BR2=ceil(7*rand);
                    BC2=ceil(7*rand);             
                end
                PB2(BR2,BC2)=4;
                PB2(BR2+1,BC2)=4;
                PB2(BR2+2,BC2)=4;
                PB2(BR2+3,BC2)=4;
            end
            
            % DESTROYER

            % HAVE COMPUTER RANDOMLY PICK AN AXIS
            DA2=ceil(2*rand);

            % HAVE COMPUTER RANDOMLY ASSIGN LOCATION FOR DESTROYER
            DR2=ceil(10*rand);
            
            DC2=ceil(10*rand);

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if DA2==1
                while DC2>8 || PB2(DR2,DC2)~=0 || PB2(DR2,DC2+1)~=0 || PB2(DR2,DC2+2)~=0
                    DR2=ceil(8*rand);
                    DC2=ceil(8*rand);
                end
                PB2(DR2,DC2)=3;
                PB2(DR2,DC2+1)=3;
                PB2(DR2,DC2+2)=3;
            else
                while DR2>8 || PB2(DR2,DC2)~=0 || PB2(DR2+1,DC2)~=0 || PB2(DR2+2,DC2)~=0
                    DR2=ceil(8*rand);
                    DC2=ceil(8*rand);                
                end
                PB2(DR2,DC2)=3;
                PB2(DR2+1,DC2)=3;
                PB2(DR2+2,DC2)=3;
            end
            
            % SUBMARINE

            % HAVE COMPUTER RANDOMLY PICK AN AXIS
            SA2=ceil(rand*2);
            
            % HAVE COMPUTER RANDOMLY ASSIGN LOCATION FOR SUBMARINE
            SR2=ceil(rand*10);
            
            SC2=ceil(rand*10);
            
            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if SA2==1
                while SC2>8 || PB2(SR2,SC2)~=0 || PB2(SR2,SC2+1)~=0 || PB2(SR2,SC2+2)~=0
                    
                    SR2=ceil(8*rand);
                    SC2=ceil(8*rand);
                end
                PB2(SR2,SC2)=1;
                PB2(SR2,SC2+1)=1;
                PB2(SR2,SC2+2)=1;
            else
                while SR2>8 || PB2(SR2,SC2)~=0 || PB2(SR2+1,SC2)~=0 || PB2(SR2+2,SC2)~=0
                   
                    SR2=ceil(rand*8);
                    SC2=ceil(rand*8);
                end
                PB2(SR2,SC2)=1;
                PB2(SR2+1,SC2)=1;
                PB2(SR2+2,SC2)=1;
            end
            
            % PATROL BOAT

            % HAVE COMPUTER RANDOMLY PICK AN AXIS
            PA2=ceil(2*rand);

            % ASK PLAYER 2 TO ASSIGN LOCATION FOR PATROL BOAT
            PR2=ceil(10*rand);
            PC2=ceil(10*rand);

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if PA2==1
                while PC2>9 || PB2(PR2,PC2)~=0 || PB2(PR2,PC2+1)~=0 
                    
                    PR2=ceil(9*rand);
                    PC2=ceil(9*rand);
                end
                PB2(PR2,PC2)=2;
                PB2(PR2,PC2+1)=2;
            else
                while PR2>9 || PB2(PR2,PC2)~=0 || PB2(PR2+1,PC2)~=0
                   
                    PR2=ceil(9*rand);
                    PC2=ceil(9*rand);
                end
                PB2(PR2,PC2)=2;
                PB2(PR2+1,PC2)=2;
            end
            
            % CREATE SECONDARY BOARD FOR PLAYER AND COMPUTER
            SB1=zeros(10:10);
            SB2=zeros(10:10);
    
            % CREATE HIT COUNTER FOR EACH SHIP
            
            % HIT COUNTER ARRAY
            HCA1=[0,0,0,0,0];
            HCA2=[0,0,0,0,0];
            % 5,4,3,2,1 (5=CARRIER, 4=BATTLESHIP, 3=DESTROYER, 2=PATROL BOAT, 1=SUBMARINE)

            % CREATE A WHILE LOOP SO THIS GOES ON UNTIL THE GAME IS OVER
            gameover=0;
            while gameover==0
                
                % TELL PLAYER 1 TO PICK A POINT
                fprintf('\nIT IS YOUR TURN PLAYER 1\n\n')
                P1PR=input('Pick a row you think one of the opponents ship is on: '); % PLAYER ONE POINT ROW
                    while P1PR~=1 && P1PR~=2 && P1PR~=3 && P1PR~=4 && P1PR~=5 && P1PR~=6 && P1PR~=7 && P1PR~=8 && P1PR~=9 && P1PR~=10 % MAKE SURE IT IS A VALID POINT
                        P1PR=input('Please select an integer between 1-10: ');
                    end
                P1PC=input('Pick a column you think one of the opponents ship is on: '); % PLAYER ONE POINT COLUMN
                    while P1PC~=1 && P1PC~=2 && P1PC~=3 && P1PC~=4 && P1PC~=5 && P1PC~=6 && P1PC~=7 && P1PC~=8 && P1PC~=9 && P1PC~=10 % MAKE SURE IT IS A VALID POINT
                        P1PC=input('Please select an integer between 1-10: ');
                    end
                    
                % CHECK IF THAT POINT HAS ALREADY BEEN PICKED 
                while SB1(P1PR,P1PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN HE HAS ALREADY PICKED THAT POINT
                    fprintf('\nYou have already picked that point\n\n')
                    P1PR=input('Pick a row you think one of the opponents ship is on: '); % PROMPT HIM TO PICK AGAIN
                    while P1PR~=1 && P1PR~=2 && P1PR~=3 && P1PR~=4 && P1PR~=5 && P1PR~=6 && P1PR~=7 && P1PR~=8 && P1PR~=9 && P1PR~=10 
                        P1PR=input('Please select an integer between 1-10: ');
                    end
                    P1PC=input('Pick a column you think one of the opponents ship is on: ');
                    while P1PC~=1 && P1PC~=2 && P1PC~=3 && P1PC~=4 && P1PC~=5 && P1PC~=6 && P1PC~=7 && P1PC~=8 && P1PC~=9 && P1PC~=10 
                        P1PC=input('Please select an integer between 1-10: ');
                    end
                end
                
                % IF PLAYER HITS A SHIP 
                while PB2(P1PR,P1PC)==1 || PB2(P1PR,P1PC)==2 || PB2(P1PR,P1PC)==3 || PB2(P1PR,P1PC)==4 || PB2(P1PR,P1PC)==5  % IF HE PICKS A POINT AND A SHIP IS THERE
                    
                    % CHECKS WHICH SHIP IT HIT
                    if PB2(P1PR,P1PC)==1 % I SET THE SUBMARINE POINTS TO ONE
                        HCA2(1,5)=HCA2(1,5)+1;
                        if HCA2(1,5)==3 % IF EVERY POINT HAS BEEN HIT, THE SHIP IS SUNK
                            PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                            SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                            disp(SB1)
                            fprintf('\nThe submarine has been sunk!\n\n')
                        else
                            PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                            SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                            disp(SB1)
                            fprintf('\nHIT\n\n')
                        end
                    elseif PB2(P1PR,P1PC)==2 % I SET THE PATROL BOAT POINTS TO TWO
                        HCA2(1,4)=HCA2(1,4)+1;
                        if HCA2(1,4)==2 % IF EVERY POINT HAS BEEN HIT, THE SHIP IS SUNK
                            PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                            SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                            disp(SB1)
                            fprintf('\nThe patrol boat has been sunk!\n\n')
                        else
                            PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                            SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                            disp(SB1)
                            fprintf('\nHIT\n\n')
                        end
                    elseif PB2(P1PR,P1PC)==3 % I SET THE DESTROYER POINTS TO THREE
                        HCA2(1,3)=HCA2(1,3)+1;
                        if HCA2(1,3)==3 % IF EVERY POINT HAS BEEN HIT, THE SHIP IS SUNK
                            PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                            SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                            disp(SB1)
                            fprintf('\nThe destroyer has been sunk!\n\n')
                        else
                            PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                            SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                            disp(SB1)
                            fprintf('\nHIT\n\n')
                        end
                    elseif PB2(P1PR,P1PC)==4 % I SET THE BATTLESHIP POINTS TO FOUR
                        HCA2(1,2)=HCA2(1,2)+1;
                        if HCA2(1,2)==4 % IF EVERY POINT HAS BEEN HIT, THE SHIP IS SUNK
                            PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                            SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                            disp(SB1)
                            fprintf('\nThe battleship has been sunk!\n\n')
                        else
                            PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                            SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                            disp(SB1)
                            fprintf('\nHIT\n\n')
                        end
                    elseif PB2(P1PR,P1PC)==5 % I SET THE CARRIER POINTS TO FIVE
                        HCA2(1,1)=HCA2(1,1)+1; 
                        if HCA2(1,1)==5 % IF EVERY POINT HAS BEEN HIT, THE SHIP IS SUNK
                            PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                            SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                            disp(SB1)
                            fprintf('\nThe carrier has been sunk!\n\n')
                        else
                            PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                            SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                            disp(SB1)
                            fprintf('\nHIT\n\n')
                        end
                    end
                    
                    % CHECK IF THE GAME IS OVER
                    % IF THE SUM OF THE HIT COUNTER ARRAY EQUALS 17 END THE GAME
                    if sum(HCA2,2)==17
                        gameover=1;
                        sound();
                        fprintf('\nCongratulations player 1! YOU WON! You now have bragging rights over the computer for the rest of your life!\n\n')
                    end
                    
                    % IF THE GAME IS OVER, STOP THE WHILE LOOP FROM CONTINUING
                    if gameover==1
                        break
                    end
                    
                    % PROMPT TO KEEP CHOOSING POINTS UNTIL A MISS
                    P1PR=input('Pick a row you think one of the opponents ship is on: '); 
                    while P1PR~=1 && P1PR~=2 && P1PR~=3 && P1PR~=4 && P1PR~=5 && P1PR~=6 && P1PR~=7 && P1PR~=8 && P1PR~=9 && P1PR~=10 
                        P1PR=input('Please select an integer between 1-10: ');
                    end
                    P1PC=input('Pick a column you think one of the opponents ship is on: ');
                    while P1PC~=1 && P1PC~=2 && P1PC~=3 && P1PC~=4 && P1PC~=5 && P1PC~=6 && P1PC~=7 && P1PC~=8 && P1PC~=9 && P1PC~=10 
                        P1PC=input('Please select an integer between 1-10: ');
                    end
                    
                    % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
                    while SB1(P1PR,P1PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN HE HAS ALREADY PICKED THAT POINT
                        fprintf('\nYou have already picked that point\n\n')
                        P1PR=input('Pick a row you think one of the opponents ship is on: '); % PROMPT HIM TO PICK AGAIN
                        while P1PR~=1 && P1PR~=2 && P1PR~=3 && P1PR~=4 && P1PR~=5 && P1PR~=6 && P1PR~=7 && P1PR~=8 && P1PR~=9 && P1PR~=10 
                            P1PR=input('Please select an integer between 1-10: ');
                        end
                        P1PC=input('Pick a column you think one of the opponents ship is on: ');
                        while P1PC~=1 && P1PC~=2 && P1PC~=3 && P1PC~=4 && P1PC~=5 && P1PC~=6 && P1PC~=7 && P1PC~=8 && P1PC~=9 && P1PC~=10 
                            P1PC=input('Please select an integer between 1-10: ');
                        end
                    end
                end % while player hits a ship
                
                % IF THE GAME IS OVER, STOP THE WHILE LOOP FROM CONTINUING
                if gameover==1
                    break
                end
                % IF PLAYER MISSES A SHIP
                if PB2(P1PR,P1PC)==0 % IF HE PICKS A POINT AND THERE IS NO SHIP

                    % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
                    while SB1(P1PR,P1PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN HE HAS ALREADY PICKED THAT POINT
                        fprintf('\nYou have already picked that point\n\n')
                        P1PR=input('Pick a row you think one of the opponents ship is on: '); % PROMPT HIM TO PICK AGAIN
                        while P1PR~=1 && P1PR~=2 && P1PR~=3 && P1PR~=4 && P1PR~=5 && P1PR~=6 && P1PR~=7 && P1PR~=8 && P1PR~=9 && P1PR~=10 
                            P1PR=input('Please select an integer between 1-10: ');
                        end
                        P1PC=input('Pick a column you think one of the opponents ship is on: ');
                        while P1PC~=1 && P1PC~=2 && P1PC~=3 && P1PC~=4 && P1PC~=5 && P1PC~=6 && P1PC~=7 && P1PC~=8 && P1PC~=9 && P1PC~=10 
                            P1PC=input('Please select an integer between 1-10: ');
                        end
                    end

                    SB1(P1PR,P1PC)=-1; % SET THE SECONDARY BOARD EQUAL TO -1 TO SHOW A MISS
                    fprintf('\nMISS!\n\n')
                    disp(SB1)
                end
                
                % COMPUTER PICKING POINTS
                
                % COMPUTER PLAYS BASED OFF DIFFICULTY
                if gameDifficulty==1 % EASY DIFFICULTY
                    P2PR=ceil(10*rand);
                    P2PC=ceil(10*rand);
                    
                    % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
                    while SB2(P2PR,P2PC)~=0 
                        P2PR=ceil(10*rand); 
                        P2PC=ceil(10*rand);
                    end
                
                    % IF COMPUTER HITS A SHIP
                    while PB1(P2PR,P2PC)==1 || PB1(P2PR,P2PC)==2 || PB1(P2PR,P2PC)==3 || PB1(P2PR,P2PC)==4 || PB1(P2PR,P2PC)==5
                        
                        % HIT COUNTER AND SUNK SHIP
                        if PB1(P2PR,P2PC)==1
                            HCA1(1,5)=HCA1(1,5)+1;
                            if HCA1(1,5)==3 % IF EVERY POINT HAS BEEN HIT, THE SHIP IS SUNK
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer sunk your submarine\n\n') 
                            else
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer got a hit\n\n') 
                            end
                        elseif PB1(P2PR,P2PC)==2
                            HCA1(1,4)=HCA1(1,4)+1;
                            if HCA1(1,4)==2
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer sunk your patrol boat\n\n') 
                            else
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1)
                                fprintf('\nComputer got a hit\n\n')
                            end
                        elseif PB1(P2PR,P2PC)==3
                            HCA1(1,3)=HCA1(1,3)+1;
                            if HCA1(1,3)==3
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1)
                                fprintf('\nComputer sunk your destroyer\n\n')
                            else
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer got a hit\n\n') 
                            end
                        elseif PB1(P2PR,P2PC)==4 
                            HCA1(1,2)=HCA1(1,2)+1;
                            if HCA1(1,2)==4
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer sunk your battleship\n\n')
                            else
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1)
                                fprintf('\nComputer got a hit\n\n') 
                            end
                        elseif PB1(P2PR,P2PC)==5 
                            HCA1(1,1)=HCA1(1,1)+1; 
                            if HCA1(1,1)==5
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer sunk your carrier\n\n') 
                            else
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer got a hit\n\n') 
                            end
                        end
                        
                        % IF THE SUM OF THE HIT COUNTER ARRAY EQUALS 17 END THE GAME
                        if sum(HCA1,2)==17
                            gameover=1;
                            fprintf('\nComputer wins! Better luck next time!\n\n')
                        end
                        
                        % IF THE GAME IS OVER, STOP THE WHILE LOOP FROM CONTINUING
                        if gameover==1
                            break % I PUT THIS HERE SO IT WILL STOP THE PROMPT TO KEEP CHOOSING
                        end
                        
                        % PROMPT TO KEEP CHOOSING POINTS UNTIL A MISS
                        P2PR=ceil(10*rand);
                        P2PC=ceil(10*rand);
                        
                        % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
                        while SB2(P2PR,P2PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN COMPUTER HAS ALREADY PICKED THAT POINT
                            P2PR=ceil(10*rand); % PROMPT COMPUTER TO PICK AGAIN
                            P2PC=ceil(10*rand);
                        end
                    end
                    
                    % IF THE GAME IS OVER, STOP THE WHILE LOOP FROM CONTINUING
                    if gameover==1
                        break % THIS ONE IS TO STOP THE GAMEOVER LOOP
                    end

                    % IF COMPUTER MISSES A SHIP
                    if PB1(P2PR,P2PC)==0 % IF HE PICKS A POINT AND THERE IS NO SHIP

                        % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
                        while SB2(P2PR,P2PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN HE HAS ALREADY PICKED THAT POINT
                            P2PR=ceil(10*rand); % PROMPT COMPUTER TO PICK AGAIN
                            P2PC=ceil(10*rand);
                        end

                        SB2(P2PR,P2PC)=-1; % SET THE SECONDARY BOARD EQUAL TO -1 TO SHOW A MISS
                        fprintf('\nComputer missed your ships!\n\n')
                    end
                    
                elseif gameDifficulty==2 % PRO DIFFICULTY (CHOOSES POINTS AROUND IT)
                    P2PR=ceil(10*rand);
                    P2PC=ceil(10*rand);
                    
                    % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
                    while SB2(P2PR,P2PC)~=0 
                        P2PR=ceil(10*rand); 
                        P2PC=ceil(10*rand);
                    end
                    
                    % IF COMPUTER HITS A SHIP
                    while PB1(P2PR,P2PC)==1 || PB1(P2PR,P2PC)==2 || PB1(P2PR,P2PC)==3 || PB1(P2PR,P2PC)==4 || PB1(P2PR,P2PC)==5
                        
                        % HIT COUNTER AND SUNK SHIP
                        if PB1(P2PR,P2PC)==1
                            HCA1(1,5)=HCA1(1,5)+1;
                            if HCA1(1,5)==3 % IF EVERY POINT HAS BEEN HIT, THE SHIP IS SUNK
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer sunk your submarine\n\n') 
                            else
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer got a hit\n\n') 
                            end
                        elseif PB1(P2PR,P2PC)==2
                            HCA1(1,4)=HCA1(1,4)+1;
                            if HCA1(1,4)==2
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer sunk your patrol boat\n\n') 
                            else
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1)
                                fprintf('\nComputer got a hit\n\n')
                            end
                        elseif PB1(P2PR,P2PC)==3
                            HCA1(1,3)=HCA1(1,3)+1;
                            if HCA1(1,3)==3
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1)
                                fprintf('\nComputer sunk your destroyer\n\n')
                            else
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer got a hit\n\n') 
                            end
                        elseif PB1(P2PR,P2PC)==4 
                            HCA1(1,2)=HCA1(1,2)+1;
                            if HCA1(1,2)==4
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer sunk your battleship\n\n')
                            else
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1)
                                fprintf('\nComputer got a hit\n\n') 
                            end
                        elseif PB1(P2PR,P2PC)==5 
                            HCA1(1,1)=HCA1(1,1)+1; 
                            if HCA1(1,1)==5
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer sunk your carrier\n\n') 
                            else
                                PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                                SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                                disp(PB1) 
                                fprintf('\nComputer got a hit\n\n') 
                            end
                        end
                        
                        % IF THE SUM OF THE HIT COUNTER ARRAY EQUALS 17 END THE GAME
                        if sum(HCA1,2)==17
                            gameover=1;
                            fprintf('\nComputer wins! Better luck next time!\n\n')
                        end
                        
                        % IF THE GAME IS OVER, STOP THE WHILE LOOP FROM CONTINUING
                        if gameover==1
                            break % I PUT THIS HERE SO IT WILL STOP THE PROMPT TO KEEP CHOOSING
                        end
                                                
                        % PROMPT TO PICK UNTIL A MISS
                        while PB1(P2PR,P2PC)~=0
                            RNG=ceil(4*rand);
                            if RNG==1 
                                P2PC=P2PC+1;
                                    while P2PC>10
                                        P2PC=P2PC-2;
                                        if P2PC>10 || P2PC<1
                                            P2PR=ceil(10*rand); 
                                            P2PC=ceil(10*rand);
                                        end
                                    end
                            elseif RNG==2 
                                P2PR=P2PR+1;
                                    while P2PR>10
                                        P2PR=P2PR-2;
                                        if P2PR>10 || P2PR<1
                                            P2PR=ceil(10*rand); 
                                            P2PC=ceil(10*rand);
                                        end
                                    end
                            elseif RNG==3 
                                P2PR=P2PR-1;
                                    while P2PR<1
                                        P2PR=P2PR+2;
                                        if P2PR>10 || P2PR<1
                                            P2PR=ceil(10*rand); 
                                            P2PC=ceil(10*rand);
                                        end
                                    end
                            elseif RNG==4 
                                P2PC=P2PC-1;
                                    while P2PC<1
                                        P2PC=P2PC+2;
                                        if P2PC>10 || P2PC<1
                                            P2PR=ceil(10*rand); 
                                            P2PC=ceil(10*rand);
                                        end
                                    end
                            end
                        end
                        
                        % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
                        while SB2(P2PR,P2PC)~=0 % IF THE POINT WAS ALREADY PICKED, JUST HAVE THEM RANDOMLY PICK
                            P2PR=ceil(10*rand); 
                            P2PC=ceil(10*rand);
                        end
                    end
                    
                    % IF THE SUM OF THE HIT COUNTER ARRAY EQUALS 17 END THE GAME
                    if sum(HCA1,2)==17
                        gameover=1;
                        fprintf('\nComputer wins! Better luck next time!\n\n')
                    end
                        
                    % IF THE GAME IS OVER, STOP THE WHILE LOOP FROM CONTINUING
                    if gameover==1
                        break % I PUT THIS HERE SO IT WILL STOP THE PROMPT TO KEEP CHOOSING
                    end

                    % IF COMPUTER MISSES A SHIP
                    if PB1(P2PR,P2PC)==0 % IF HE PICKS A POINT AND THERE IS NO SHIP

                        % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
                        while SB2(P2PR,P2PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN HE HAS ALREADY PICKED THAT POINT
                            P2PR=ceil(10*rand); % PROMPT COMPUTER TO PICK AGAIN
                            P2PC=ceil(10*rand);
                        end

                        SB2(P2PR,P2PC)=-1; % SET THE SECONDARY BOARD EQUAL TO -1 TO SHOW A MISS
                        fprintf('\nComputer missed your ships!\n\n')
                    end
                    
                elseif gameDifficulty==3 % GOD MODE DIFFICULTY (INSTA KILL)
                    P2PR=ceil(10*rand);
                    P2PC=ceil(10*rand);
                    
                    % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
                    while SB2(P2PR,P2PC)~=0 
                        P2PR=ceil(10*rand); 
                        P2PC=ceil(10*rand);
                    end
                    
                    % IF COMPUTER HITS A SHIP
                    while PB1(P2PR,P2PC)==1 || PB1(P2PR,P2PC)==2 || PB1(P2PR,P2PC)==3 || PB1(P2PR,P2PC)==4 || PB1(P2PR,P2PC)==5
                        
                        % GET VARIABLE TO EQUAL SHIP THAT WAS HIT
                        x=PB1(P2PR,P2PC);
                        
                        % HIT COUNTER AND SUNK SHIP
                        if PB1(P2PR,P2PC)==1
                            HCA1(1,5)=HCA1(1,5)+1;
                            if HCA1(1,5)==3 % IF EVERY POINT HAS BEEN HIT, THE SHIP IS SUNK
                                disp(PB1) 
                                fprintf('\nComputer sunk your submarine\n\n') 
                            else
                                disp(PB1) 
                                fprintf('\nComputer got a hit\n\n') 
                            end
                        elseif PB1(P2PR,P2PC)==2
                            HCA1(1,4)=HCA1(1,4)+1;
                            if HCA1(1,4)==2
                                disp(PB1) 
                                fprintf('\nComputer sunk your patrol boat\n\n') 
                            else
                                disp(PB1)
                                fprintf('\nComputer got a hit\n\n')
                            end
                        elseif PB1(P2PR,P2PC)==3
                            HCA1(1,3)=HCA1(1,3)+1;
                            if HCA1(1,3)==3
                                disp(PB1)
                                fprintf('\nComputer sunk your destroyer\n\n')
                            else
                                disp(PB1) 
                                fprintf('\nComputer got a hit\n\n') 
                            end
                        elseif PB1(P2PR,P2PC)==4 
                            HCA1(1,2)=HCA1(1,2)+1;
                            if HCA1(1,2)==4
                                disp(PB1) 
                                fprintf('\nComputer sunk your battleship\n\n')
                            else
                                disp(PB1)
                                fprintf('\nComputer got a hit\n\n') 
                            end
                        elseif PB1(P2PR,P2PC)==5 
                            HCA1(1,1)=HCA1(1,1)+1; 
                            if HCA1(1,1)==5
                                disp(PB1) 
                                fprintf('\nComputer sunk your carrier\n\n') 
                            else
                                disp(PB1) 
                                fprintf('\nComputer got a hit\n\n') 
                            end
                        end
                        
                        % CHANGE VALUES OF PB1 AND SB2
                        PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP (OR SHOW IT HAS BEEN HIT?)
                        SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                            
                        % IF THE SUM OF THE HIT COUNTER ARRAY EQUALS 17 END THE GAME
                        if sum(HCA1,2)==17
                            gameover=1;
                            fprintf('\nComputer wins! Better luck next time!\n\n')
                        end
                        
                        % IF THE GAME IS OVER, STOP THE WHILE LOOP FROM CONTINUING
                        if gameover==1
                            break % I PUT THIS HERE SO IT WILL STOP THE PROMPT TO KEEP CHOOSING
                        end
                        
                        % INSTA KILL THE SHIP
                        for k=1:10
                            for h=1:10
                                if PB1(k,h)==x
                                    if x==1
                                        HCA1(1,5)=HCA1(1,5)+1;
                                        PB1(k,h)=9;
                                        if HCA1(1,5)==3
                                            disp(PB1) 
                                            fprintf('\nComputer sunk your submarine\n\n')
                                        else
                                            disp(PB1) 
                                            fprintf('\nComputer got a hit\n\n')
                                        end
                                    elseif x==2
                                        HCA1(1,4)=HCA1(1,4)+1;
                                        PB1(k,h)=9;
                                        if HCA1(1,4)==2
                                            disp(PB1) 
                                            fprintf('\nComputer sunk your patrol boat\n\n')
                                        else
                                            disp(PB1) 
                                            fprintf('\nComputer got a hit\n\n')
                                        end
                                    elseif x==3
                                        HCA1(1,3)=HCA1(1,3)+1;
                                        PB1(k,h)=9;
                                        if HCA1(1,3)==3
                                            disp(PB1) 
                                            fprintf('\nComputer sunk your destroyer\n\n')
                                        else
                                            disp(PB1) 
                                            fprintf('\nComputer got a hit\n\n')
                                        end
                                    elseif x==4
                                        HCA1(1,2)=HCA1(1,2)+1;
                                        PB1(k,h)=9;
                                        if HCA1(1,2)==4
                                            disp(PB1) 
                                            fprintf('\nComputer sunk your battleship\n\n')
                                        else
                                            disp(PB1) 
                                            fprintf('\nComputer got a hit\n\n')
                                        end
                                    elseif x==5
                                        HCA1(1,1)=HCA1(1,1)+1; 
                                        PB1(k,h)=9;
                                        if HCA1(1,1)==5
                                            disp(PB1) 
                                            fprintf('\nComputer sunk your carrier\n\n') 
                                        else
                                            disp(PB1) 
                                            fprintf('\nComputer got a hit\n\n')
                                        end
                                    end
                                    SB2(k,h)=1; % MAKES SURE EVERY POINT THEY INSTA KILL IS COVERED FOR ON SB2 (IS THIS CORRECT?)
                                end
                            end
                        end    
                        
                        % PROMPT TO PICK UNTIL MISS
                        P2PR=ceil(10*rand);
                        P2PC=ceil(10*rand);
                        
                        % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
                        while SB2(P2PR,P2PC)~=0 
                            P2PR=ceil(10*rand); 
                            P2PC=ceil(10*rand);
                        end
                    end
                    
                    % IF THE SUM OF THE HIT COUNTER ARRAY EQUALS 17 END THE GAME
                    if sum(HCA1,2)==17
                        gameover=1;
                        fprintf('\nComputer wins! Better luck next time!\n\n')
                    end

                    % IF THE GAME IS OVER, STOP THE WHILE LOOP FROM CONTINUING
                    if gameover==1
                        break
                    end

                    % IF COMPUTER MISSES A SHIP
                    if PB1(P2PR,P2PC)==0 % IF HE PICKS A POINT AND THERE IS NO SHIP

                        % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
                        while SB2(P2PR,P2PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN HE HAS ALREADY PICKED THAT POINT
                            P2PR=ceil(10*rand); % PROMPT COMPUTER TO PICK AGAIN
                            P2PC=ceil(10*rand);
                        end

                        SB2(P2PR,P2PC)=-1; % SET THE SECONDARY BOARD EQUAL TO -1 TO SHOW A MISS
                        fprintf('\nComputer missed your ships!\n\n')
                    end
                end % if gameDifficulty==1
            end % while gameover==0
        else 
            % DISPLAY RULES FOR 2 PLAYER
            fprintf('\nYou have chose to play against another player. \nTake turns choosing points on your opponents 10x10 board \nin hopes of hitting a part of the ship. \nIf you hit every part of the ship it will be sunk and \nyou will continue picking points until you sink all ships. \nThe first player to sink all opponent ships wins. \n\nGoodluck, Have fun! \n\n')
            
            % CREATE THE PRIMARY BOARD FOR PLAYER 1
            PB1=zeros(10:10);



            % CARRIER



            % ASK PLAYER 1 FOR HORIZONTAL OR VERTICAL AXIS 
            CA1=input('Specify whether you would like your carrier to be horizontal(1) or vertical(2): '); % carrier axis player one
            while CA1~=1 && CA1~=2
                CA1=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 1 TO ASSIGN LOCATION FOR CARRIER
            CR1=input('Specify what row you would like to place the carrier: '); % carrier row player one
                while CR1~=1 && CR1~=2 && CR1~=3 && CR1~=4 && CR1~=5 && CR1~=6 && CR1~=7 && CR1~=8 && CR1~=9 && CR1~=10 
                    CR1=input('Please select a number between 1-10: ');
                end
            CC1=input('Specify what column you would like to place the carrier: '); % carrier column player one
                while CC1~=1 && CC1~=2 && CC1~=3 && CC1~=4 && CC1~=5 && CC1~=6 && CC1~=7 && CC1~=8 && CC1~=9 && CC1~=10 
                    CC1=input('Please select a number between 1-10: ');
                end

            % VERIFY THAT THE POINT IS VALID
            if CA1==1
                while CC1>6 || CC1<=0 || mod(CC1,1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    CR1=input('Try a row integer that is between 1 and 6: ');
                    CC1=input('Try a column integer that is between 1 and 6: ');   
                end
            else
                while CR1>6 || CR1<=0 || mod(CR1,1)~=0 
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    CR1=input('Try a row integer that is between 1 and 6: ');
                    CC1=input('Try a column integer that is between 1 and 6: ');   
                end
            end

            % DEPENDING ON WHAT THEY CHOOSE, PLACE THE REST OF THE POINTS
            if CA1==1
                PB1(CR1,CC1)=5;
                PB1(CR1,CC1+1)=5;
                PB1(CR1,CC1+2)=5;
                PB1(CR1,CC1+3)=5;
                PB1(CR1,CC1+4)=5;
            else 
                PB1(CR1,CC1)=5;
                PB1(CR1+1,CC1)=5;
                PB1(CR1+2,CC1)=5;
                PB1(CR1+3,CC1)=5;
                PB1(CR1+4,CC1)=5; 
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT          
            disp(PB1)
            fprintf('Your carrier has been placed \n\n')



            % BATTLESHIP



            % HORIZONTAL OR VERTICAL AXIS
            BA1=input('Specify whether you would like your battleship to be horizontal(1) or vertical(2): '); % battleship axis player one
            while BA1~=1 && BA1~=2
                BA1=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 1 TO ASSIGN LOCATION FOR BATTLESHIP
            BR1=input('Specify what row you would like to place the battleship: '); % battleship row player one
                while BR1~=1 && BR1~=2 && BR1~=3 && BR1~=4 && BR1~=5 && BR1~=6 && BR1~=7 && BR1~=8 && BR1~=9 && BR1~=10 
                    BR1=input('Please select a number between 1-10: ');
                end
            BC1=input('Specify what column you would like to place the battleship: '); % battleship column player one
                while BC1~=1 && BC1~=2 && BC1~=3 && BC1~=4 && BC1~=5 && BC1~=6 && BC1~=7 && BC1~=8 && BC1~=9 && BC1~=10 
                    BC1=input('Please select a number between 1-10: ');
                end

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if BA1==1
                while BC1>7 || BC1<=0 || mod(BC1,1)~=0 || PB1(BR1,BC1)~=0 || PB1(BR1,BC1+1)~=0 || PB1(BR1,BC1+2)~=0 || PB1(BR1,BC1+3)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    BR1=input('Try a row integer that is between 1 and 7: ');
                    BC1=input('Try a column integer that is between 1 and 7: ');   
                end
                PB1(BR1,BC1)=4;
                PB1(BR1,BC1+1)=4;
                PB1(BR1,BC1+2)=4;
                PB1(BR1,BC1+3)=4;
            else
                while BR1>7 || BR1<=0 || mod(BR1,1)~=0 || PB1(BR1,BC1)~=0 || PB1(BR1+1,BC1)~=0 || PB1(BR1+2,BC1)~=0 || PB1(BR1+3,BC1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    BR1=input('Try a row integer that is between 1 and 7: ');
                    BC1=input('Try a column integer that is between 1 and 7: ');   
                end
                PB1(BR1,BC1)=4;
                PB1(BR1+1,BC1)=4;
                PB1(BR1+2,BC1)=4;
                PB1(BR1+3,BC1)=4;
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT          
            disp(PB1)
            fprintf('Your battleship has been placed \n\n')



            % DESTROYER



            % HORIZONTAL OR VERTICAL AXIS
            DA1=input('Specify whether you would like your destroyer to be horizontal(1) or vertical(2): '); % destroyer axis player one
            while DA1~=1 && DA1~=2
                DA1=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 1 TO ASSIGN LOCATION FOR DESTROYER
            DR1=input('Specify what row you would like to place the destroyer: '); % destroyer row player one
                while DR1~=1 && DR1~=2 && DR1~=3 && DR1~=4 && DR1~=5 && DR1~=6 && DR1~=7 && DR1~=8 && DR1~=9 && DR1~=10 
                    DR1=input('Please select a number between 1-10: ');
                end
            DC1=input('Specify what column you would like to place the destroyer: '); % destroyer column player one
                while DC1~=1 && DC1~=2 && DC1~=3 && DC1~=4 && DC1~=5 && DC1~=6 && DC1~=7 && DC1~=8 && DC1~=9 && DC1~=10 
                    DC1=input('Please select a number between 1-10: ');
                end

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if DA1==1
                while DC1>8 || DC1<0 || mod(DC1,1)~=0 || PB1(DR1,DC1)~=0 || PB1(DR1,DC1+1)~=0 || PB1(DR1,DC1+2)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    DR1=input('Try a row integer that is between 1 and 8: ');
                    DC1=input('Try a column integer that is between 1 and 8: ');   
                end
                PB1(DR1,DC1)=3;
                PB1(DR1,DC1+1)=3;
                PB1(DR1,DC1+2)=3;
            else
                while DR1>8 || DR1<0 || mod(DR1,1)~=0 || PB1(DR1,DC1)~=0 || PB1(DR1+1,DC1)~=0 || PB1(DR1+2,DC1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    DR1=input('Try a row integer that is between 1 and 8: ');
                    DC1=input('Try a column integer that is between 1 and 8: ');   
                end
                PB1(DR1,DC1)=3;
                PB1(DR1+1,DC1)=3;
                PB1(DR1+2,DC1)=3;
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT          
            disp(PB1)
            fprintf('Your destroyer has been placed \n\n')



            % SUBMARINE



            % HORIZONTAL OR VERTICAL AXIS
            SA1=input('Specify whether you would like your submarine to be horizontal(1) or vertical(2): '); % submarine axis player one
            while SA1~=1 && SA1~=2
                SA1=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 1 TO ASSIGN LOCATION FOR SUBMARINE
            SR1=input('Specify what row you would like to place the submarine: '); % submarine row player one
                while SR1~=1 && SR1~=2 && SR1~=3 && SR1~=4 && SR1~=5 && SR1~=6 && SR1~=7 && SR1~=8 && SR1~=9 && SR1~=10 
                    SR1=input('Please select a number between 1-10: ');
                end
            SC1=input('Specify what column you would like to place the submarine: '); % submarine column player one
                while SC1~=1 && SC1~=2 && SC1~=3 && SC1~=4 && SC1~=5 && SC1~=6 && SC1~=7 && SC1~=8 && SC1~=9 && SC1~=10 
                    SC1=input('Please select a number between 1-10: ');
                end

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if SA1==1
                while SC1>8 || SC1<0 || mod(SC1,1)~=0 || PB1(SR1,SC1)~=0 || PB1(SR1,SC1+1)~=0 || PB1(SR1,SC1+2)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    SR1=input('Try a row integer that is between 1 and 8: ');
                    SC1=input('Try a column integer that is between 1 and 8: ');   
                end
                PB1(SR1,SC1)=1;
                PB1(SR1,SC1+1)=1;
                PB1(SR1,SC1+2)=1;
            else
                while SR1>8 || SR1<0 || mod(SR1,1)~=0 || PB1(SR1,SC1)~=0 || PB1(SR1+1,SC1)~=0 || PB1(SR1+2,SC1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    SR1=input('Try a row integer that is between 1 and 8: ');
                    SC1=input('Try a column integer that is between 1 and 8: ');   
                end
                PB1(SR1,SC1)=1;
                PB1(SR1+1,SC1)=1;
                PB1(SR1+2,SC1)=1;
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT
            disp(PB1)
            fprintf('Your submarine has been placed \n\n')



            % PATROL BOAT



            % HORIZONTAL OR VERTICAL AXIS
            PA1=input('Specify whether you would like your patrol boat to be horizontal(1) or vertical(2): '); % patrol boat axis player one
            while PA1~=1 && PA1~=2
                PA1=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 1 TO ASSIGN LOCATION FOR PATROL BOAT
            PR1=input('Specify what row you would like to place the patrol boat: '); % patrol boat row player one
                while PR1~=1 && PR1~=2 && PR1~=3 && PR1~=4 && PR1~=5 && PR1~=6 && PR1~=7 && PR1~=8 && PR1~=9 && PR1~=10 
                    PR1=input('Please select a number between 1-10: ');
                end
            PC1=input('Specify what column you would like to place the patrol boat: '); % patrol boat column player one
                while PC1~=1 && PC1~=2 && PC1~=3 && PC1~=4 && PC1~=5 && PC1~=6 && PC1~=7 && PC1~=8 && PC1~=9 && PC1~=10 
                    PC1=input('Please select a number between 1-10: ');
                end

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if PA1==1
                while PC1>9 || PC1<0 || mod(PC1,1)~=0 || PB1(PR1,PC1)~=0 || PB1(PR1,PC1+1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    PR1=input('Try a row integer that is between 1 and 9: ');
                    PC1=input('Try a column integer that is between 1 and 9: ');   
                end
                PB1(PR1,PC1)=2;
                PB1(PR1,PC1+1)=2;
            else
                while PR1>9 || PR1<0 || mod(PR1,1)~=0 || PB1(PR1,PC1)~=0 || PB1(PR1+1,PC1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    PR1=input('Try a row integer that is between 1 and 9: ');
                    PC1=input('Try a column integer that is between 1 and 9: ');   
                end
                PB1(PR1,PC1)=2;
                PB1(PR1+1,PC1)=2;
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT          
            disp(PB1)
            fprintf('Your patrol boat has been placed \n\n')
            
            % CLEAR THE BOARD SO PLAYER 2 CAN PLACE SHIPS
            clc;

            % SWITCH TO PLAYER 2 SO HE CAN PICK HIS SHIP PLACEMENT
            fprintf('Now that player 1 has finished placing his ships, it is your turn player 2!\n\n')

            % CREATE THE PRIMARY BOARD FOR PLAYER 2
            PB2=zeros(10:10);



            % CARRIER



            % ASK PLAYER 2 FOR HORIZONTAL OR VERTICAL AXIS 
            CA2=input('Specify whether you would like your carrier to be horizontal(1) or vertical(2): '); % carrier axis player two
            while CA2~=1 && CA2~=2
                CA2=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 2 TO ASSIGN LOCATION FOR CARRIER
            CR2=input('Specify what row you would like to place the carrier: '); % carrier row player one
                while CR2~=1 && CR2~=2 && CR2~=3 && CR2~=4 && CR2~=5 && CR2~=6 && CR2~=7 && CR2~=8 && CR2~=9 && CR2~=10 
                    CR2=input('Please select a number between 1-10: ');
                end
            CC2=input('Specify what column you would like to place the carrier: '); % carrier column player one
                while CC2~=1 && CC2~=2 && CC2~=3 && CC2~=4 && CC2~=5 && CC2~=6 && CC2~=7 && CC2~=8 && CC2~=9 && CC2~=10 
                    CC2=input('Please select a number between 1-10: ');
                end

            % VERIFY THAT THE POINT IS VALID
            if CA2==1
                while CC2>6 || CC2<=0 || mod(CC2,1)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    CR2=input('Try a row integer that is between 1 and 6: ');
                    CC2=input('Try a column integer that is between 1 and 6: ');   
                end
            else
                while CR2>6 || CR2<=0 || mod(CR2,1)~=0 
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    CR2=input('Try a row integer that is between 1 and 6: ');
                    CC2=input('Try a column integer that is between 1 and 6: ');   
                end
            end

            % DEPENDING ON WHAT THEY CHOOSE, PLACE THE REST OF THE POINTS
            if CA2==1
                PB2(CR2,CC2)=5;
                PB2(CR2,CC2+1)=5;
                PB2(CR2,CC2+2)=5;
                PB2(CR2,CC2+3)=5;
                PB2(CR2,CC2+4)=5;
            else 
                PB2(CR2,CC2)=5;
                PB2(CR2+1,CC2)=5;
                PB2(CR2+2,CC2)=5;
                PB2(CR2+3,CC2)=5;
                PB2(CR2+4,CC2)=5; 
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT          
            disp(PB2)
            fprintf('Your carrier has been placed \n\n')



            % BATTLESHIP



            % HORIZONTAL OR VERTICAL AXIS
            BA2=input('Specify whether you would like your battleship to be horizontal(1) or vertical(2): '); % battleship axis player two
            while BA2~=1 && BA2~=2
                BA2=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 2 TO ASSIGN LOCATION FOR BATTLESHIP
            BR2=input('Specify what row you would like to place the battleship: '); % battleship row player two
                while BR2~=1 && BR2~=2 && BR2~=3 && BR2~=4 && BR2~=5 && BR2~=6 && BR2~=7 && BR2~=8 && BR2~=9 && BR2~=10 
                    BR2=input('Please select a number between 1-10: ');
                end
            BC2=input('Specify what column you would like to place the battleship: '); % battleship column player two
                while BC2~=1 && BC2~=2 && BC2~=3 && BC2~=4 && BC2~=5 && BC2~=6 && BC2~=7 && BC2~=8 && BC2~=9 && BC2~=10 
                    BC2=input('Please select a number between 1-10: ');
                end

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if BA2==1
                while BC2>7 || BC2<=0 || mod(BC2,1)~=0 || PB2(BR2,BC2)~=0 || PB2(BR2,BC2+1)~=0 || PB2(BR2,BC2+2)~=0 || PB2(BR2,BC2+3)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    BR2=input('Try a row integer that is between 1 and 7: ');
                    BC2=input('Try a column integer that is between 1 and 7: ');   
                end
                PB2(BR2,BC2)=4;
                PB2(BR2,BC2+1)=4;
                PB2(BR2,BC2+2)=4;
                PB2(BR2,BC2+3)=4;
            else
                while BR2>7 || BR2<=0 || mod(BR2,1)~=0 || PB2(BR2,BC2)~=0 || PB2(BR2+1,BC2)~=0 || PB2(BR2+2,BC2)~=0 || PB2(BR2+3,BC2)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    BR2=input('Try a row integer that is between 1 and 7: ');
                    BC2=input('Try a column integer that is between 1 and 7: ');                
                end
                PB2(BR2,BC2)=4;
                PB2(BR2+1,BC2)=4;
                PB2(BR2+2,BC2)=4;
                PB2(BR2+3,BC2)=4;
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT          
            disp(PB2)
            fprintf('Your battleship has been placed \n\n')



            % DESTROYER



            % HORIZONTAL OR VERTICAL AXIS
            DA2=input('Specify whether you would like your destroyer to be horizontal(1) or vertical(2): '); % destroyer axis player two
            while DA2~=1 && DA2~=2
                DA2=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 2 TO ASSIGN LOCATION FOR DESTROYER
            DR2=input('Specify what row you would like to place the destroyer: '); % destroyer row player two
                while DR2~=1 && DR2~=2 && DR2~=3 && DR2~=4 && DR2~=5 && DR2~=6 && DR2~=7 && DR2~=8 && DR2~=9 && DR2~=10 
                    DR2=input('Please select a number between 1-10: ');
                end
            DC2=input('Specify what column you would like to place the destroyer: '); % destroyer column player two
                while DC2~=1 && DC2~=2 && DC2~=3 && DC2~=4 && DC2~=5 && DC2~=6 && DC2~=7 && DC2~=8 && DC2~=9 && DC2~=10 
                    DC2=input('Please select a number between 1-10: ');
                end

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if DA2==1
                while DC2>8 || DC2<0 || mod(DC2,1)~=0 || PB2(DR2,DC2)~=0 || PB2(DR2,DC2+1)~=0 || PB2(DR2,DC2+2)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    DR2=input('Try a row integer that is between 1 and 8: ');
                    DC2=input('Try a column integer that is between 1 and 8: ');
                end
                PB2(DR2,DC2)=3;
                PB2(DR2,DC2+1)=3;
                PB2(DR2,DC2+2)=3;
            else
                while DR2>8 || DR2<0 || mod(DR2,1)~=0 || PB2(DR2,DC2)~=0 || PB2(DR2+1,DC2)~=0 || PB2(DR2+2,DC2)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    DR2=input('Try a row integer that is between 1 and 8: ');
                    DC2=input('Try a column integer that is between 1 and 8: ');                
                end
                PB2(DR2,DC2)=3;
                PB2(DR2+1,DC2)=3;
                PB2(DR2+2,DC2)=3;
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT          
            disp(PB2)
            fprintf('Your destroyer has been placed \n\n')



            % SUBMARINE



            % HORIZONTAL OR VERTICAL AXIS
            SA2=input('Specify whether you would like your submarine to be horizontal(1) or vertical(2): '); % submarine axis player two
            while SA2~=1 && SA2~=2
                SA2=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 2 TO ASSIGN LOCATION FOR SUBMARINE
            SR2=input('Specify what row you would like to place the submarine: '); % submarine row player two
                while SR2~=1 && SR2~=2 && SR2~=3 && SR2~=4 && SR2~=5 && SR2~=6 && SR2~=7 && SR2~=8 && SR2~=9 && SR2~=10 
                    SR2=input('Please select a number between 1-10: ');
                end
            SC2=input('Specify what column you would like to place the submarine: '); % submarine column player two
                while SC2~=1 && SC2~=2 && SC2~=3 && SC2~=4 && SC2~=5 && SC2~=6 && SC2~=7 && SC2~=8 && SC2~=9 && SC2~=10 
                    SC2=input('Please select a number between 1-10: ');
                end

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if SA2==1
                while SC2>8 || SC2<0 || mod(SC2,1)~=0 || PB2(SR2,SC2)~=0 || PB2(SR2,SC2+1)~=0 || PB2(SR2,SC2+2)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    SR2=input('Try a row integer that is between 1 and 8: ');
                    SC2=input('Try a column integer that is between 1 and 8: ');
                end
                PB2(SR2,SC2)=1;
                PB2(SR2,SC2+1)=1;
                PB2(SR2,SC2+2)=1;
            else
                while SR2>8 || SR2<0 || mod(SR2,1)~=0 || PB2(SR2,SC2)~=0 || PB2(SR2+1,SC2)~=0 || PB2(SR2+2,SC2)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    SR2=input('Try a row integer that is between 1 and 8: ');
                    SC2=input('Try a column integer that is between 1 and 8: ');
                end
                PB2(SR2,SC2)=1;
                PB2(SR2+1,SC2)=1;
                PB2(SR2+2,SC2)=1;
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT
            disp(PB2)
            fprintf('Your submarine has been placed \n\n')



            % PATROL BOAT



            % HORIZONTAL OR VERTICAL AXIS
            PA2=input('Specify whether you would like your patrol boat to be horizontal(1) or vertical(2): '); % patrol boat axis player two
            while PA2~=1 && PA2~=2
                PA2=input('Please select either 1 or 2: ');
            end

            % ASK PLAYER 2 TO ASSIGN LOCATION FOR PATROL BOAT
            PR2=input('Specify what row you would like to place the patrol boat: '); % patrol boat row player two
                while PR2~=1 && PR2~=2 && PR2~=3 && PR2~=4 && PR2~=5 && PR2~=6 && PR2~=7 && PR2~=8 && PR2~=9 && PR2~=10 
                    PR2=input('Please select a number between 1-10: ');
                end
            PC2=input('Specify what column you would like to place the patrol boat: '); % patrol boat column player two
                while PC2~=1 && PC2~=2 && PC2~=3 && PC2~=4 && PC2~=5 && PC2~=6 && PC2~=7 && PC2~=8 && PC2~=9 && PC2~=10 
                    PC2=input('Please select a number between 1-10: ');
                end

            % CHECK TO MAKE SURE THE POINTS WILL FIT ON THE BOARD AND IF ANY POINTS OVERLAP
            if PA2==1
                while PC2>9 || PC2<0 || mod(PC2,1)~=0 || PB2(PR2,PC2)~=0 || PB2(PR2,PC2+1)~=0 
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    PR2=input('Try a row integer that is between 1 and 9: ');
                    PC2=input('Try a column integer that is between 1 and 9: ');
                end
                PB2(PR2,PC2)=2;
                PB2(PR2,PC2+1)=2;
            else
                while PR2>9 || PR2<0 || mod(PR2,1)~=0 || PB2(PR2,PC2)~=0 || PB2(PR2+1,PC2)~=0
                    fprintf('\nThis ship cannot fit in the location you have chosen.\n\n')
                    PR2=input('Try a row integer that is between 1 and 9: ');
                    PC2=input('Try a column integer that is between 1 and 9: ');
                end
                PB2(PR2,PC2)=2;
                PB2(PR2+1,PC2)=2;
            end

            % DISPLAY THE BOARD AFTER EACH SHIP PLACEMENT          
            disp(PB2)
            fprintf('Your patrol boat has been placed \n\n')

            % CLEAR THE SCREEN SO BOTH PLAYERS CAN START PICKING LOCATIONS OF SHIPS
            clc;

            % CREATE SECONDARY BOARD FOR PLAYER 1 AND 2 
            SB1=zeros(10:10);
            SB2=zeros(10:10);

        % HIT COUNTER ARRAY
        HCA1=[0,0,0,0,0];
        HCA2=[0,0,0,0,0];
        % 5,4,3,2,1 (5=CARRIER, 4=BATTLESHIP, 3=DESTROYER, 2=PATROL BOAT, 1=SUBMARINE)
        
    % CREATE A WHILE LOOP SO THIS GOES ON UNTIL THE GAME IS OVER
    gameover=0;
    while gameover==0

        % TELL PLAYER 1 TO PICK A POINT
        fprintf('\nIT IS YOUR TURN PLAYER 1\n\n')
        P1PR=input('Pick a row you think one of the opponents ship is on: '); % PLAYER ONE POINT ROW
            while P1PR~=1 && P1PR~=2 && P1PR~=3 && P1PR~=4 && P1PR~=5 && P1PR~=6 && P1PR~=7 && P1PR~=8 && P1PR~=9 && P1PR~=10 % MAKE SURE IT IS A VALID POINT
                P1PR=input('Please select an integer between 1-10: ');
            end
        P1PC=input('Pick a column you think one of the opponents ship is on: '); % PLAYER ONE POINT COLUMN
            while P1PC~=1 && P1PC~=2 && P1PC~=3 && P1PC~=4 && P1PC~=5 && P1PC~=6 && P1PC~=7 && P1PC~=8 && P1PC~=9 && P1PC~=10 % MAKE SURE IT IS A VALID POINT
                P1PC=input('Please select an integer between 1-10: ');
            end
       
        % CHECK IF THAT POINT HAS ALREADY BEEN PICKED 
        while SB1(P1PR,P1PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN HE HAS ALREADY PICKED THAT POINT
            fprintf('\nYou have already picked that point\n\n')
            P1PR=input('Pick a row you think one of the opponents ship is on: '); % PROMPT HIM TO PICK AGAIN
            while P1PR~=1 && P1PR~=2 && P1PR~=3 && P1PR~=4 && P1PR~=5 && P1PR~=6 && P1PR~=7 && P1PR~=8 && P1PR~=9 && P1PR~=10 
                P1PR=input('Please select an integer between 1-10: ');
            end
            P1PC=input('Pick a column you think one of the opponents ship is on: ');
            while P1PC~=1 && P1PC~=2 && P1PC~=3 && P1PC~=4 && P1PC~=5 && P1PC~=6 && P1PC~=7 && P1PC~=8 && P1PC~=9 && P1PC~=10 
                P1PC=input('Please select an integer between 1-10: ');
            end
        end
        
        % IF PLAYER HITS A SHIP 
        while PB2(P1PR,P1PC)==1 || PB2(P1PR,P1PC)==2 || PB2(P1PR,P1PC)==3 || PB2(P1PR,P1PC)==4 || PB2(P1PR,P1PC)==5  % IF HE PICKS A POINT AND A SHIP IS THERE

            % CHECKS WHICH SHIP IT HIT
            if PB2(P1PR,P1PC)==1 % I SET THE SUBMARINE POINTS TO ONE
                HCA2(1,5)=HCA2(1,5)+1;
                if HCA2(1,5)==3
                    PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB1)
                    fprintf('\nThe submarine has been sunk!\n\n')
                else
                    PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB1)
                    fprintf('\nHIT\n\n')
                end
            elseif PB2(P1PR,P1PC)==2 % I SET THE PATROL BOAT POINTS TO TWO
                HCA2(1,4)=HCA2(1,4)+1;
                if HCA2(1,4)==2
                    PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB1)
                    fprintf('\nThe patrol boat has been sunk!\n\n')
                else
                    PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB1)
                    fprintf('\nHIT\n\n')
                end
            elseif PB2(P1PR,P1PC)==3 % I SET THE DESTROYER POINTS TO THREE
                HCA2(1,3)=HCA2(1,3)+1;
                if HCA2(1,3)==3 
                    PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB1)
                    fprintf('\nThe destroyer has been sunk!\n\n')
                else
                    PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB1)
                    fprintf('\nHIT\n\n')
                end
            elseif PB2(P1PR,P1PC)==4 % I SET THE BATTLESHIP POINTS TO FOUR
                HCA2(1,2)=HCA2(1,2)+1;
                if HCA2(1,2)==4
                    PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB1)
                    fprintf('\nThe battleship has been sunk!\n\n')
                else
                    PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB1)
                    fprintf('\nHIT\n\n')
                end
            elseif PB2(P1PR,P1PC)==5 % I SET THE CARRIER POINTS TO FIVE
                HCA2(1,1)=HCA2(1,1)+1; 
                if HCA2(1,1)==5
                    PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB1)
                    fprintf('\nThe carrier has been sunk!\n\n')
                else
                    PB2(P1PR,P1PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB1(P1PR,P1PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB1)
                    fprintf('\nHIT\n\n')
                end
            end
            
            % IF THE SUM OF THE HIT COUNTER ARRAY EQUALS 17 END THE GAME
            if sum(HCA2,2)==17
                gameover=1;
                sound();
                fprintf('\nCongratulations player 1! YOU WON! You now have bragging rights over player 2 for the rest of your life!\n\n')
            end
            
            % IF THE GAME IS OVER, STOP THE WHILE LOOP FROM CONTINUING
            if gameover==1
                break
            end

            % PROMPT TO KEEP CHOOSING POINTS UNTIL A MISS
            P1PR=input('Pick a row you think one of the opponents ship is on: '); 
            while P1PR~=1 && P1PR~=2 && P1PR~=3 && P1PR~=4 && P1PR~=5 && P1PR~=6 && P1PR~=7 && P1PR~=8 && P1PR~=9 && P1PR~=10 
                P1PR=input('Please select an integer between 1-10: ');
            end
            P1PC=input('Pick a column you think one of the opponents ship is on: ');
            while P1PC~=1 && P1PC~=2 && P1PC~=3 && P1PC~=4 && P1PC~=5 && P1PC~=6 && P1PC~=7 && P1PC~=8 && P1PC~=9 && P1PC~=10 
                P1PC=input('Please select an integer between 1-10: ');
            end
            
            % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
            while SB1(P1PR,P1PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN HE HAS ALREADY PICKED THAT POINT
                fprintf('\nYou have already picked that point\n\n')
                P1PR=input('Pick a row you think one of the opponents ship is on: '); % PROMPT HIM TO PICK AGAIN
                while P1PR~=1 && P1PR~=2 && P1PR~=3 && P1PR~=4 && P1PR~=5 && P1PR~=6 && P1PR~=7 && P1PR~=8 && P1PR~=9 && P1PR~=10 
                    P1PR=input('Please select an integer between 1-10: ');
                end
                P1PC=input('Pick a column you think one of the opponents ship is on: ');
                while P1PC~=1 && P1PC~=2 && P1PC~=3 && P1PC~=4 && P1PC~=5 && P1PC~=6 && P1PC~=7 && P1PC~=8 && P1PC~=9 && P1PC~=10 
                    P1PC=input('Please select an integer between 1-10: ');
                end
            end
        end

        % IF PLAYER MISSES A SHIP
        if PB2(P1PR,P1PC)==0 % IF HE PICKS A POINT AND THERE IS NO SHIP

            % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
            while SB1(P1PR,P1PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN HE HAS ALREADY PICKED THAT POINT
                fprintf('\nYou have already picked that point\n\n')
                P1PR=input('Pick a row you think one of the opponents ship is on: '); % PROMPT HIM TO PICK AGAIN
                while P1PR~=1 && P1PR~=2 && P1PR~=3 && P1PR~=4 && P1PR~=5 && P1PR~=6 && P1PR~=7 && P1PR~=8 && P1PR~=9 && P1PR~=10 
                    P1PR=input('Please select an integer between 1-10: ');
                end
                P1PC=input('Pick a column you think one of the opponents ship is on: ');
                while P1PC~=1 && P1PC~=2 && P1PC~=3 && P1PC~=4 && P1PC~=5 && P1PC~=6 && P1PC~=7 && P1PC~=8 && P1PC~=9 && P1PC~=10 
                    P1PC=input('Please select an integer between 1-10: ');
                end
            end

            SB1(P1PR,P1PC)=-1; % SET THE SECONDARY BOARD EQUAL TO -1 TO SHOW A MISS
            fprintf('\nMISS!\n\n')
            disp(SB1)
        end    
        
        % TELL PLAYER 2 TO PICK A POINT
        if gameover==1
            break
        end
        fprintf('\nIT IS YOUR TURN PLAYER 2\n\n')
        P2PR=input('Pick a row you think one of the opponents ship is on: '); % PLAYER TWO POINT ROW
            while P2PR~=1 && P2PR~=2 && P2PR~=3 && P2PR~=4 && P2PR~=5 && P2PR~=6 && P2PR~=7 && P2PR~=8 && P2PR~=9 && P2PR~=10 % MAKE SURE IT IS A VALID POINT
                P2PR=input('Please select an integer between 1-10: ');
            end
        P2PC=input('Pick a column you think one of the opponents ship is on: '); % PLAYER TWO POINT COLUMN
            while P2PC~=1 && P2PC~=2 && P2PC~=3 && P2PC~=4 && P2PC~=5 && P2PC~=6 && P2PC~=7 && P2PC~=8 && P2PC~=9 && P2PC~=10 % MAKE SURE IT IS A VALID POINT
                P2PC=input('Please select an integer between 1-10: ');
            end
        
        % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
        while SB2(P2PR,P2PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN HE HAS ALREADY PICKED THAT POINT
            fprintf('\nYou have already picked that point\n\n')
            P2PR=input('Pick a row you think one of the opponents ship is on: '); % PROMPT HIM TO PICK AGAIN
            while P2PR~=1 && P2PR~=2 && P2PR~=3 && P2PR~=4 && P2PR~=5 && P2PR~=6 && P2PR~=7 && P2PR~=8 && P2PR~=9 && P2PR~=10 
                P2PR=input('Please select an integer between 1-10: ');
            end
            P2PC=input('Pick a column you think one of the opponents ship is on: ');
            while P2PC~=1 && P2PC~=2 && P2PC~=3 && P2PC~=4 && P2PC~=5 && P2PC~=6 && P2PC~=7 && P2PC~=8 && P2PC~=9 && P2PC~=10 
                P2PC=input('Please select an integer between 1-10: ');
            end
        end
        
        % IF PLAYER HITS A SHIP 
        while PB1(P2PR,P2PC)==1 || PB1(P2PR,P2PC)==2 || PB1(P2PR,P2PC)==3 || PB1(P2PR,P2PC)==4 || PB1(P2PR,P2PC)==5  % IF HE PICKS A POINT AND A SHIP IS THERE

            % CHECKS WHICH SHIP IT HIT
            if PB1(P2PR,P2PC)==1 % I SET THE SUBMARINE POINTS TO ONE
                HCA1(1,5)=HCA1(1,5)+1;
                if HCA1(1,5)==3
                    PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB2)
                    fprintf('\nThe submarine has been sunk!\n\n')
                else
                    PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB2)
                    fprintf('\nHIT\n\n')
                end
            elseif PB1(P2PR,P2PC)==2 % I SET THE PATROL BOAT POINTS TO TWO
                HCA1(1,4)=HCA1(1,4)+1;
                if HCA1(1,4)==2
                    PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB2)
                    fprintf('\nThe patrol boat has been sunk!\n\n')
                else
                    PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB2)
                    fprintf('\nHIT\n\n')
                end
            elseif PB1(P2PR,P2PC)==3 % I SET THE DESTROYER POINTS TO THREE
                HCA1(1,3)=HCA1(1,3)+1;
                if HCA1(1,3)==3
                    PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB2)
                    fprintf('\nThe destroyer has been sunk!\n\n')
                else
                    PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB2)
                    fprintf('\nHIT\n\n')
                end
            elseif PB1(P2PR,P2PC)==4 % I SET THE BATTLESHIP POINTS TO FOUR
                HCA1(1,2)=HCA1(1,2)+1; 
                if HCA1(1,2)==4
                    PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB2)
                    fprintf('\nThe battleship has been sunk!\n\n')
                else
                    PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB2)
                    fprintf('\nHIT\n\n')
                end
            elseif PB1(P2PR,P2PC)==5 % I SET THE CARRIER POINTS TO FIVE
                HCA1(1,1)=HCA1(1,1)+1; 
                if HCA1(1,1)==5
                    PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB2)
                    fprintf('\nThe carrier has been sunk!\n\n')
                else
                    PB1(P2PR,P2PC)=9; % SET THE OPPONENT'S PRIMARY BOARD TO 9 TO REMOVE THE SHIP
                    SB2(P2PR,P2PC)=1; % SETS PLAYER 1'S SECONDARY BOARD TO SHOW A HIT
                    disp(SB2)
                    fprintf('\nHIT\n\n')
                end
            end
            
            % IF THE SUM OF THE HIT COUNTER ARRAY EQUALS 17 END THE GAME
            if sum(HCA1,2)==17
                gameover=1;
                sound();
                fprintf('\nCongratulations player 2! YOU WON! You now have bragging rights over player 1 for the rest of your life!\n\n')
            end

            % IF THE GAME IS OVER, STOP THE WHILE LOOP FROM CONTINUING
            if gameover==1
                break
            end
            
            % PROMPT TO KEEP CHOOSING POINTS UNTIL A MISS
            P2PR=input('Pick a row you think one of the opponents ship is on: '); 
            while P2PR~=1 && P2PR~=2 && P2PR~=3 && P2PR~=4 && P2PR~=5 && P2PR~=6 && P2PR~=7 && P2PR~=8 && P2PR~=9 && P2PR~=10 
                P2PR=input('Please select an integer between 1-10: ');
            end
            P2PC=input('Pick a column you think one of the opponents ship is on: ');
            while P2PC~=1 && P2PC~=2 && P2PC~=3 && P2PC~=4 && P2PC~=5 && P2PC~=6 && P2PC~=7 && P2PC~=8 && P2PC~=9 && P2PC~=10 
                P2PC=input('Please select an integer between 1-10: ');
            end
            
            % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
            while SB2(P2PR,P2PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN HE HAS ALREADY PICKED THAT POINT
                fprintf('\nYou have already picked that point\n\n')
                P2PR=input('Pick a row you think one of the opponents ship is on: '); % PROMPT HIM TO PICK AGAIN
                while P2PR~=1 && P2PR~=2 && P2PR~=3 && P2PR~=4 && P2PR~=5 && P2PR~=6 && P2PR~=7 && P2PR~=8 && P2PR~=9 && P2PR~=10 
                    P2PR=input('Please select an integer between 1-10: ');
                end
                    P2PC=input('Pick a column you think one of the opponents ship is on: ');
                while P2PC~=1 && P2PC~=2 && P2PC~=3 && P2PC~=4 && P2PC~=5 && P2PC~=6 && P2PC~=7 && P2PC~=8 && P2PC~=9 && P2PC~=10 
                    P2PC=input('Please select an integer between 1-10: ');
                end
            end
        end

        % IF PLAYER MISSES A SHIP
        if PB1(P2PR,P2PC)==0 % IF HE PICKS A POINT AND THERE IS NO SHIP

            % CHECK IF THAT POINT HAS ALREADY BEEN PICKED
            while SB2(P2PR,P2PC)~=0 % IF THE SECONDARY POINT IS NOT EQUAL TO 0 THEN HE HAS ALREADY PICKED THAT POINT
                fprintf('\nYou have already picked that point\n\n')
                P2PR=input('Pick a row you think one of the opponents ship is on: '); % PROMPT HIM TO PICK AGAIN
                while P2PR~=1 && P2PR~=2 && P2PR~=3 && P2PR~=4 && P2PR~=5 && P2PR~=6 && P2PR~=7 && P2PR~=8 && P2PR~=9 && P2PR~=10 
                    P2PR=input('Please select an integer between 1-10: ');
                end
                P2PC=input('Pick a column you think one of the opponents ship is on: ');
                while P2PC~=1 && P2PC~=2 && P2PC~=3 && P2PC~=4 && P2PC~=5 && P2PC~=6 && P2PC~=7 && P2PC~=8 && P2PC~=9 && P2PC~=10 
                    P2PC=input('Please select an integer between 1-10: ');
                end
            end

            SB2(P2PR,P2PC)=-1; % SET THE SECONDARY BOARD EQUAL TO -1 TO SHOW A MISS
            fprintf('\nMISS!\n\n')
            disp(SB2) 
        end
    end % FOR GAMEOVER LOOP
            
    end % FOR GAMEMODE (2 PLAYER)
    
    
    
% FUNCTION
function player = sound() 
% INSERT THIS IF PLAYER BEATS COMPUTER
    load handel;
    player=audioplayer(y, Fs);
    play(player)
end
        
function PB1 = placing_carrier_points(PB1, CA1, CR1, CC1)
    if CA1 == 1
        PB1(CR1,CC1)=5;
        PB1(CR1,CC1+1)=5;
        PB1(CR1,CC1+2)=5;
        PB1(CR1,CC1+3)=5;
        PB1(CR1,CC1+4)=5;
    else
        PB1(CR1,CC1)=5;
        PB1(CR1+1,CC1)=5;
        PB1(CR1+2,CC1)=5;
        PB1(CR1+3,CC1)=5;
        PB1(CR1+4,CC1)=5; 
    end
end

function PB1 = placing_carrier_points_vertical(PB1, CR1, CC1)
    PB1(CR1,CC1)=5;
    PB1(CR1+1,CC1)=5;
    PB1(CR1+2,CC1)=5;
    PB1(CR1+3,CC1)=5;
    PB1(CR1+4,CC1)=5; 
end