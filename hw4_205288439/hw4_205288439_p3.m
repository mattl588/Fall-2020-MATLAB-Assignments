%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw4_205288439_p3.m
%
% Description: Implicit Euler solver using Newton's method.
% 
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; close all; clear all 
times = linspace(0,20,2001); %Setting all equally-spaced t values, 2001 values b/t 0,20 (inclusive)
iR1 = zeros(length(times),1); %Initializing zero-arrays for i, a (di/dt) to be filled with values later.
aR1 = zeros(length(times),1); %Same for all other rows in this section.
iR2 = zeros(length(times),1);
aR2 = zeros(length(times),1);
iR3 = zeros(length(times),1);
aR3 = zeros(length(times),1);

dt = 0.01; %Step size
L = 1;  %Inductance = 1H
C = 0.01; %Capacitance = 0.01F
iR1(1) = 0; %Initial i, a values.
aR1(1) = 1;
iR2(1) = 0;
aR2(1) = 1;
iR3(1) = 0;
aR3(1) = 1;

Rvals = [0.2, 2, 20];
%% R = 0.2 ohms
for k = 1:length(times)-1
    x = [iR1(k);aR1(k)];  %Setting up x column matrix as specified.
    f1 = (x(2) - aR1(k))/dt + (Rvals(1)/L)*x(2)+(1/(L*C))*x(1); %f1 equation, which is set equal to 0.
    f2 = x(2) - (x(1) - iR1(k))/dt; %f2 equation
    y = [f1; f2]; %Creating column matrix.
    while norm(y) > 1e-6 %'norm' being square root of (f1(k+1)^2) + (f2(k+1)^2)
        J = [1/(L*C), (1/dt + (Rvals(1)/L)); -1/dt, 1]; %Creating Jacobian matrix.
    x = x - J\y; %Solving for new x, J\y finds delta(x), where J*delta(x) = y
    f1 = (x(2) - aR1(k))/dt + (Rvals(1)/L)*x(2)+(1/(L*C))*x(1); %Redefining f1
    f2 = x(2) - (x(1) - iR1(k))/dt; %Redefining f2 with new x values.
    y = [f1; f2]; %
    end
    iR1(k+1)=x(1); %Defining next i as x(1) value calculated.
    aR1(k+1)=x(2); %Same for a.
end
%% R = 2 ohms
for k = 1:length(times)-1 %This is the exact same methodology as above. check "R = 0.2 ohms" section for explanation.
    x = [iR2(k);aR2(k)]; 
    f1 = (x(2) - aR2(k))/dt + (Rvals(2)/L)*x(2)+(1/(L*C))*x(1);
    f2 = x(2) - (x(1) - iR2(k))/dt;
    y = [f1; f2];
    while norm(y) > 1e-6
        J = [1/(L*C), (1/dt + (Rvals(2)/L)); -1/dt, 1];
    x = x - J\y;
    f1 = (x(2) - aR2(k))/dt + (Rvals(2)/L)*x(2)+(1/(L*C))*x(1);
    f2 = x(2) - (x(1) - iR2(k))/dt;
    y = [f1; f2];
    end
    iR2(k+1)=x(1);
    aR2(k+1)=x(2);
end
%% R = 20 ohms
for k = 1:length(times)-1
    x = [iR3(k);aR3(k)]; 
    f1 = (x(2) - aR3(k))/dt + (Rvals(3)/L)*x(2)+(1/(L*C))*x(1);
    f2 = x(2) - (x(1) - iR3(k))/dt;
    y = [f1; f2];
    while norm(y) > 1e-6
        J = [1/(L*C), (1/dt + (Rvals(3)/L)); -1/dt, 1];
    x = x - J\y;
    f1 = (x(2) - aR3(k))/dt + (Rvals(3)/L)*x(2)+(1/(L*C))*x(1);
    f2 = x(2) - (x(1) - iR3(k))/dt;
    y = [f1; f2];
    end
    iR3(k+1)=x(1); 
    aR3(k+1)=x(2);
end
%% Plotting
plot(times, iR1) %Plotting
hold on %Allowing multiple graphs to be plotted
plot(times, iR2) %Plotting R=2
plot(times, iR3) %Plotting R=20
legend({'R = 0.2 ohms','R = 2 ohms','R = 20 ohms'}, 'box','off')%legend
title('I-t graph for select resistances (Newton Method)') %Title
xlabel('Time (s)') %X label
ylabel('Current (A)')%Y label
hold off