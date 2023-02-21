%% projectScripts.m
% Author: EGME 308-01 Group 3
% Date modified: 11/30/2021
% Description: Plots for each graph in EGME 308 project

close all;                                          % closes all open figure windows
clear all;                                          % clears all previously defined variables
clc;                                                % clears the command prompt

% Define Knowns
N = 6;                                              % Number of segments
L = 0.695;                                          % Length (m)
r = 0.0025;                                         % Radius (m)
Ls = L/N;                                           % Length of single segment on antenna (m)
V = pi*(r^2)*Ls;                                    % Volume of a cylinder
h = r/N;                                            % Thickness of each segment on antenna (m)
D = 8000;                                           % Density of metal (kg/m^3)
antennaMass = D*V;                                  % Formula of mass
F = (antennaMass * 9.81) * 10;                      % Concentrated force (N)
dx = 0.000001;                                      % Increment (m)
x = 0:dx:L;                                         % Define domain of interest: 0 < x < L
m = F;                                              % Formula for the bending moment    
YS = 207000000;                                     % Yield Strength (Pa)
EM = 193000000000;                                  % Elastic Modulus (Pa)
A0 = 2*pi*(r^2-(r-h)^2);                            % Cross sectional area (m^2)

%% C(x)

% Plotting
figure(1);                                          % Open Figure 1

% Graph
plot(x,f(x, N, h, L), 'blue', 'LineWidth', 2);
title('Maximum Vertical Distance Diagram')
xlabel('x (m)')
ylabel('Maximum Vertical Distance (m^4)')


% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_C.png', 'Resolution', 300)

%% I(x)

% Plotting
figure(2);                                          % Open Figure 2

% Graph
plot(x, g(x, N, h, L), 'blue', 'LineWidth', 2)
title('Second Moment of Area Diagram')
xlabel('x (m)')
ylabel('Second Moment of Area (m^4)')

% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_I.png', 'Resolution', 300)

%% Bending Moment
% Plotting
figure(3);                                          % Open Figure 3

% Graph
plot(x, bendMoment(x, F, L), 'blue', 'LineWidth', 2)
title('Bending Moment Diagram')
xlabel('x (m)')
ylabel('Bending Moment (Nm)')

% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_Bending_Moment.png', 'Resolution', 300)

%% Shear Force
% Plotting
figure(4);                                          % Open Figure 4

% Graph
plot(x, shearForce(x, F, L), 'blue', 'LineWidth', 2)
title('Shear Force Diagram')
xlabel('x (m)')
ylabel('Shear Force (N)')

% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_Shear_Force.png', 'Resolution', 300)

%% Normal Stress
% Plotting
figure(5);                                          % Open Figure 5

% Graph
plot(x, normalStress(f(x, N, h, L), bendMoment(x, F, L), g(x, N, h, L)), 'blue', 'LineWidth', 2)
title('Normal Stress Diagram')
xlabel('x (m)')
ylabel('Normal Stress (Pa)')

% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_Normal_Stress.png', 'Resolution', 300)

%% Cost of Raw Material
materialCost = antennaMass * 0.23;

%% Factor of Safety
FOS = YS / max(normalStress(f(x, N, h, L), bendMoment(x, F, L), g(x, N, h, L)));

%% Deflection Curve
% Plotting
figure(6);                                          % Open Figure 6

% Graph
plot(x, deflect(x, dx, EM, bendMoment(x, F, L), g(x, N, h, L)), 'blue', 'LineWidth', 2)
title('Deflection Curve')
xlabel('x (m)')
ylabel('Vertical Deflection (m)')

% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_Deflection.png', 'Resolution', 300)

%% Fundemental Frequency

frequency(EM, N, L, Ls, h, D, A0)
% x1 = 1.875104068711961;

%% Determinant

% Determinant interval
x_int = -10:0.01:10;

for k=1:length(x_int)                              
    
    % Matrix Initialization
    matrix = [1, 1, 1, 1; sqrt(i), -sqrt(i), sqrt(-i), -sqrt(-i); (sqrt(i))^2*exp(sqrt(i)*x_int(k)), (-sqrt(i))^2*exp(-sqrt(i)*x_int(k)), (sqrt(-i))^2*exp(sqrt(-i)*x_int(k)), (-sqrt(-i))^2*exp(-sqrt(-i)*x_int(k)); (sqrt(i))^3*exp(sqrt(i)*x_int(k)), (-sqrt(i))^3*exp(-sqrt(i)*x_int(k)), (sqrt(-i))^3*exp(sqrt(-i)*x_int(k)), (-sqrt(-i))^3*exp(-sqrt(-i)*x_int(k))];
    
    % Calculate determinant of matrix A
    determinant_res(k) = det(matrix);
    
end

figure(8);                                          % Open Figure 8
plot(x_int, determinant_res, 'blue', 'LineWidth', 2);
title('Determinant Curve')
xlabel('x (m)')
ylabel('Determinant')

% Export Plot
ax = gca;
ax.YAxis.Exponent = 0;
exportgraphics(ax, 'figures/curve_Determinant.png', 'Resolution', 300)


%% User Defined Functions
%% C(x)
function C = f(x, N, h, L)
    C = N*h;
    for n = 1:N-1                                   % Iterate from 1 to N-1 to simulate sum function
        
        C = C-h*(heaviside((x-(n.*L)./N)));         % Using formula calculated to solve for C

    end
end

%% I(x)
function I = g(x, N, h, L)
    I = (pi/4)*h^4*(N^4-(N-1)^4);
    for n = 1:N-1                                   % Iterate from 1 to N-1 to simulate sum function

        I = I-(pi/4)*h^4*(((N-n+1)^4-(2*(N-n)^4))+(N-n-1)^4)*(heaviside((x-(n.*L)./N))); % Combined two of (2*(N-n)^4) which is why it is multiplied by 2

    end
end

%% Bending Moment
function M = bendMoment(x, F, L)
    
    M = -F*x+2*F*L/3+(F*x-F*2*L/3).*heaviside(x-2*L/3);

end

%% Shear Force
function sF = shearForce(x, F, L)
    
    sF = -F*heaviside(2*L/3-x);
    
end

%% Normal Stress
function nS = normalStress(C, M, I)
        
    nS = (abs(M).*C)./(I);
    
    fprintf("Maximum Stress: " + max(nS) + " Pa\n")

end

%% Deflection
function deflection = deflect(x, dx, EM, M, I)
%     u0 = 0;
    udot0 = 0;

    deflection = zeros(size(x));
%     init_deflection(1) = u0;

    udot = zeros(size(x));
    udot(1) = udot0;

%    uddot = zeros(size(x));
    uddot = M./(EM.*I);

    for k=1:length(x)-1                             % Iterate from 1 to the length of array x minus 1 to simulate sum function
        
        udot(k+1) = udot(k) + uddot(k)*dx;
        deflection(k+1) = deflection(k) + udot(k)*dx;
        
    end
    
    fprintf("Greatest Deflection: " + max(deflection) + " m\n")

end

%% Fundamental Frequency
function w = frequency(EM, N, L, Ls, h, D, A0)

    B = 1.875;
    
    f = @(x) cos(x).*cosh(x) + 1;
    dfdx = @(x) -sin(x).*cosh(x)+cos(x).*sinh(x);

    x = 0:0.001:8;

    figure(7);
    hold on;
    plot(x,f(x), 'blue', 'LineWidth', 2);
    title('Fundamental Frequency')
    xlabel('x');
    ylabel('f(x)');
    axis([min(x),max(x),-1,1]);

    x1 = 2;
    x2 = 5;
    x3 = 8;
    tol = 1e-9;

    while abs(f(x1))>tol
        x1 = x1 - f(x1)/dfdx(x1);
    end
    figure(7);
    plot(x1,f(x1),'xr', 'LineWidth', 3);

    while abs(f(x2))>tol
        x2 = x2 - f(x2)/dfdx(x2);
    end
    figure(7);
    plot(x2,f(x2),'xr', 'LineWidth', 3);

    while abs(f(x3))>tol
        x3 = x3 - f(x3)/dfdx(x3);
    end
    figure(7);
    plot(x3,f(x3),'xr', 'LineWidth', 3);
    
    B1 = x1*(N/L);
    B2 = x2*(N/L);
    B3 = x3*(N/L);
    
    w1 = (sqrt((EM*((pi/4)*h^4*(N^4-(N-1)^4)))/(D*A0)))*(x1/Ls)^2/(2*pi);
    w2 = (sqrt((EM*((pi/4)*h^4*(N^4-(N-1)^4)))/(D*A0)))*(x2/Ls)^2/(2*pi);
    w3 = (sqrt((EM*((pi/4)*h^4*(N^4-(N-1)^4)))/(D*A0)))*(x3/Ls)^2/(2*pi);
    
    fprintf("Frequency: " + w1 + " Hz\n")
    
    % Export Plot
    ax = gca;
    ax.YAxis.Exponent = 0;
    exportgraphics(ax, 'figures/curve_Fundamenal_Frequency.png', 'Resolution', 300)

end
