% User-defined functions

% Syntax:
% function [output1,output2,...]=name(input1,input2...)

% Example
% f(x)=|x|
function [y]=myabs(x)

    % Inputs:
    % x = an array of real numbers
    % Outputs:
    % y = the absolute value of each element of x

    % Define outputs in terms of inputs (in this case, y in terms of x)

    for k=1:size(x,1) %k loops over rows
        for m=1:size(x,2) % m loops over columns
                if x(k,m)>0
                    y(k,m)=x(k,m);
                else
                    y(k,m)=-x(k,m);
                end
        end
    end
end