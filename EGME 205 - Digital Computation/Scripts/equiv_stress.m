% equiv_stress.m
% Author: Serop Kelkelian
% Date modified: 2/5/2020
% Description: Calculates the equivalent stress associated 
% with a given stress state 

clc;
clear all;

P = 200e6; % N
A = 0.6648; % m^2
syy = P/A; % Pa
syy = syy/1e6; % MPa

% Stress state in MPa
x = [0, 120, 0; 120, -100, -50; 0, -50, 100];

% STEP #1: Trace
trs = x(1,1) + x(2,2) + x(3,3);
% trs = trace(x); (the same thing as the line above)
% sum of the diagonal values

% STEP #2: Mean Stress (average of trs)
sm = trs/3;

% STEP #3: Hydrostatic stress (mean stress times the identity matrix)
shyd = sm*eye(3);

% STEP #4: Deviatoric stress (matrix - shyd)
sdev = x - shyd;

% STEP #5: Contract sdev with itself (think of as magnitude of deviatoric
% stress)
cont = sum(sum(sdev.^2));

% STEP #6: Equivalent Stress
se = sqrt(1.5*cont);