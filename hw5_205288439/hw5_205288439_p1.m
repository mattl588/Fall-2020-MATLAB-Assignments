%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw5_205288439_p1.m
%
% Description: A script using the bisection/fixpoint method to find roots. 
% 
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; close all; clear all 
%% Bisection Method
b = 2; %Upper bound
a = 1; %Lower bound
tol = 1e-5; %Can be adjusted; tolerated error.
f = @fun1; %reference to fun1; function handle. 

[xRoot, numIter] = biSection(f,a,b,tol); %running instance of biSection with parameters f(fun1), a, b, tol.

fprintf('Approx. root is %.10f, done in %.0f iterations\n', xRoot, numIter) %Displaying outputs.

%% Fixed point iteration

maxIter = 100; %Maximum allowable iterations

f2 = @fun2; %Function handle; assigning f2 to fun2.
x0 = 0; %Initial guess.
[xStar, xRoot2] = fixPoint(f2, x0, tol, maxIter); %Calling fixPoint, getting xStar, xRoot values.

fprintf('Approx. root is %.10f, with fixed point %.5f\n', xRoot2, xStar) %Displaying
