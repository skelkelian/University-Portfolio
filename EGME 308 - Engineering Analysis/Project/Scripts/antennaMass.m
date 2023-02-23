%% Mass

clear;
clc;

% m = 2piDLh^2

% Density of metal (Kg/cm^3)
D = 0.0080;

% Length of each antenna segment (cm)
L = 9.583;

% Radius (cm)
r = .5;

% Volume of a cylinder
V = pi * (r^2)* L;

% Formula of mass
m = D * V;

% Mass is in Kg