%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Student: Matthew Lacaire, ID: 205288439
% File: project_205288439_p2.m
% Description: Script that provides initial conditions, loads data, makes calls to
% solver function solveSpatialSIR, plots necessary data, and animates. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initial Conditions, solvers
alpha = 0.1; %initial given conditions.
beta = 0.05;
gamma = 0.1;
tFinal = 60;

load('initialValues.mat') %Loading values. 

tic;
[t1, x1] = solveSpatialSIR(tFinal, initialConditions, alpha, beta, gamma, @RK4); %Solving with call to RK4, returns t1, x1. 
RKruntime = toc; %using tic-toc to time how long this computation takes.
fprintf('RK runtime is %.4f seconds\n',RKruntime);

tic;
[t2, x2] = solveSpatialSIR(tFinal, initialConditions, alpha, beta, gamma, @ode45); %Same for ode45, returning t2, x2.
ODEruntime = toc;
fprintf('ODE45 runtime is %.4f seconds\n',ODEruntime);
%% Plotting

figure(1) %Letting each plot be its own figure/window
plotTimeSeries(t1,x1,1,1); %Call to plotTimeSeries function, which generates three subplots...
...of susceptible, infected, and recovered values per time in a cell. 
figure(2) %Making new figures
plotTimeSeries(t1,x1,5,18); %SIR for 5,18
figure(3)
plotTimeSeries(t1,x1,30,70); %Plotting SIR for 30,70

%% Animating 
figure(4) %Establishing this as independent figure
animate(x1); %Animates results with call to animate() function.
