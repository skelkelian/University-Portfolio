%% IF_examples.m
%% Author: Serop Kelkelian
%% Date Created: 2/12/2020
%% Description: Illustrates IF-statements

clear all;
clc;

%% Example 1
A=[1,-17,0;0,1,-29;34000872,14,7];
b=[0;0;250e6];

if ~(det(A)==0)
    x=A^(-1)*b;
end

%% Example 2
A=[1,1,1;2,2,2;4,4,4];
b=[1;2;4];
if det(A)~=0
    y=A^(-1)*b; %%matlab skips this line bc proposition is false
end

%% Example 3
x=3;
y=x^2;
if y>10
    z=1;
else 
    z=0;
end

%% Example 4
x=3;
y=x^2;
if y==9
    z=1;
else 
    z=0;
end

%% Example 5
if x==6
    t=4;
elseif x==7
    t=27
else
    t=-2;
end