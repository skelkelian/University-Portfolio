% FOR_example.m
% Author: Serop Kelkelian
% Date Modified: 3/2/2020
% Description: Illustrate FOR-loops

clear;
clc;

% Syntax:
% 
% for (array definition)
%   commands;
%   ^ These commands are repeated for each value of the array
% end

% Example 1
a=10;
for k=1:10
    a=a+2;
end

% Example 2
clear x;
for k=1:10
    x(k)=k;
end

% Example #3
clear A;
for k=1:5
    for m=1:5
        A(k,m)=k+m;
    end
end

% Example #4
s=0;
n=0;
while n<=100;
    s=s+1/factorial(n);
    % never modify the array (n) inside the for loop
end
