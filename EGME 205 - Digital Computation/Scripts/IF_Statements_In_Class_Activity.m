%% Author: Serop Kelkelian
%% Assingment: IF Statements
%% Dated Modified: 2/24/2020
%% Description: Practice with IF Statements

clc
%% Problem A
x = 2;
A = 7;
if x >2
    A = 4;
end
A

%% Problem B
A = 0;
t = -4;
if t <5
    A = -10;
end
A

%% Problem C
A = 9;
y = 100;
if A <=9
    A = A + 1;
end
A

%% Problem D
x = 2;
y = 4;
A = 5;
z = 6;
w = x * y + z ;
if w ==15
    A = w ;
end
A

%% Problem E
x = 2;
if x ==3
    A = 1;
else
    A = 2;
end
A

%% Problem F
b = 49;
if sqrt ( b )==7
    A = b ;
else
    A = 2* b ;
end
A

%% Problem G
x = 2;
if x ==1
    A = 1;
elseif x ==2
    A = 2;
else
    A = 3;
end
A

%% Problem H
y = 20;
if y <30
    A = 2;
elseif y <20
    A = 4;
else
    A = 6;
end
A

%% Problem I
x = 0.5;
if x >1.0
    A = 1;
    w = 2;
elseif x >0.9
    A = 2;
    w = 4;
elseif x >0.8
    A = 3;
    w = 4;
elseif x >0.7
    A = 4;
    w = 2;
elseif x >0.6
    A = 5;
    w = 1;
elseif x >0.5
    A = 6;
    w = -1;
elseif x >0.4
    A = 7;
    w = 7;
elseif x >0.3
    A = 8;
    w = 5;
elseif x >0.2
    A = 9;
    w = 6;
elseif x >0.1
    A = 10;
    w = 7;
else
    A = 11;
    w = 0;
end
A = A + w