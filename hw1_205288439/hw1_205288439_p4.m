%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: Homework 1 Problem 4: Oblate Spheroid
%
% Description: Calculations/approximations involving oblate spheroid
% (Earth)'s surface area. 
%
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; close all; clear all
%% Inputs
r1 = input('What is the equatorial radius?\n'); %I ask for the equatorial and polar radius and assign input immediately to r1, r2.
r2 = input('What is the polar radius?\n');
%% Calculations 
gamma = acos(r2 / r1); %To not complicate things too much (I could have simply plugged in acos(r2 / r1) in for gamma), I precalculate and define gamma.
approx = (4 * pi * ((r1 + r2) / 2)^2); %Approximate SA function as given. 
exact = 2 * pi * (r1^2 + (r2^2/sin(gamma)) * log(cos(gamma) / (1 - sin(gamma)))); %I write the given exact function in MATLAB format. 
%% Display; printing
fprintf('Exact value is %.4e km^2, and approximate val is %.4e km^2', exact, approx); %I print the exact and approx values in scientific notation. I assume the results are in km^2, though not given in the problem. I add four digits of decimal precision.