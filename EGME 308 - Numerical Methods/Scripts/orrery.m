% orrery.m
% Author: John Sanders
% Date modified: 09/23/2021
% Description: Simulates the motion of the sun and planets

close all;
clear all;
clc;

tic;

%%% MODEL PARAMETERS %%%

% conversions from years, days to seconds
yr2sec = 365.25*24*60*60;
day2sec = 24*60*60;

% universal gravitation constant (m^3/kg*s^2)
G = 6.67430e-11;

% The celestial bodies are ordered as follows:
%   1 - Sun
%   2 - Mercury
%   3 - Venus
%   4 - Earth
%   5 - Mars
%   6 - Jupiter
%   7 - Saturn
%   8 - Uranus
%   9 - Neptune
%   10 - Pluto

labels = {'Sun','Mercury','Venus','Earth','Mars','Jupiter','Saturn','Uranus','Neptune'};

% masses (kg)
m = [1988500e24;
    3.302e23;
    48.685e23;
    5.97219e24;
    6.4171e23;
    189818722e19;
    5.6834e26;
    86.813e24;
    102.409e24];

% volumetric mean radii (m)
R = [695700000;
    2440000;
    6051840;
    6371010;
    3389920;
    69911000;
    58232000;
    25362000;
    24624000];

% xyz-coordinates on 9/23/2021 (km)
x0 = [-1.224464672923445E+06,	6.242054706416869E+05,	2.352158017150118E+04;
    3.706922230089026E+07,      -5.004931616029753E+07,	-7.629970815187830E+06;
    4.623700762346898E+07,      -9.731917418757893E+07,	-4.059443962136455E+06;
    1.488961930903900E+08,		3.496146286696873E+05,	2.324853455396302E+04;
    -2.442612211547737E+08,     -3.327073344157794E+07,	5.274806350671719E+06;
    6.482521901354280E+08,      -3.749958203221434E+08,	-1.294727032545823E+07;
    9.835672572311779E+08,      -1.113384565747058E+09,	-1.980018463887674E+07;
    2.192814197876701E+09,      1.976306292386028E+09,	-2.106827291403449E+07;
    4.425437558285452E+09,      -6.582127588600688E+08,	-8.843407899848181E+07];

x0 = x0*1000; % convert to m

% xyz-velocities on 9/23/2021 (km/s)
v0 = [-7.929875821729009E-03,	-1.381852758412232E-02,	2.989156581261251E-04;
    2.915336545535371E+01,	    3.171591877987840E+01,	-8.173563028311470E-02;
    3.127200937778750E+01,	    1.513831458799264E+01,	-1.596761985480503E+00;
    -4.336269815401860E-01,	    2.965195074658891E+01,	-1.913301766196085E-03;
    4.239545234029511E+00,      -2.194130429664645E+01,	-5.634360826311715E-01;
    6.382468443835208E+00,	    1.192483349832130E+01,	-1.922788835226674E-01;
    6.699513200869210E+00,	    6.373253272012657E+00,	-3.770499096422286E-01;
    -4.609426209302094E+00,     4.741466624979823E+00,	7.742510366632271E-02;
    7.632964305843658E-01,	    5.408893114409871E+00,	-1.282664572018055E-01];

v0 = v0*1000; % convert to m/s

%%% NUMERICAL SOLUTION %%%

% time discretization
N = 1e7;            % number of time increments
tmin = 0;           % s
tmax = 10*yr2sec;   % s
dt = (tmax-tmin)/(N-1); % s
t = tmin:dt:tmax;   % s

% initialize arrays
x = zeros(size(x0,1),size(x0,2),length(t));
v = zeros(size(x));
a = zeros(size(x));

% initial conditions
x(:,:,1) = x0;
v(:,:,1) = v0;

% iteration
for k=1:length(t)-1 % loop over time increments
    for i=1:length(m) % loop over celestial bodies
        for j=1:length(m) % loop over other celestial bodies
            if i~=j
                a(i,:,k) = a(i,:,k) + (G*m(j)/(norm(x(j,:,k)-x(i,:,k)))^3)*(x(j,:,k)-x(i,:,k));
            end
        end
    end
    
    v(:,:,k+1) = v(:,:,k) + a(:,:,k)*dt;
    x(:,:,k+1) = x(:,:,k) + v(:,:,k)*dt;
end

toc;

%%% POSTPROCESSING %%%

tic;

X = permute(x(:,1,:),[1,3,2]);
X = reshape(X,[],size(t,2),1);
Y = permute(x(:,2,:),[1,3,2]);
Y = reshape(Y,[],size(t,2),1);

xmax = max(max(abs(X)));
ymax = max(max(abs(Y)));

xmax1 = max(xmax,ymax);
ymax1 = xmax1;
xmin1 = -xmax1;
ymin1 = -ymax1;

xmax2 = 0.5e12;
ymax2 = xmax2;
xmin2 = -xmax2;
ymin2 = -ymax2;

% create animation
f = 1e3*1/dt;                       % frame rate, Hz
vidObj1 = VideoWriter('solar system');
vidObj2 = VideoWriter('solar system zoom');
vidObj1.FrameRate = f;
vidObj2.FrameRate = vidObj1.FrameRate;
open(vidObj1);
open(vidObj2);

dk = N/1e4;
for k=1:dk:length(t)
    T = t(k)/day2sec;
    plot(X(:,k),Y(:,k),'ok');
    text(X(:,k),Y(:,k),labels,'VerticalAlignment','bottom','HorizontalAlignment','right');
    text((0.75*xmax1),(0.75*ymin1),sprintf('t = %.0f days',T),'FontSize',12,'horizontalAlignment','right');
    alpha(0.25);
    xlabel('meters');
    ylabel('meters');
    axis([xmin1,xmax1,ymin1,ymax1]);
    writeVideo(vidObj1,getframe(gcf));
    axis([xmin2,xmax2,ymin2,ymax2]);
    text((0.75*xmax2),(0.75*ymin2),sprintf('t = %.0f days',T),'FontSize',12,'horizontalAlignment','right');
    writeVideo(vidObj2,getframe(gcf));
end

close(vidObj1);
close(vidObj2);

toc;