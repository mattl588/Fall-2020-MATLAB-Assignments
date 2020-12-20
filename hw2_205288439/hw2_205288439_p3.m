%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw2_205288439_p3.m
%
% Description: A number-manipulating script that determines whether a
% six-digit number is symmetrical, increasing, decreasing, or neither. 
%
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; close all; clear all;
number = input('Input a six-digit number\n'); %Takes input as a six-digit number.

%% Digit Processing 
digit6 = rem(number, 10); %digit6 is the first-from right number calculated using modulus. 
digit5 = rem(((number - digit6)/10),10); %I subtract the previous digit, divide by ten, and then find the new last digit.
digit4 = rem(((number - digit6 - 10 * digit5)/100),10); % I repeat the same process, getting the original number and stripping it of its last two digits. I now divide by 100 and use rem to get the next digit.
digit3 = rem(((number - digit6 - 10 * digit5 - 100* digit4)/1000),10); % I repeat.
digit2 = rem(((number - digit6 - 10 * digit5 - 100* digit4 - 1000 * digit3)/10000),10); %I repeat.
digit1 = ((number - digit6 - 10 * digit5 - 100* digit4 - 1000 * digit3 - 10000* digit2)/100000); % Similar process, but remainder function isn't necessary. This yields the farthest left number. 
if (digit1 == 0 || digit1 >= 10) % If digit1 (hundred-thousands place) is zero, the string isn't six digits. If it's more than ten, the string is more than 6 digits. 
    error('Number of invalid length');
end

%% Conditional Logic 
if (digit1 == digit6 && digit2 == digit5 && digit3 == digit4) % Symmetrical case. I compare digits n places from left with those n places from right. If all are equal, we print "symmetrical".
    fprintf('%.0f is symmetrical\n',number); %Prints.
elseif (digit1 < digit2 && digit2 < digit3 && digit3 < digit4 && digit4 < digit5... 
            && digit5 < digit6) %Case in which digits from left to right (digit1  to digit6) are increasing using inequalities and && (and) statements.
    fprintf('%.0f is increasing\n',number); %Prints the number.
elseif (digit1 > digit2 && digit2 > digit3 && digit3 > digit4 && digit4 > digit5...
            && digit5 > digit6) %Does opposite of previous case. Checks to see if digits are all decreasing left to right. 
    fprintf('%.0f is decreasing\n',number); %Prints.
else %Collect-all basket for any strange cases that don't fit any above descriptions. 
    fprintf('The number is not decreasing, increasing, or symmetrical\n'); %Prints.
end