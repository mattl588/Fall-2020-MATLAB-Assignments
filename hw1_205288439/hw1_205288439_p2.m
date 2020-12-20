%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: Homework 1 Problem 2: Sterling's Approximation
%
% Description: A script that compares a large factorial-approximating
% function and the true value, while also computing and displaying percent
% error.
%
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; close all; clear all %Clears everything and closes windows. 
%% Inputs
n = input('Enter a value of n:'); %I request an input number 'n' from the user and assign the value to the 'n' variable.
%% Algorithms 
a = factorial(n); %Function "factorial()" provides an exact factorial value of argument within parentheses, in this case n. Thus, the new variable a = n!
b = sqrt(2 * pi * n) * (n / exp(1) )^n; %Sterling's formula, in MATLAB format. Note that * is multiplication, ^ is exponents, pi is the irrational constant, and exp(1) is simply e^1.
c = ((a - b) / a) * 100; %Percent error calculation. I assign the calculated value to 'c', which is later printed. 
%% Display; Output
fprintf('n! exact) %.0f\n', a); %Printing a (exact value) in place of "%f".
fprintf('n! approx) %.0f\n', b); %Printing approximate value based on Sterling's Approximation. Note that the ".0" argument makes it such that there are zero decimal digits of precision (no decimal values). This is in keeping with the example code on the HW.
fprintf('error: %f%%', c); %Printing the error. The format-specifying function of % is "escaped" by putting %%, which adds a suffix of %.