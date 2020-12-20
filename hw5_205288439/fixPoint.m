%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fixPoint.m, a function that uses the fixed point method to find roots of a
% given function and also the fixed point. Outputs are the root within
% tolerance tol, and xStar (actual fixed point of original function).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [xStar, xRoot] = fixPoint(f2, x0, tol, maxIter)
%Declaring function that returns 

iter = 1; %Iteration tracking variable. 
x = zeros(length(maxIter)); %Initializing array of zeros for xRoot values. 
y = zeros(length(maxIter)); %Initializing array of zeros for xStar values (the fixed point of original f(x)).
x(1) = x0; %Initializing first elements to initial guess.
y(1) = x0;
while(abs(f2(x(iter) - x(iter)) > tol && iter < maxIter)) %While loop with conditions ensuring 
    ...iteration continues until max iterations or accuracy is achieved.
    x(iter+1) = f2(x(iter)); %Assigning f2(x) to x(n+1). This is for the roots case. 
    y(iter+1) = f2(y(iter)) - y(iter); %This is the same, with y(iter) subtracted to find fixed point of f(x), not root.
    iter = iter + 1; %increasing iteration by one. 
end

xRoot = x(maxIter); %Assigning final value (when loop stops) to final (most accurate) value. 
xStar = y(maxIter); %Same for fixed point. 
