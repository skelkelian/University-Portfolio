%% C(x)

% Clear previous data and command window
clear;
clc;
    
% Number of segments
N = 6; 
% Length
L = 0.8625; 
% Matrix for x axis
a = 0:0.00001:L;
% Thickness of each segment on antenna
h = 1;

% Iterate through matrix A
for i = 1:numel(a)
    
    % Iterate from 0 to number of segments on antenna 
    for n = 0:N 
        
        % For values of a(i) that are between the interval, the values of C(i) are (number of segments - iterable in sum) * thickness of segment
        if a(i) <= ((n + 1) * L / N) && a(i) >= ((n) * L / N)
            
            C(i) = (N - n) .* h;

        end
        
    end

end

% Graph
plot(a, C, 'blue', 'LineWidth', 2)
xlabel('x (L)')
ylabel('C(x) (h)')
title('C(x) Graph')

% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_C.png', 'Resolution', 300)
    