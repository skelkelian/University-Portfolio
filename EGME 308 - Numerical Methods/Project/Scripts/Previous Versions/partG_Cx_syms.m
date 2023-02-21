%% C(x)
clear;
clc;

syms n x
N=6;
L=0.8625;
h=1;
C1 = N*h;
f = heaviside((x-(n.*L))./N); 
    
C = C1-h.*symsum(f,n,[1 N-1]);

fplot(C, 'blue', 'LineWidth', 2)
xlim([0 5])
xlabel('x (L)')
ylabel('C(x) (h)')
title('C(x) Graph')

ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_C.png', 'Resolution', 300)
