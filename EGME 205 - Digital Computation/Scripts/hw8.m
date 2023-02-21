% Problem 1
for a=1:20
    fprintf('%d is a positive integer \n', a)
end

% Problem 2
number=input('pick a real number that is greater than 9000: ');
while number<9000
    number=input('please pick a real number that is greater than 9000: ');
end
if number>9000
    fprintf('IT?S OVER NINE THOUSAND!!!!!\n')
end

% Problem 4
randnum=ceil(100*rand);
trys=0;

fprintf('Hello! I am thinking of an integer between 1 and 100\n')
guess=input('Can you guess what it is? ');

while guess~=randnum
    if guess<0
        guess=input('Out of range, guess a number between 1-100: ');
    elseif guess>100
        guess=input('Out of range, guess a number between 1-100: ');
    elseif guess<randnum
        guess=input('Nope! Think higher: ');
    elseif guess>randnum
        guess=input('Nope! Think lower: '); 
    end
    trys=trys+1;
end

if guess==randnum
    fprintf('It only took you %d tries\n\n', trys)
end
