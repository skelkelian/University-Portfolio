%% Maximum Normal Stress

% Clear previous data and command window
clear;
clc;

% Number of segments
N = 6;
% Length
L = 86.25;
% Matrix for x axis
x = 0:0.01:L;
% Thickness of each segment on antenna
h = 1;
% Concentrated force
F = 1;
% Bending moment
m = F;

% Find I1
I1 = pi/4*h^4*(N^4-(N-1)^4); 

% Pre-allocate space for drop matrix
d = zeros(N-1,1);

% Iterate through matrix X
for i = 1:numel(x) 
    
    %% I(x)
    % Set range for values according to how many sections are chosen, basically the values for the summation 
    for n = 1:N-1 
        
        % Find and set the amount dropped per section in an array a
        d(n) = I1 - h^4*((N-n).^4-(N-n-1).^4); 
        
        % First section of plot, ranging from 0 to L/N (assumes n=1 as first n in n*L/N)
        if (x(i)>=0) && (x(i) < L/N) 
            
            % Value for I in first section of plot is maximum I value (I1 solved for in lines previous)
            I(i)=I1; 
            
        % Run through the following sections of plot according to n, ie 2*L/N,3*L/N,4*L/N, etc. until final range is reached
        elseif (x(i) >= n*L/N) && (x(i) <= (n+1)*L/N) 
        
            % Find value for I in given section, set value in the array I
            I(i) = pi/4*h^4*(I1 - d(n)); 
            
        end
        
    end
    
    %% C(x)
    % Iterate from 0 to number of segments on antenna 
    for n = 0:N 
        
        % For values of a(i) that are between the interval, the values of C(i) are (number of segments - iterable in sum) * thickness of segment
        if x(i) <= ((n + 1) * L / N) && x(i) >= ((n) * L / N)
            
            C(i) = (N - n) .* h;

        end
        
    end
    
    %% M(x)
    % For values of x(i) that are less than 0, the values of BM(i) are 0
    if x(i) < 0

        BM(i) = 0;

    % For the values between the interval
    elseif (x(i) > 0) && (x(i) < 2/3 * L)
        
        % The value of BM(i) is the (bending moment formula * length) - (2 * force * length) / 3
        BM(i) = m * x(i) - 2 * F * L/3;

    % When the values are not included in the interval, the values of BM(i) are 0
    else 
        
        BM(i) = 0;

    end
    
    %% s(x)
    % Calculate normal stress
    s(i) = (abs(BM(i)) * C(i))/(I(i));
    
end

%% Plotting
% Plot all values of x versus all values of I
plot(x, s, 'blue', 'LineWidth', 2) 
xlabel('x')
ylabel('s')
title('s(x) Graph')

% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_I.png', 'Resolution', 300)

