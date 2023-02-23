%% Bending Moment
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
% Formula for the bending moment
m = F;

% Iterate through matrix a
for i = 1:numel(a)
    
  % For values of a(i) that are less than 0, the values of s(i) are 0
  if a(i) < 0 

    s(i) = 0;
  % For the valuse between the interval the value of s(i) is the (bending
  % moment formula * length) - (2 * force * length) / 3
  elseif (a(i) > 0) && (a(i) < 2/3*L)

    s(i) = m * a(i) - 2 * F * L/3;
  % When the values are not included in the interval (a(i) > 0) && 
  % (a(i) < 2/3*L) the s(i) are equal to zero
  else 
    s(i) = 0;

  end

end

%% Graph
% Plot all values of a versus all values of s
plot(a, s, 'blue', 'LineWidth', 2)
title('Bending moment diagram')
xlabel('x (m)')
ylabel('(kNm)')

% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_Bending_Moment.png', 'Resolution', 300)
