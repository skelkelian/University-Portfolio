% signal_decomp.m
% Author: John Sanders
% Date modified: 04/09/2019
% Description: Uses the Fast Fourier Transform (FFT) to construct the 
%  amplitude/frequency spectrum for a signal

clear all;
clc;

%%%%% ORIGINAL SIGNAL %%%%%

%%% SIGNAL DATA %%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% NOTE TO USER: YOU NEED TO EDIT THE CODE BELOW %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  You need to define two arrays:
%    t = time values for all the data points (increment should be constant)
%    S = signal values for all the data points

t = 0:0.0001:0.5;
S = 30*cos(250*t) + 20*cos(750*t) + 16*sin(3000*t);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% NOTE TO USER: DO NOT EDIT BELOW THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% SIGNAL PARAMETERS %%%
n = length(t)-1;            % total number of data points (minus 1)
Ts = t(2)-t(1);             % sampling period [s]
fs = 1/Ts;                  % sampling frequency [Hz]
ws = 2*pi*fs;               % sampling frequency [rad/s]

%%% PLOT THE ORIGINAL SIGNAL %%%
figure(1);
plot(t,S,'-k');
xlabel('Time (t) [s]');
ylabel('Signal [signal units]');
title('Original Signal');

%%%%% FREQUENCY SPECTRUM %%%%%

%%% FREQUENCY SPECTRUM DATA %%%
w = ws*(-0.5:(1/n):0.5);    % discretized frequency domain [rad/s]
DFT = fftshift(fft(S));     % Discrete Fourier Transform of signal (complex values)
M = (2/n)*abs(DFT);         % normalized magnitude (real values)

%%% PLOT THE FREQUENCY SPECTRUM %%%
figure(2);
plot(w,M);
axis([min(w),max(w),min(M),max(M)]);
xlabel('Frequency (\omega) [rad/s]');
ylabel('Amplitude [signal units]');
title('Frequency Spectrum');