%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Student: Matthew Lacaire, ID: 205288439
% File: RK4.m
% Description: Function that provides a fourth-order Runge-Kutta ode
% solving method. takes in function handle, timespan, and initial condition
% and returns numerical solutions along with time vector.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [t, y] = RK4(f, tspan, y0)

h = 0.1; %Fixed step size 0.1

t = tspan(1):h:tspan(2); %Array of times to test on 

y = zeros(length(y0),length(t)); %Establishing the array of #rows initial conditions,...
...and #rows as time points.

y(:,1) = y0;  %Setting first column as ICs.

nSteps = length(t) - 1;  %number of time steps 

for k = 1:nSteps %For loop that involves Runge-Kutta calculation
    y_n = y(:,k); %Creating y_n as kth column
    t_n = t(k); %Establishing time at point k
    
    k1 = h*f(t_n,y_n); %Next four lines are just implementation of RK equations
    k2 = h*f(t_n + 0.5*h, y_n + 0.5*h*k1);
    k3 = h*f(t_n + 0.5*h, y_n + 0.5*h*k2);
    k4 = h*f(t_n+h,y_n+h*k3);
    
    y_nplus1 = y_n + ((k1 + 2*k2 + 2*k3 + k4)/6); %Weighted average of k vals, adding to previous y_n
    y(:,k+1) = y_nplus1;  %Storing results in y. 
end


t = permute(t, [2 1]); %Minor detail (unnecessary), but puts RK time vector in T*1 instead of 1*T to stay in line with ODE45.
