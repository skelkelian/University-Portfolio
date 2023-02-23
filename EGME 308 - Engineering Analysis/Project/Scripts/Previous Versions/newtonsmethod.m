% newtonsmethod.m
% Author: John Sanders
% Date modified: 11/17/2021

close all;
clear all;
clc;

f = @(x) cos(x).*cosh(x) + 1;
dfdx = @(x) -sin(x).*cosh(x)+cos(x).*sinh(x);

x = 0:0.001:8;

figure(1);
hold on;
plot(x,f(x),'-b');
xlabel('x');
ylabel('f(x)');
axis([min(x),max(x),-1,1]);

x0 = 5;
tol = 1e-9;

while abs(f(x0))>tol
    x0 = x0 - f(x0)/dfdx(x0);
end

figure(1);
plot(x0,f(x0),'xr');
x0

% make sure first natural frequency is greater than 5 Hz