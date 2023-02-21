% WHILE.examples.m
% Author: Serop Kelkelian
% Date: 2/26/2020
% Description: Illustrates WHILE loops

close all;
clear all;
clc;

% SYNTAX
%
% while (proposition)
%   commands;
%       ^These commands are repeated as long as the proposition is true
% end

a=0;
while a<10
    a=a+1;
    if a>2
        break; % break exits from the current loop
    end
end

% Infinite loop: one that repeats forever (NOT GOOD, WILL KEEP DOING
% FOREVER)
% b=1;
% while b<5
%    b=b-1;
% end
    
% Compute the sum of 1/n! from n=1 to 100 
% initialize the sum to zero
s=0;
% initialize the index n to 1
n=0;
% keep adding terms to the sum until n>100
while n<=100
    s=s+1/factorial(n);
    n=n+1;
end


% Compute the sum of 1/n^2 from n=1 to 100 
% initialize the sum to zero
s=0;
% initialize the index n to 1
n=1;
% keep adding terms to the sum until n>100
while n<=100
    s=s+1/n;
    n=n+1;
end
    
