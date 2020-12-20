%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Student: Matthew Lacaire, ID: 205288439
% File: plotTimeSeries.m
% Description: Function that provides a 3x1 subplot of the S,I,R values of
% a given cell for the time provided. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plotTimeSeries(t, X, x, y)

Svals = squeeze(X(x,y,1,:)); %Finds Svals for all time T at x,y and removes singleton dimension.
Ivals = squeeze(X(x,y,2,:)); %Same for I
Rvals = squeeze(X(x,y,3,:)); %Same for R

subplot (3,1,1) %First subplot declaration
plot(t, Svals)
xlabel('Time')
ylabel('Proportion Susceptible')
formatSpec1 = 'Susceptibility in (%.0f,%.0f)'; %String to be passed into sprintf
S_str = sprintf(formatSpec1,x,y); %Assigning sprintf to S_str, which is a string changing with x, y inputs.
title(S_str) %Creating title with x,y values from S_str.

subplot (3,1,2) %Similar process 
plot(t, Ivals)
xlabel('Time')
ylabel('Proportion Infected')
formatSpec2 = 'Infections in (%.0f,%.0f)';
I_str = sprintf(formatSpec2,x,y);
title(I_str)

subplot (3,1,3) %Similar process as well 
plot(t, Rvals)
xlabel('Time')
ylabel('Proportion Recovered')
formatSpec3 = 'Recoveries in (%.0f,%.0f)';
R_str = sprintf(formatSpec3,x,y);
title(R_str)

filename = sprintf('time_series_%d_%d.png',x,y); %Customizing file name using sprintf with coordinates. 

saveas(gcf,filename) %Saving current figure (gcf). 
