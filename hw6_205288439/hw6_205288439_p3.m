%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw6_205288439_p3.m
%
% Description: Script that takes a number of people and a number of
% iterations, generates random birthdays for each of them, and
% systematically tallies the number of people who share birthdays in the
% cohort. Then, the total number of people who share birthdays in every
% trial is divided by the total iterations, which yields the probability of
% people sharing birthdays for a given cohort size.
% 
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; close all; clear all 

numpeople = 23; %Adjustable number of people to test bdays from.
numIter = 2000; %Number of times trial is run. 

sharedbdays = zeros(numIter,1); %Instantiating array that tracks shared bdays/trial.
for k = 1:numIter
    for n = 1:numpeople
        b(n) = unidrnd(365); %Generating random numbers 1 to 365 for each cell of b array.
    end
    for i = 1:numpeople
        for j = i+1:numpeople %j starts at i+1, because if at just i, we would count people having...
            ...birthdays with themselves, which is obviously illogical.
            if b(i) == b(j)
                sharedbdays(k) = sharedbdays(k) + 1;%Searching along array. If bday vals are the same, we count...
                ...a shared birthday for the given iteration val.
            end
        end
    end
end
sharedBdays = 0; %Shared birthdays in 1x1 form; not a vector. 

for i = 1:numIter
    if sharedbdays(i) ~= 0 %Checking all of the cells where people actually have shared birthdays. 
        sharedBdays = sharedBdays + 1; %Finding total number of shared birthdays. 
    end
end

probability = sharedBdays / numIter; %Dividing total # of shared bdays by total iterations. Probability.

percentage = probability * 100;
fprintf('With %.0f people, there is a %.9f percent chance two or more people share birthdays.\n', numpeople, percentage)