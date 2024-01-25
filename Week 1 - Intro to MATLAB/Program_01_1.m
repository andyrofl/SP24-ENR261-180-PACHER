
%Program Description:
%The purpose of this program is to demonstrate common arithmetic
%operations in MATLAB using variables as well as hard-coded calues

%clear the command window and all variables
clc
clear

%output the title and author to the command window
tutorial_name = "Program_01_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

%declare variables a and b where a has the value 5 and b has the value 3
a=5;
b=3;

%create the following arithmetic operations
%multiply variables a and b
multiplication = a*b

%calculate 10 to the power of b plus 6
exponentiation = 10^b + 6

%calculate a times b plus b squared
bSquared = a*b + b^2

%end program
