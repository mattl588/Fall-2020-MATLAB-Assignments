%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: Homework 1 Problem 3: Law of Sines and Cosines
%
% Description: A script that relates angles and side lengths of a triangle
% using Law of Sines/Law of Cosines
%
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; close all; clear all
%% Variable Assignment
a = 10; %For organization, I create a section for assigning variables. I assign values to new variables a, b, c.
b = 20;
c = 25;
%% Law of Cosines Calculation
alpha = acos(((c^2) + (b^2) - (a^2))/ (2 * b * c)); %I rearrange the law of cosines to solve for angle alpha. Note that "acos" is arccos. 
%% Law of Sines Calculation 
beta = rad2deg(asin(sin(alpha)* b / a));% I find beta value by rearranging the law of sines. In the same calculation, I use "rad2deg" which converts the answer to degrees before assigning it to the variable.
gamma = rad2deg(asin(sin(alpha)* c / a)); % Finding gamma value through rearranging. Also used rad2deg function to get degree value.
correctgamma = 180 - gamma; %Range of arcsin is [-pi/2, pi/2]. Because sin(180-n) = sin(n), I need to adjust for this to get correct gamma. 
%% Output
fprintf('According to Law of Cosines, alpha is %.2f degrees.\n', rad2deg(alpha)); %Printing. ".2" refers to two degrees of decimal precision. Before printing, I turn alpha into degrees (it is still in radians by default).
fprintf('According to Law of Sines, beta is %.2f degrees, and gamma is %.2f degrees.\n', beta, correctgamma); % I do the same printing process with fprintf to explain myself and write what's necessary. 
fprintf('Note also that the Law of Sines produces either the required angle or 180 minus the angle. \nThe original gamma is calculated as %.2f, which is not visually accurate (gamma is obtuse).\n', gamma);
fprintf('For confirmation, the correct gamma, beta, and alpha sum to 180, as %.2f, %.2f, and %.2f sum to 180.\n', rad2deg(alpha), beta, correctgamma);