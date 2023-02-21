%clearing previous data and command window
clear;
clc;

%shear plot

F=1;
L=1;
a = 0:0.001:L;
m=F;
for i=1:numel(a)
  if a(i) < 0
    s(i) = 0;
  elseif (a(i) > 0) && (a(i) < 2/3*L)
    s(i) = m*a(i)-2*F*L/3;
  else 
    s(i) = 0;
  end
end

% Graph
plot(a, s, 'blue', 'LineWidth', 2)
xticks(0:1/3*L:L)
yticks(-3*L/2*F:1/6*F:0)

% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_BM.png', 'Resolution', 300)