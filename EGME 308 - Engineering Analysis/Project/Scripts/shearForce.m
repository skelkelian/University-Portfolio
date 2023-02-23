%% Shear Force
% Author: EGME 308-01 Group 3

% Clear previous data and command window
clear;
clc;

% Concentrated force (N)
F = 1.7849;
% Length (m)
L = .695;
% Matrix for x axis
a = 0:0.0001:L;
    
% Iterate through matrix a
for i = 1:numel(a)
    
  % For values of a(i) that are less than 0, the values of s(i) are 0
  if a(i) < 0

    s(i) = 0;
  % For the values between the interval the value of s(i) equal to the
  % concentrated force
  elseif (a(i) > 0) && (a(i) < 2/3 * L)

    s(i) = -F;
  % When the values are not included in the interval (a(i) > 0) && 
  % (a(i) < 2/3*L) the s(i) are equal to zero
  else 

    s(i) = 0;

  end

end

%% Graph
% Plot all values of a versus all values of s
plot(a,s, 'blue', 'LineWidth', 2)
title('Shear force diagram')
xlabel('x (m)')
ylabel('(kN)')

% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_Shear_Force.png', 'Resolution', 300)