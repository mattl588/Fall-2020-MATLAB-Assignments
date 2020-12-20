%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% biSection.m, a function that uses the bisection method to find roots of a
% given function. Outputs are the root within tolerance tol, and numIter
% (number of iterations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [xRoot, numIter] = biSection(f, a, b, tol)


nMax = (log(b-a) - log(tol) / log(2)); %nMax calculated w/given formula.
xRoot = 0;  %instantiating xRoot. 
numIter = 1; %Initial number of iterations.
continueLoop = true; %flag variable set to true.
while (numIter <= nMax && continueLoop)
    xRoot = (a+b)/2; 
    if (f(xRoot) == 0  || (b-a)/2 < tol) %If function of x value (xRoot) has output 0
        ...or the tolerance is satisfied, we stop the loop. 
        fprintf('%f', xRoot);
        continueLoop = false; %Ending while loop
    end
    numIter = numIter + 1; %Adding one more to numIter per loop.
    if (sign(f(xRoot)) == sign(f(a)))
        a = xRoot;
    else
        b = xRoot;
    end
end

numIter = numIter - 1; %Actual number of iterations. Remember, we start with iter = 1, then
... after the first iteration, this becomes two. Since numIter is off by one, we have to subtract 1. 