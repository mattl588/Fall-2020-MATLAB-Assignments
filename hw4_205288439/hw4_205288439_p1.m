%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw4_205288439_p1.m
%
% Description: Explicit Euler i-t calculations in a LC circuit.
% 
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; close all; clear all 
%% Explicit Euler Calculations
times = linspace(0,20,2001);  %Setting a linspace of 2001 spaces b/t 0 and 20, inclusive. Thus, one every 0.01.
i = zeros(length(times),1); %Initializing a vector (filled w/ 0) for i for each of the 2001 values.
n = zeros(length(times),1); %Doing the same for n, which is defined by me as di/dt.
dt = 0.01; %Step size variable.
L = 1; %Inductance as required- 1 Henry.
C = 0.1; %Capacitance as required- 1 Farad.
i(1) = 1; %Initial (first entry) of i, which is 1amp.
n(1) = 0; %Initial di/dt, which is 0A/s. 

for k = 1:length(times)-1 %Iterating 2,000 times to find i(2) to i(2001)
    i(k+1) = n(k)*dt+i(k); %Explicit euler formula. See report for more.
    n(k+1) = (-1/(L*C)) * i(k)*dt + n(k); %Second derived formula that finds n(k+1)
end

plot(times, i,'-'); %Plotting results.
axis equal %Scaling x,y axes to be spaced the same.
xlabel('Time(s)', 'FONTSIZE', 16) %Labeling X with correct units; font = size 16
ylabel('Current(A)', 'FONTSIZE', 16) %Same for Y.
box on %Creates box around graph.
title('Explicit Euler I-t graph', 'FONTSIZE', 20) %Title with larger font.
%% Printing
fprintf('The frequency of i(t) is ~0.5Hz, as measured by the Data Tips option.'); %Printing approx. Frequency 