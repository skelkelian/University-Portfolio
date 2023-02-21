%% Second Moment of Area

% Clear previous data and command window
clear;
clc;

% Set knowns
N = 4;
L = 0.8625;
h = 1;
x = 0:0.0001:L;

% Find first value of I, aka max I value, used later in loop for graph
I1 = pi/4*h^4*(N^4-(N-1)^4); 

% Pre-allocate space
a = zeros(N-1,1);

% Set range for values to be filled according to how many x values there are, going this route helps prevent errors regarding tryng to input an array starting at zero for functions that only accept positive integers
for i = 1:numel(x) 
    
    % Set range for values according to how many sections are chosen, basically the values for the summation 
    for n = 1:N-1 
        
        % Find and set the amount dropped per section in an array a
        a(n) = I1 - h^4*((N-n).^4-(N-n-1).^4); 
        
        % First section of plot, ranging from 0 to L/N (assumes n=1 as first n in n*L/N)
        if (x(i)>=0) && (x(i) < L/N) 
            
            % Value for I in first section of plot is maximum I value (I1 solved for in lines previous)
            I(i)=I1; 
            
        % Run through the following sections of plot according to n, ie 2*L/N,3*L/N,4*L/N, etc. until final range is reached
        elseif (x(i) >= n*L/N) && (x(i) <= (n+1)*L/N) 
        
        % Find value for I in given section, set value in the array I
            I(i) = pi/4*h^4*(I1 - a(n)); 
            
        end
        
    end
    
end

% Plot all values of x versus all values of I
plot(x, I, 'blue', 'LineWidth', 2) 
xlabel('x (L)')
ylabel('I (pi/4*h^4)')
title('I(x) Graph')

% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_I.png', 'Resolution', 300)

