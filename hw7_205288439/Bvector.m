%%%%%%%%%%%%%%%%%%%%%%%
% function Bvector.m
% Function that takes dx (length b/t x values), Mval array, E modulus of
% elasticity, and moment of inertia I. Returns B array of length N derived 
% from Taylor Expansions, which is used in the main script to later solicit 
% an array of y values(deflection). 
% 
%%%%%%%%%%%%%%%%%%%%%%%




function B = Bvector(dx, Mvals, E, I)

N = length(Mvals); %Determining number of iterations.
B = zeros(N, 1); %Initializing array to store results.

for k = 2:N-1 %B(2) to B(N-1) are calculated here according to this formula.
    B(k) = dx^2*Mvals(k)/(E*I);
    
end

B(1) = 0; %Per boundary conditions, B(1) = 0, B(N) = 0.
B(N) = 0;