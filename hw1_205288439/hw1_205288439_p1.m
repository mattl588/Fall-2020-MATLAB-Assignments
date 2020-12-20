%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name: Homework 1 Problem 1: String Manipulation
%
% Description: A script that manipulates a string (student name) and
% student ID as well. 
%
% Your name: Matthew Lacaire 
% UID: 205288439
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; close all; clear all;
%% Inputs
name = input('Enter your name\n','s'); %I assign strings to the variables "name" and "number" through the input command. I add the 's' argument inside of the input so that MATLAB does not interpret my input as an execution or command.
number = input('Enter your UID\n','s'); %For basic cleanliness, I add a \n such that the command window goes to the next line for input. This is simply to make the program neater.
%% Output 
fprintf('Hello %s, your UID backwards is %s', upper(name), fliplr(number)); %Prints the processed strings in place of the %s placeholders. Everything within the '' marks is also printed to command. I insert the upper() and fliplr() processing functions as arguments of the fprintf function, which processes the strings (making them uppercase and reversing order, respectively) correctly before printing them.