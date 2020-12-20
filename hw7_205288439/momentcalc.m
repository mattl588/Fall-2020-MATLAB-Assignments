%%%%%%%%%%%%%%%%%%%%%%%
% function momentcalc.m
% Function that takes vector x, number of points N, applied pressure P,
% length of object L, and distance from end d that force is applied. Function
% returns the moment of each x coordinate of the vector. 
% 
%%%%%%%%%%%%%%%%%%%%%%%



function M = momentcalc(x, N, P, L, d)

for k = 1:N %Looping for each cell of the vector.
    if x(k) <= d %Implementation of function (2) on homework in a for loop.
        M(k) = P*(L-d)*x(k) / L;
    else
        M(k) = P*d*(L-x(k))/L;
    end
end