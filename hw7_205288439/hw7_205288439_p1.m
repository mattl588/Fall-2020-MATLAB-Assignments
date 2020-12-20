%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw7_205288439_p1.m
%
% Description: A script running through calculations with Euler-Bernoulli
% Beam Bending. I calculate the deflection of a nitinol alloy beam
% subjected to a point load by solving systems of equations. Then, I graph
% results. 
% 
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; close all; clear all 
%% Initializing Variables
L = 1; %Length = 1m
ro = 0.1; %Outer radius, 0.1m
ri = 0.06; %Inner radius, 0.06m.
d = 0.8; %x value of force; 0.8m from left side.
P = 1000; %Force applied, 1000N
E = 65e9; %65GPa of mod. of elasticity
I = pi*(ro^4 - ri^4) / 4; %Moment of inertia
N = 100; %Number of points tested. 
dx = L/(N-1); %Distance between each point N.
x = linspace(0,L,N); %Generating N evenly-spaced points along L.
y = zeros(0,L,N); %initializing array for y (deflection) values
Mvals = momentcalc(x, N, P, L, d); %Call to Mvals function, finds Mval for...
...each x value and stores it in a new "Mvals" array.
A = zeros(N,N); %Instantiating "A" matrix as mentioned in discussion.
B = Bvector(dx, Mvals, E, I); %Creating the B array as mentioned in discussion; ...
... call to Bvector function. 



for i = 1:N %Populating matrix a per set of rules explained in discussion.
    for j = 1:N
        if (i == j) && (i == 1 || i == N)
            A(i,j) = 1;
        elseif (i == j)
            A(i,j) = -2;
            A(i,j-1) = 1;
            A(i,j+1) = 1;
        end
    end
end
%% Solving solutions, plotting (Part C)

y = A\B;  %Per discussion, Ay = B, such that y = inverse(A)*B, denoted by A\B...
...solving for y array (deflection at each point x)

plot(x, y, 'o-'); %Plotting deflection vs. x, "o" markers as points. 
title('Deflection vs. x');
xlabel('X displacement (m)');
ylabel('Y displacement (m)');

[Value, Location] = min(y); %Finding the value (max deflection) and associated address.

fprintf('For N = %.0f, we have max displacement %dm, which occurs at x = %.3fm\n', N, Value, x(Location));
% Printing for convenience. 

c = min(d, L-d); %Per problem specification, required function for estimate.
ytheo = (P*c*(L^2-c^2)^1.5)/(9*sqrt(3)*E*I*L); %Theoretical y.

error = abs(ytheo - abs(Value));
fprintf('Error between theoretical max deflection and measured is %d', error');

