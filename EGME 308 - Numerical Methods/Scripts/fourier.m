% fourier.m
% Author: John Sanders
% Date modified: 04/18/2018
% Description: Plots partial sums of the Fourier series for 
%
%    f(x) = { -1, -pi < x < 0
%           { +1, 0 < x < pi
%
% with period P = 2*pi

close all;  % closes all open figure windows
clear all;  % clears all previously defined variables
clc;        % clears the command prompt

% Open Figure 1
figure(1);
hold on;                % do not erase plot each time plot() is called

% Plot the exact function f(x) with a dashed black line
x = -3*pi:0.01:3*pi;    % define domain of interest: -4pi<x<4pi
plot(x,f(x),'--k');     % for f(x), see user-defined function below

% Plot several partial sums; for S1(x,N), see user-defined function below
plot(x,S1(x,1),'-r');   % N = 1: solid red line
plot(x,S1(x,5),'-b');   % N = 5: solid blue line
plot(x,S1(x,25),'-g');  % N = 25: solid green line
plot(x,S1(x,1005),'-k'); % N = 105: solid black line

function y = f(x)

% INPUTS:
%   x - a one-dimensional array of real numbers
%
% OUTPUTS:
%   y = f(x), where
%
%    f(x) = { -1, -pi < x < 0
%           { +1, 0 < x < pi
%
% with period P = 2*pi

for k=1:length(x)
    while (x(k)<-pi)
        x(k) = x(k) + 2*pi;
    end
    while (x(k)>pi)
        x(k) = x(k) - 2*pi;
    end
    
    y(k) = x(k);
end

end

function sum = S1(x,N)

% INPUTS:
%   x - a one-dimensional array of real numbers
%   N - the number of terms to include in the partial sum
%
% OUTPUTS:
%   sum - the Nth partial sum of the Fourier series for
%
%    f(x) = { -1, -pi < x < 0
%           { +1, 0 < x < pi
%
% with period P = 2*pi

% Initialize the partial sum to zero
sum = 0;

% Initialize the summation index to zero
n = 1;

while n<=N
    % Add the current term to the partial sum
    sum = sum + (2/n);
    
    % Increase the summation index by one
    n = n + 1;
end

end