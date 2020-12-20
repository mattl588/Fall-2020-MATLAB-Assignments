%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw2_205288439_p2.m
%
% Description: Script involving a pseudo-array composed of NxM points. Does
% some arithmetic and uses conditionals to determine a given cell's
% "neighbors"
%
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; close all; clear all;
%% Input; Input Handling
numRows = input('How many rows does the grid have?\n'); %I take input of rows.
numCols = input('How many columns does the grid have?\n'); %I take input of columns.
P = input('What is the cell we are evaluating?\n'); %Cell position. 
area = numRows * numCols; %"area" acts as not only area, but also as the highest-numbered cell (bottom right cell)
if ((numRows < 3 || numCols < 3) || (P < 1 || P > area))  %Logical OR to make sure grid isn't 3x3 or smaller or P is less than one or bigger than area (highest cell value)
    error('Invalid Input.'); %Produces error message.
end
%% Evaluation
%Cases: Eight neighbors (inside), three (corner), five(side)
if (P == 1 || P == area || P == numRows || P == area - numRows + 1) %% Use of logical OR to determine four possible corner node situations.
    fprintf('Corner Node.\n')
    if (P == 1) %Top-right corner. If P = 1, we're in the top right corner and have three neighbors as declared below.
        n1 = P + 1;
        n2 = P + numRows; %This logic is found throughout the program. adding "numRows" references the cell immediately right of a given cell.
        n3 = P + numRows + 1;
        fprintf('Neighbors: %.0f, %.0f, %.0f', n1, n2, n3); %Displays answers.
    elseif (P == area) %Case of bottom-right. Also has three neighbor possibilities
        n1 = P - 1;
        n2 = P - numRows;
        n3 = P - numRows - 1; %Cell to left and up of P.
        fprintf('Neighbors: %.0f, %.0f, %.0f', n1, n2, n3); %Displays.
    elseif (P == numRows) %Case of bottom-left. Three neighbors.
        n1 = P - 1;
        n2 = P + numRows;
        n3 = P + numRows - 1;
        fprintf('Neighbors: %.0f, %.0f, %.0f', n1, n2, n3);
    else %case when P == area - numRows + 1 (upper right corner)
        n1 = P + 1;
        n2 = P - numRows;
        n3 = P - numRows + 1;
        fprintf('Neighbors: %.0f, %.0f, %.0f', n1, n2, n3);
    end
elseif (rem(P, numRows) == 1 || rem(P, numRows) == 0 || P < numRows || P > area - numRows + 1) %% Border cells (five neighbors)
    if (rem(P, numRows) == 1) %We can figure out that all values of P in the top row have remainder 1 when divided by numRows. 
        n1 = P - numRows; %Five neighbors using similar logic as seen before.
        n2 = P + numRows + 1;
        n3 = P - numRows + 1;
        n4 = P + numRows;
        n5 = P + 1;
        fprintf('Neighbors: %.0f, %.0f, %.0f, %.0f, %.0f', n1, n2, n3, n4, n5); %Neighbors printed.
    elseif(rem(P, numRows) == 0) %All cells on bottom row have a remainder of 0 when divided by number of rows. This section deals w / P on bottom row (non-corner)
        n1 = P - numRows;
        n2 = P + numRows;
        n3 = P - 1;
        n4 = P - numRows - 1;
        n5 = P + numRows - 1;
        fprintf('Neighbors: %.0f, %.0f, %.0f, %.0f, %.0f', n1, n2, n3, n4, n5);
    elseif(P < numRows) %This deals with the leftmost-column P values (on the edge). 
        n1 = P + 1;
        n2 = P - 1;
        n3 = P + numRows;
        n4 = P + numRows - 1;
        n5 = P + numRows + 1;
        fprintf('Neighbors: %.0f, %.0f, %.0f, %.0f, %.0f', n1, n2, n3, n4, n5);
    else % right side border (non-corner) process. This is the (P > area - numRows + 1) case. 
        n1 = P - 1;
        n2 = P + 1;
        n3 = P - numRows;
        n4 = P - numRows + 1;
        n5 = P - numRows - 1;
        fprintf('Neighbors: %.0f, %.0f, %.0f, %.0f, %.0f', n1, n2, n3, n4, n5);
    end
else %Best for last. The interior cells. Prints eight neighbors. 
    n1 = P - 1;
    n2 = P + 1;
    n3 = P + numRows;
    n4 = P + numRows - 1;
    n5 = P + numRows + 1;
    n6 = P - numRows;
    n7 = P - numRows + 1;
    n8 = P - numRows - 1;
    fprintf('Neighbors: %.0f, %.0f, %.0f, %.0f, %.0f, %.0f, %.0f, %.0f', n1, n2, n3, n4, n5, n6, n7, n8); %Prints.
end
    