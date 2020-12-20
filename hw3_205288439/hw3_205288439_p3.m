%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw3_205288439_p3
% Author: Matt Lacaire
% Goal: SIR Simulation of Spread of Disease
% ID: 205288439
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;
%Susceptible, infectious, or recovered. SIR model.
%% Defining Variables
beta = 0.0026; %I define the constants beta and gamma (gamma on next line)
gamma = 0.5;
R = 0; %Initial R value R(0)
S = 700; %Initial S value S(0)
I = 1; %Initial I value I(0)
%% Euler Approximations
for t = (0.1:0.1:20) %We create a for loop for delta(t) equals 0.1. This increases by increment 0.1 all the way to 20. 
    Snew = (-beta * S * I * 0.1) + S; %Forward euler approximation. See notes on report.
    Inew = (beta * S * I - gamma * I)*0.1 + I; %Same euler approximation but for Inew.
    Rnew = (gamma * I * 0.1) + R; %Euler approximation. 
    if (Inew > I) % I try to see if the new I is less than the last. If so, I assign it as the new maxI. Knowing that the curve will resemble a bell, the highest I is the point for which I all numbers before are less.
        maxI = I; %Assigning I to maxI. 
        maxInfected = round(maxI); %I round to the nearest integer.
    end
    S = Snew; %To prepare for the next loop, I set the new S (Snew) at 0.1 to the value S so that we can approximate in the next loop.
    I = Inew; %I do the same for I.
    R = Rnew; %I do the same for R. 
    plot(0, 1,'d'); %I plot the point (0,1) because it's the one point not accounted for in the for loop. It's the initial conditions.
    hold on %I order the graph to keep the graphed point visible instead of deleting it when new points are plotted.
    plot(t, Inew,'d'); %Plotting current t vs. I (number of infected people)
    hold on %Again, ordering graph to keep all graphed points visible as new ones are added.
end
%% Output
    fprintf('Maximum Number of Infected Students: %.0f',maxI); %I print the value calculated above.
   