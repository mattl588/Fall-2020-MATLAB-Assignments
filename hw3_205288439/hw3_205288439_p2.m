%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: hw3_205288439_p2
% Author: Matt Lacaire
% Goal: Game involving guessing a number between 1 and 50! 
% ID: 205288439
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;
%% Setup
tries = 0; %I declare a "tries" variable, and set it equal to 0.
value = randi([1,50]); %I generate the number to be guessed; random b/t 1 and 50.
gameOver = false; %I create a boolean value that is declared to be false. This will be used as a condition in the while loop.

while(~gameOver) %While gameOver is false (as it was initialized), the loop continues.
    guess = input('Input your guess\n'); %Taking input of guess.
    if (guess < 1 || guess > 50 || guess ~= floor(guess))
        guess = input('Invalid input. Try again.\n');
    end
    tries = tries + 1; %Automatically adding one to the number of tries made once input is entered. 
    if (guess == value && tries <= 5) %If the guess is correct AND the user is on the fifth or lower try, the game is won.
        fprintf('Nice Guess, you found my number!\n'); %Prints victory message.
        winresult = input('Do you want to play again? (Y/N)\n','s'); %Asks user for "Y" or "N" input to try to play again.
        if (winresult == 'Y')
            tries = 0; %Resets tries to 0. Essentially allows user to now have five new tries.
            value = randi([1,50]); %Generates new random number by redefining "value".
        elseif (winresult == 'N') 
            gameOver = true; %gameOver is now true. In other words, the loop is ceased. 
            fprintf('Game ended.\n'); %Prints game ending message.
        else
            error('Invalid input.\n'); %Just in case the user inputs something other than Y/N, we need to remind the user the input is invalid.
        end
    elseif (guess ~= value && tries == 5) %If the user is wrong on the guess AND has exhausted all tries (has completed the 5th try), this is executed.
        fprintf('Out of tries, better luck next time.\n'); %Losing message printed.
        loseresult = input('Do you want to play again? (Y/N)\n','s'); %Takes input to play again.
        if (loseresult == 'Y') %This whole section is identical to the above if...elseif...else loop. If result = Y, we restart. If result = N, we end the game. If different input, print error.
            tries = 0;
            value = randi([1,50]);
        elseif (loseresult == 'N')
            gameOver = true;
            fprintf('Game ended.\n');
        else
            error('Invalid input.\n');
        end
    elseif (guess < value)
        fprintf('Go higher!\n'); %Simple logic that compares guess to value, and if guess is less than value, user is reminded to try higher.
    elseif (guess > value)
        fprintf('Go lower!\n'); %More logic that compares guess and value (if guess is more than value, user is instructed to go lower)
    end
end
        
    