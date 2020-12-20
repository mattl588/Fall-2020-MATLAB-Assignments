%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Student: Matthew Lacaire, ID: 205288439
% File: myPCA.m
% Description: Function that receives the raw data from covid_countries CSV
% and processes it to return two principal eigenvectors and normalized
% data projected onto them. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [coeffOrth, pcaData] = myPCA(data)


ncol = length(data(1,:)); %Number of columns of data.
nrow = length(data(:,1)); %Number of rows of data

normalizedData = zeros(nrow, ncol); %Initializing array of size of data to store normalized data.

for n = 1:ncol %Performing normalization process for each column.
    avgcol = mean(data(:,n)); %Finding average column-by-column
    normalizedData(:,n) = (data(:,n) - avgcol) ./ std(data(:,n)); %Filling normalizedData matrix column-by-column.
end


covM = cov(normalizedData); %Performing covariance function on normalizedData 

[eigVectors, eigVals] = eig(covM, 'vector'); %Finding eigenvalues with the 'vector' argument...
...to get eigenvalues in a column vector.

coeffOrth = zeros(ncol, ncol); %Initializing an array for sorted eigenvectors.

for j = 1:length(eigVals) %For loop for each column. 
    [A, B] = max(eigVals); %Finding biggest eigenvalue and its address.
    coeffOrth(:,j) = eigVectors(:,B); %Putting associated eigenvector in coeffOrth.
    eigVals(B) = 0; %setting this eigval to zero for next iteration.
end

coeffOrth = coeffOrth(:, 1:2); %Taking first and second column of sorted eigenvector data

pcaData = normalizedData * coeffOrth; %Projection of normalized data onto 2D eigenvector space. 
