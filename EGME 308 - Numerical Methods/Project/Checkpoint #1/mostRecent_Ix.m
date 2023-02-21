%clearing previous data and command window
clear;
clc;

%summation practice
%syms n x
N=4;
L=0.8625;
h=1;
n=1;
x=0:L/(N-1):L;

I1 = h^4*(N^4-(N-1)^4);
a = zeros(N-1,1);
x_values = zeros(N-1,1);

for i = 1:length(x)
    
    for n = 0:N-1
        
        if x(i) <= ((n+1)*L)/N && x(i) >= (n*L)/N
            
            I(i) = pi/4.*h^4.*((N-n)^4-((N-n-1)^4));
%         a(n) = I1 - h^4*((N-n).^4-(N-n-1).^4); %check drop value
% 
%         I = pi/4*h^4*(I1 - a.*heaviside(x-(n*L/N))); %check a, multiply by heaviside (if x<n*L/N then result 0)
% 
%         x_values(n) =  n*L/N;
% 
%         n = n + 1;
        end
        
    end
    
end
plot(x,I)

% for i=1:numel(a)
%   if a(i) < 0
%     s(i) = 0;
%   elseif (a(i) > 0) && (a(i) < 2/3L)
%     s(i) = ma(i);
%   else 
%     s(i) = 0;
%   end
% end
