%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: myRand.m
%
%Function used in hw6_205288439_p2 that generates a random x value given a
%y value (integral of prob. distribution function). 
% 
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x = myRand()

y = rand(); %Random num. b/t 0,1. 

x = 2 - sqrt(4-4*y); %Equation for finding the p(x) value. See report for derivation.

end