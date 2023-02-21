% script.m
% Author: Serop Kelkelian
% Date modifies: 2/3/2020
% Description: Solves the Farmer's Market Activity

clc;

%%% Problem 1 (realistic) %%%
A = [1,1,0;0,1,1;1,3,1];
b = [1.75;2.25;5.25];
det(A);
x = A^(-1)*b

%%% Problem 2 (not enough info) %%%
A = [1,1,1;2,2,2;4,4,4];
b = [1.75;3.50;7];
det(A)
% x = A^(-1)*b

%%% Problem 3 (not realistic) %%%
A = [1,1,0;0,1,1;1,3,1];
b = [1.75;5.25;5.25];
det(A)
x = A^(-1)*b