%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Student: Matthew Lacaire, ID: 205288439
% File: animate.m
% Description: Function that animates the RK data every tenth frame in red,
% green, and blue colors using the image() function of MATLAB. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function animate(X)

Z = X(:,:,1,:); %Placeholder that holds first index in 3rd dimension (S values)
X(:,:,1,:) = X(:,:,2,:);  %"Infected" set to first index (red)
X(:,:,2,:) = X(:,:,3,:); %"Recovered" set to second index (green)
X(:,:,3,:) = Z; %"Susceptible" set to third index (blue)
for k = 1:floor(size(X,4) / 10) %For loop with image displayed every ten frames.

    z = X(:,:,:,10*k); %Finding 10*k-th  value of the M*N*3 matrix and imaging it
    image(z)
    title('SIR model over time') %Titling
    xlabel('Y coordinates') %Matrix ordering in MATLAB is in (-y,x) because it's (#row, #col). Thus, we can compensate by switching axes.
    ylabel('X coordinates')
    pause(0.1) %Pausing 0.1s
end
