%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw4_205288439_p2.m
%
% Description: Semi-Implicit Euler calculations in an LRC circuit.
% 
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; close all; clear all 
%% Calculations
times = linspace(0,20,2001); %Creating 2001 "times" every 0.01 from 0 to 2000
iR1 = zeros(length(times),1); %Creating empty 2001x1 matrix for R = 0.2. 
nR1 = zeros(length(times),1);  %Same for di/dt. 
iR2 = zeros(length(times),1);   %Same as previous two, but for Resistance = 2 ohms.
nR2 = zeros(length(times),1);
iR3 = zeros(length(times),1);   %Same as before, but for R = 20 ohms.
nR3 = zeros(length(times),1);
dt = 0.01; %Step size.
L = 1; %1H inductance.
C = 0.01; %0.01F capacitance
iR1(1) = 0; %Initializing i(1); initial i value for R = 0.2 ohms.
iR2(1) = 0; %Same for R = 2 ohms
iR3(1) = 0;
nR1(1) = 1; %Initial n (di/dt) values.
nR2(1) = 1;
nR3(1) = 1;
Rvals = [0.2, 2, 20]; %Possible Resistance values.

for k = 1:length(times)-1 %For loop using semi-explicit equations (R = 0.2ohms)
        nR1(k+1) = (((-Rvals(1) / L) * nR1(k)) - (1/(L*C))*iR1(k))*dt + nR1(k); %Finding di/dt for n+1. 
        iR1(k+1) = nR1(k+1)*dt + iR1(k); %Finding i(k+1)
end
for k =1:length(times)-1 %Same for R = 2 ohms.
        nR2(k+1) = (((-Rvals(2) / L) * nR2(k)) - (1/(L*C))*iR2(k))*dt + nR2(k);
        iR2(k+1) = nR2(k+1)*dt + iR2(k);
end
for k =1:length(times)-1 %Same for R = 20 ohms.
        nR3(k+1) = (((-Rvals(3) / L) * nR3(k)) - (1/(L*C))*iR3(k))*dt + nR3(k);
        iR3(k+1) = nR3(k+1)*dt + iR3(k);
end
%% Plotting
plot(times, iR1) %Plotting for R=0.2
hold on %Making sure previous graphs aren't overwritten/erased as new ones are added.
plot(times, iR2) %Plotting R = 2
plot(times, iR3) %Plotting R = 20
legend({'R = 0.2 ohms','R = 2 ohms','R = 20 ohms'}, 'box','off') %Creating a legend, with no box around it.
title('I-t graph for select resistances')
xlabel('Time (s)')
ylabel('Current (A)')
hold off %For good coding practices, I turn off the "hold". 

%% Damping Coefficients
cof1 = (Rvals(1)/2)*sqrt(C/L); %I calculate the coefficients of damping based on the given equation.
cof2 = (Rvals(2)/2)*sqrt(C/L);
cof3 = (Rvals(3)/2)*sqrt(C/L);
fprintf('The 0.2ohm circuit has damping coefficient %.5f, 2ohm is %.5f, and 20 ohm is %.5f',cof1, cof2, cof3); 
%Printing the coefficients.