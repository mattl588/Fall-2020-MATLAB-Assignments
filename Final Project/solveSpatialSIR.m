%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Student: Matthew Lacaire, ID: 205288439
% File: solveSpatialSIR.m
% Description: Intermediary function that takes in a final t, array of
% initial conditions, parameters, and a type of ODE solver. Returns time
% values along with the reshaped 4D array in M*N*3*T. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [t, x] = solveSpatialSIR(tFinal, initialCondition, alpha, beta, gamma, odeSolver)


times = [0 tFinal]; %Setting up vector of time bounds.

M = size(initialCondition, 1); %Number of rows (xvals)
N = size(initialCondition, 2); %Number of columns(yvals)

linearized = initialCondition(:); %Linearizing into M*N*3 matrix.


dSIRdt = @(t,x) dynamicsSIR(x, M, N, alpha, beta, gamma); %Creating function handle dSIRdt...
...that represents dynamicsSIR.


[t, x] = odeSolver(dSIRdt, times, linearized); %solving with given ODE solver method...
... with linearized as initial condition.


x = reshape(x, [M N 3 length(t)]); %Reforming as M*N*3*T vector. 

