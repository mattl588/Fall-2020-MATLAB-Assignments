%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw3_205288439_p1
% Author: Matt Lacaire
% Goal: Fibonacci/ Taylor series estimations of the golden ratio.
% ID: 205288439
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all
%% Inputs
uncertainty = input('Input your acceptable uncertainty value\n'); %Takes input of uncertainty value. 
if (uncertainty <= 0 || uncertainty > 0.1)  %Checks for invalid inputs. Uncertainty is usually a small decimal, so I found it unreasonable to have it larger than 0.1. This is personal choice.
    error('Invalid Input.\n') %Prints error if inputs are invalid.
end
%% Part B Calculations; Taylor Series
exactVal = 2 * cos(deg2rad(36)); %I define the "exact" value (not exact due to limitations of computation), so I can compare it to approximations later.
continueLoop = true; %I define a boolean that is utilized below in loop.
iterations = 0; %This the same as having "n" Taylor terms. This is used to tally total iterations of the loop below. 
result = 0; %This is the result of the nth Taylor term and all of the terms before. I defined it here because if it's inside the loop, it would repeatedly be set to 0.
while(continueLoop == true)
    prefix = 2*((-1)^iterations); %This is the (-1)^n part, and I multiply it by two because we're approximating 2cos(36) and not cos(36), meaning each term is also multiplied by 2.
    xval = ((deg2rad(36))^(2*iterations)); %This is the part x^2n.
    factorialpart = factorial((2 * iterations)); %Factorial denominator part. 
    result = result + (prefix * xval) / factorialpart; %I put together all of the parts of each term above, and add it to the previous result. When this loop is repeated, the result becomes the nth term plus all terms before.
    iterations = iterations + 1; %The number of times this loop has been run. As mentioned before, this equals having done "n" terms.
    if (abs(result - exactVal) <= uncertainty) %For safety, I take abs() of the difference b/t the approxmation and the "exact" answer. If the difference is sufficiently small, we stop the loop.
        continueLoop = false; %Loop condition is now not satisfied. The loop ends the instant the tolerance (uncertainty) is sufficiently small.
    end
end
%% Part C; Fibonacci Sequence
continueSeries = true; %Flag variable instantiated.
nthterm = 2; %We know the first two terms of the sequence are 0,1. Thus, the nth term is already 2 plus what happens in the loop.
    valminustwo = 0; %I declare the first digit of the fib. sequence as 0
    valminusone = 1; %I declare the second digit of the fib. sequence.
while(continueSeries)
    newval = valminusone + valminustwo; %I get the "newval" or the new value of the fib. sequence by summing previous two.
    fibratio = newval / valminusone; %I evaluate the golden ratio by dividing the new fib. digit by the one before it.
    nthterm = nthterm + 1; %I add 1 to "nthterm" to indicate which nth term of the fibonacci ratio is used. 
    valminustwo = valminusone; %I prepare for the next loop by making the current second-highest digit the third-highest digit.
    valminusone = newval; %I do the same by making the new highest fib. value the second-highest digit.

    if (abs(fibratio - exactVal) <= uncertainty) %I check again for accuracy.
        continueSeries = false; %If accuracy is achieved, the series immediately stops.
    end
end
%% Output; Output calculations
fprintf('Approximate Taylor Series value: %.15f, done after %.0f Taylor terms.\n',result,iterations); %I output approx. Taylor series and number of terms to get there. 15 digits of decimal precision for safety.
fprintf('Approximate Fibonacci Series value: %.15f, done after %.0f Fibonnaci digits, with the last being %.0f\n',fibratio,nthterm, newval); %I output approx. Fibonacci digits and the nth fib. digit to achieve this.