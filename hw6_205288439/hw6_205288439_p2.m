%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw6_205288439_p2.m
%
% Description: Function that generates 10,000 random samples to approximate
% the distribution function arising from a custom probability distribution p(x) =
% -0.5x + 1 for [0 2] and zero elsewhere. Result is plotted as a histogram along with the
% actual p(x) graph for 0 to 2, which demonstrates that the 10,000 samples,
% when normalized, approximate the probability distribution function well.
% 
% 
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; close all; clear all 

numSamples = 10000; %Declaring num. of samples

for k = 1:numSamples
    y(k) = myRand(); %Filling 10000x1 array of random p(x) vals.
end


%% Graphing
x = linspace(0,2,5);
yvals = -0.5.*x + 1;
figure(1);
histogram(y, 20,'Normalization','pdf')
hold on
plot(x, yvals, 'color', 'magenta','LineWidth', 2)
xlabel('x value')
ylabel('Probability distribution function output')

hold off