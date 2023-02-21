% for_loop_practice.m
% Author: Serop Kelkelian
% Date modified: 3/2/2020
% Description: Practice activity of for loops

clear;
clc;

f=0;
for k=1:10
    f=f+1;
end

f=-17;
for m=2:2:8
    f=f+m;
end

f=24;
for x=[2,-3,2]
    f=f/x;
end

f=zeros(1,10);
for k=1:10
    f(k)=k; 
end

f=0;
for a=1:5
    f(a)=a^2; 
end

f=0;
k=1;
for b=2:3:18
    f(k)=b+2;
    k=k+1;
end

z1=[1, 2, 3, 4, 5]
u1=[12,2,z1]
for x=u1:length
    

f=0;
for k=1:5
    for l=1:5
        f(k,l)=k*l;
    end
end

f=0;
for s=2:2:6
    for t=3:-1:1
        f(s/2,4-t)=t/s;
    end
end