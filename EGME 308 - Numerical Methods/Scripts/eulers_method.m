% eulers_method.m
% Author: Group 3
% Date modified: 09/29/2021
% Description: Solve Euler's Method pendulum problem

close all;
clear all;
clc;

%% MODEL PARAMETERS

gravity = 9.8; % m/s^2
L = 0.695;                                          % Length (m)

%% INITIAL CONDITIONS

d_0 = 0;         % initial displacement (rad)
v_0 = 0;          % initial velocity (rad/s)

%% LENGTH INCREMENT

dx = 0.0001;     % length increment (m)
x = 0:dx:L;

%% NUMERICAL SOLUTION

phi = zeros(size(t));     % angles (m)
phi(1) = thi_0;              % initial angle (m)

phidot = zeros(size(t));  % velocities (m/s)
phidot(1) = v0;           % initial velocity (m/s)

phiddot = zeros(size(t)); % accelerations (m/s/s)

for k = 1:length(t) - 1    
%     xddot(k) = -(omega)^2*x(k);  
    phiddot(k) = -(gravity/l) * sin(phi(k));
    phidot(k+1) = phidot(k) + phiddot(k)*dt;    
    phi(k+1) = phi(k) + phidot(k)*dt;
end

phiddot(end) = -omega^2 * phi(end);
 
% xddot + (gravity/l) * sin(thi) = 0;

%%% POSTPROCESSING %%%fid = fopen('data.dat','w');fprintf(fid,'t [s]  x [m]   xdot [m/s]  xddot [m/s/s]\r\n');for k=1:length(t)    fprintf(fid,'%.7f %.7f %.7f %.7f\r\n',t(k),x(k),xdot(k),xddot(k));end
