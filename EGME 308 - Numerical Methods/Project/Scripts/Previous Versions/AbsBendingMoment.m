%% Absolute Bending Moment

% Clear previous data and command window
clear;
clc;

% Set knowns
F = 1;
L = 1;
x = 0:0.001:L;

% Set range for values to be filled according to how many x values there are
for i=1:numel(x)
    
    if x(i) < 0
        s(i) = 0;
    elseif (x(i) > 0) && (x(i) < 2*L/3)
        s(i) = -(2*F*L/3+(2*L/3).*x(i)+(F*x(i)-F*2*L/3));
    else 
        s(i) = 0;
    end
    
end

% Plot all values of x versus all values of s
plot(x, s, 'blue', 'LineWidth', 2)
xlabel('x (L)')
ylabel('s')
title('M(x) Graph')
