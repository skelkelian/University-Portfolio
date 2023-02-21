function [flowtype, Cd] = drag_coeff(Re)
% calculates drag coefficients and flowtypes and outputs values in two seperate arrays
% input Re as a matrix of any size []
% returns two outputs: 
    % Cd (an array the same size as Re, giving elementwise drag coefficients)
    % flowtype (an array the same size as Re, giving 0's for laminar reynolds numbers and 1's for turbulent reynolds numbers)

Cd=zeros(size(Re)); % create drag coefficients matrix

for r=1:size(Re,1) % creates for loop from 1 to number of rows in matrix Re
    for c=1:size(Re,2) % creates for loop from 1 to number of columns in matrix Re
        if Re(r,c)>(2*10^5)
            fprintf('Warning: Flow is turbulent. Assuming a drag coefficient of 0.2.');
            break; % only one fprintf is needed, break inner loop
        end
    end
    if Re(r,c)>(2*10^5)
        break; % breaks the outer loop
    end
end

for r=1:size(Re,1)
    for c=1:size(Re,2)
        if Re(r,c)<=(2*10^5)
            Cd(r,c)=24/Re(r,c)+0.5; % formula for drag coefficients of reynolds numbers less than or equal to 200,000
        else
            Cd(r,c)=0.2; % defaults drag coefficients to 0.2 if the reynolds numbers is greater than 200,000
        end
    end
end

flowtype=Re>(2*10^5); % creates logical array of 0's and 1's correlating to flowtype
