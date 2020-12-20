%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw6_205288439_p1.m
%
% Description: Script using Monte Carlo approximation with 100, 1000,
% 10000, and 100,000 iterations to calculate the integral of (1/x^3+1) for
% domain [0 10]. Results are then graphed and compared to the numerical
% solution provided by MATLAB's int function. 
% 
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; close all; clear all 

numIter = [100 1000 10000 100000]; %Number of iterations array

%% Iteration logic and calculation
for k = 1:1:length(numIter) %For loop that generates random values along the domain. Range is (0 1)
    for j = 1:1:numIter(k)
        x(j) = 10*rand(); %X coordinates of random points
        y(j) = rand(); %Range is (0 1) because I know that the function is never more than 1 for x >=0. 
    end
    integralhits = (y <= (ones(length(numIter(k))) ./ (x.^3 + 1))); %Generating ...
    ...bool array of points under curve.
    integral(k) = 10.*sum(integralhits) / (numIter(k)); % Integral estimate for given numIter...
... also multiplied by 10 because the area of the coordinates is 10; integral is thus 10x simple probability.
end



%% Plotting, exact answer
syms x  %Symbolic x variable
f = 1/(x^3 + 1); %Defining function 
exactintegral = double(int(f, 0, 10)); %Converting symbolic to double format; calculating integral beforehand

figure(1);
semilogx(numIter, integral, 'color','red') %Log. x axis for visibility; graphing iteravions vs. estimates
hold on %Allowing 
yline(exactintegral, 'color', 'blue') %Graphing a horizontal line of the exact val in blue
ylim([0.8 1.5]) %Constraining y vals for visibility
xlabel('Number of points')
ylabel('Integral Output')
legend({'Approximations','Exact'})
hold off