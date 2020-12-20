%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Student: Matthew Lacaire, ID: 205288439
% File: dynamicsSIR.m
% Description: Function that takes in number of rows (M), number of columns
% (N), linearized vector x, and parameters alpha, beta, gamma. Returns
% linearized M*N*3 array of SIR derivative data dxdt. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function dxdt = dynamicsSIR(x, M, N, alpha, beta, gamma)

xCoords = M; %Simply for labeling convenience, I take number of rows as xCoords
yCoords = N; %Same for y 

deVectorized = reshape(x, [M N 3]);  %Reshaping into M*N*3 matrix for easier calculation.

Svals = squeeze(deVectorized(:, :, 1)); %Extracting Susceptible values as an M*N matrix.
Ivals = squeeze(deVectorized(:, :, 2)); %Same for infected
Rvals = squeeze(deVectorized(:, :, 3)); %Same for recovered

ddt = zeros(M, N, 3); %Creating an M*N*3 function of zeros to fill with derivative values.


Wsum = 0; %Setting sum of W(x,y) matrix to 0. 
W = zeros(3,3); %Establishing W matrix

for i = 1:xCoords %Setting up double for loop to account for each cell in M*N.
    for j = 1:yCoords
        if (i < xCoords && j < yCoords && i > 1 && j > 1) %Implementation of the case in which...
            ... the cell is not on an edge (has eight susceptible neighbors)
        W(1,1) = (1/sqrt(2))*Ivals(i-1, j-1); %Cell to the left and below
        W(2,1) = 1*Ivals(i, j-1); %Cell below
        W(3,1) = (1/sqrt(2))*Ivals(i+1, j-1); %Cell to right and below
        W(1,2) = 1*Ivals(i-1, j); %Cell to left
        W(2,2) = 0; %In this case and in all others, W(2,2) is the center of the matrix and has weight 0.
        W(3,2) = 1*Ivals(i+1, j); %Cell to right
        W(1,3) = (1/sqrt(2))*Ivals(i-1, j+1); %Cell to left and up
        W(2,3) = 1*Ivals(i, j+1); %Cell above
        W(3,3) = (1/sqrt(2))*Ivals(i+1, j+1); %Cell to right and up
        elseif (j == 1 && i == 1) %bottom left corner, three neighbors above, to right, and upper right
        W(1,1) = 0;
        W(2,1) = 0;
        W(3,1) = 0; %Setting each nonapplicable W value to zero. 
        W(1,2) = 0;
        W(2,2) = 0;
        W(3,2) = 1*Ivals(i+1, j);
        W(1,3) = 0;
        W(2,3) = 1*Ivals(i, j+1);
        W(3,3) = (1/sqrt(2))*Ivals(i+1, j+1);
        elseif (j == yCoords && i == xCoords) %top right corner, three neighbors
        W(1,1) = (1/sqrt(2))*Ivals(i-1, j-1);
        W(2,1) = 1*Ivals(i, j-1);
        W(3,1) = 0;
        W(1,2) = 1*Ivals(i-1, j);
        W(2,2) = 0;
        W(3,2) = 0;
        W(1,3) = 0;
        W(2,3) = 0;
        W(3,3) = 0;
        elseif (i == 1 && j == yCoords) %top left corner, three neighbors as well
        W(1,1) = 0;
        W(2,1) = 1*Ivals(i, j-1);
        W(3,1) = (1/sqrt(2))*Ivals(i+1, j-1);
        W(1,2) = 0;
        W(2,2) = 0;
        W(3,2) = 1*Ivals(i+1, j);
        W(1,3) = 0;
        W(2,3) = 0;
        W(3,3) = 0;
        elseif (i == xCoords && j == 1) %Bottom right corner, three neighbors
        W(1,1) = 0;
        W(2,1) = 0;
        W(3,1) = 0;
        W(1,2) = 1*Ivals(i-1, j);
        W(2,2) = 0;
        W(3,2) = 0;
        W(1,3) = (1/sqrt(2))*Ivals(i-1, j+1);
        W(2,3) = 1*Ivals(i, j+1);
        W(3,3) = 0;
        elseif (i == 1 && j ~=1 && j ~= yCoords)% Left Side, five neighbors
        W(1,1) = 0;
        W(2,1) = 1*Ivals(i, j-1);
        W(3,1) = (1/sqrt(2))*Ivals(i+1, j-1);
        W(1,2) = 0;
        W(2,2) = 0;
        W(3,2) = 1*Ivals(i+1, j);
        W(1,3) = 0;
        W(2,3) = 1*Ivals(i, j+1);
        W(3,3) = (1/sqrt(2))*Ivals(i+1, j+1);
        
        elseif (i == xCoords && j ~=1 && j ~= yCoords)% Right Side, five neighbors
        W(1,1) = (1/sqrt(2))*Ivals(i-1, j-1);
        W(2,1) = 1*Ivals(i, j-1);
        W(3,1) = 0;
        W(1,2) = 1*Ivals(i-1, j);
        W(2,2) = 0;
        W(3,2) = 0;
        W(1,3) = (1/sqrt(2))*Ivals(i-1, j+1);
        W(2,3) = 1*Ivals(i, j+1);
        W(3,3) = 0;
        elseif (j == yCoords && i ~=1 && i ~= xCoords)% Top, five neighbors
        W(1,1) = (1/sqrt(2))*Ivals(i-1, j-1);
        W(2,1) = 1*Ivals(i, j-1);
        W(3,1) = (1/sqrt(2))*Ivals(i+1, j-1);
        W(1,2) = 1*Ivals(i-1, j);
        W(2,2) = 0;
        W(3,2) = 1*Ivals(i+1, j);
        W(1,3) = 0;
        W(2,3) = 0;
        W(3,3) = 0;
        elseif (j == 1 && i ~=1 && i ~= xCoords)%Bottom, five neighbors
        W(1,1) = 0;
        W(2,1) = 0;
        W(3,1) = 0;
        W(1,2) = 1*Ivals(i-1, j);
        W(2,2) = 0;
        W(3,2) = 1*Ivals(i+1, j);
        W(1,3) = (1/sqrt(2))*Ivals(i-1, j+1);
        W(2,3) = 1*Ivals(i, j+1);
        W(3,3) = (1/sqrt(2))*Ivals(i+1, j+1);
       
        end
        
        Wsum = sum(W,'all'); %summing all W as required in ddt formulas. 
        
        ddt(i,j,1) = -(beta * Ivals(i,j) + alpha*Wsum)*Svals(i,j); %Formula for dS(x,y)dt in position (:,:,1)
        
        ddt(i,j,2) = (beta*Ivals(i,j) + alpha*Wsum)*Svals(i,j) - gamma*Ivals(i,j); %Same for infected values
 
        ddt(i,j,3) = gamma * Ivals(i,j); %Same for recovered values. 
    end
end


dxdt = ddt(:); %Vectorizing the M*N*3 matrix into column vector to return. 
