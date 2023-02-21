function y=isprime(x)

% INPUTS :
% x - A SINGLE REAL NUMBER
%
% OUTPUTS :
% y - 1 IF x IS PRIME , 0 OTHERWISE

% INITIALIZE y
y=ones(size(x));

% LOOP OVER EVERY ELEMENT OF x
for r=1:size(x,1)
    for c=1:size(x,2)
        
        % RULE OUT NON-INTEGERS
        if mod(x(r,c),1)~=0
            y(r,c)=0;
        else  % IF x IS AN INTEGER
            for k=2:sqrt(x(r,c))
                
                % CHECK WHETHER x IS DIVISIBLE BY k
                if mod(x(r,c)/k,1)==0
                    y(r,c)=0;
                end
            end
        end
    end
end
