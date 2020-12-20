%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw7_205288439_p2.m
%
% Description: Program simulating Langton's ant for 1000 generations.
% Utilizes a 2D array (matrix) to model a board of 50*50 coordinates. The
% ant "walks" by reaching a square, discerning its "color" (value), turns
% according to this color, flips color of the square, then walks. Results
% are visualized with imagesc, and the video is saved using VideoWriter and
% related commands. 
% Video Link: https://youtu.be/ldelf92-Obs
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; close all; clear all 
%%

num_rows = 50; %number of rows
num_cols = 50; %number of columns

grid = zeros(num_rows,num_cols); %initializing grid of 50x50; playing grid.
coordx = ceil(rand()*num_rows); %Creating random initial x coordinate 
coordy = ceil(rand()*num_cols); %Random initial y 
numIter = 1000; %Number of generations
totalblackspots = zeros(numIter,1);

direction = 1; %North, East, South, West are represented by 1,2,3,4.

v = VideoWriter('LangtonWalk'); %Generating a video.



for i = 1:numIter
    
    if grid(coordy,coordx) == 0 %0 represents a "white" square. 
      if direction == 1 %Direction goes from North to East, meaning we rotate...
          ...clockwise 90 degrees.
          direction = 2;
      elseif direction == 2 %Similar logic, making direction go East to South
          direction = 3;
      elseif direction == 3 %Similar
          direction = 4;
      elseif direction == 4 %Similar
          direction = 1;
      end
    grid(coordy,coordx) = 1; %"flipping" the square to be black now. 
    else %"else" handles the grid(coordy,coordx) is 1 (black) case. 
        if direction == 1 %Rotating 90 counterclockwise. 
            direction = 4;
        elseif direction == 2 %same logic
            direction = 1;
        elseif direction == 3 %same logic
            direction = 2;
        elseif direction == 4 %same logic
            direction = 3;
        end
    grid(coordy,coordx) = 0; %flipping from 1 to 0; black to white flip.
    end
    
    if direction == 1 %If we're moving north, we move "up" by one. 
        coordy = coordy - 1; 
    elseif direction == 2 %If moving East, x value increases by one.
        coordx = coordx + 1;
    elseif direction == 3 %If moving south, y increases by 1 (further down by 1)
        coordy = coordy + 1; 
    else 
        coordx = coordx - 1; %If moving west, we move one left. 
    end
    
    if coordy > 50 %Logic for the "wrapping around" conditions. 
        coordy = 1;
    elseif coordy == 0 %If y is zero (top) we wrap around to bottom.
        coordy = 50;
    elseif coordx > 50 %If we're too far right, we wrap around to x = 1.
        coordx = 1;
    elseif coordx == 0 %If x is too far left, we wrap around to right side.
        coordx = 50;
    end
    
    totalblackspots(i) = sum(sum(grid))/(num_rows*num_cols); %Finding amount of black squares
    imagesc(grid); %Creating grid; call to display results.
    colormap(flipud(gray(256))); %Creates black-white scheme.
    title(sprintf('Iteration %.0f', i)); %Adding live title tracking iteration number
    drawnow(); %Updating window
    open(v);
    frame = getframe(gcf); %Video-writing logic
    writeVideo(v, frame);
end

close(v)

iterationvals = linspace(1,numIter,numIter); %Creating linspace of 1, 2, 3.... 998, 999, 1000 to graph against proportion of black spots.
plot(iterationvals, totalblackspots); %Plotting
title('Black spots vs. time (out of 1)');
xlabel('Iteration number');
ylabel('Proportion black spots on grid');