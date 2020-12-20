%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Student: Matthew Lacaire, ID: 205288439
% File: project_205288439_p1.m
% Description: The main function for part (1) of the final project. Imports
% data from a given CSV, and makes a call to myPCA(). Then, constructs
% a biplot to interpret data. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Processing Data; passing function; plotting

M = csvread('covid_countries.csv', 1,2);  %Loading CSV, skipping two rows and one column

[coeffOrth, pcaData] = myPCA(M);  %Call to myPCA, which yields 

vbls = {'Infections', 'Deaths', 'Cures', 'Mortality Rate', 'Cure Rate', 'Infection Rate'}; %Labeling vectors of each component

biplot(coeffOrth,'Scores',pcaData,'Varlabels',vbls); %Plotting biplot
grid off; %Getting rid of graph grid for aesthetics 
box on; %Adding box so graph looks good in LaTeX. 
title('Principal Component Analysis Results')
