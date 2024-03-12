%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_06_3";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% Print the predefined values
fprintf('Default Values of Matlab Constants:\n\n')
fprintf('pi = %g , eps = %g \nrealmin = % g, realmax = %g\n\n', ...
    pi,eps,realmin,realmax)

% Override built-in variables by assinging your own with the same names
pi = 0;
eps = 0;
realmin = 0;
realmax = 0;

% MATLAB allows these constant names to be used without giving a warning
fprintf('Matlab Constants set to 0:\n\n')
fprintf('pi = %g , eps = %g \nrealmin = % g, realmax = %g\n\n', ...
        pi,eps,realmin,realmax)

% To restore the default values of the MATLAB constants you need to clear
% the variable names
clear  % clears all variable names in the workspace
fprintf('Matlab constants after the clear command:\n\n')
fprintf('pi = %g , eps = %g \nrealmin = % g, realmax = %g\n\n', ...
        pi,eps,realmin,realmax) 

% Using the functions sum() and prod() prior to overriding
x = 1:5;
fprintf('Matlab Functions Prior to Overriding:\n\n')
fprintf('x = %i  %i  %i  %i  %i\n',x)
fprintf('sum(x) = %2i , prod(x) = %g\n\n',sum(x), prod(x))

% Create variables for sum and prod, assign some arbitrary value
sum = eps;
prod = 0;

% Using the variable names sum and prod, Matlab does not warn you that you
% are overriding the functions.
fprintf('Overriding function Names:\n\n')
fprintf('sum = %2i , prod = %g\n\n',sum, prod)

% Using the functions sum() and prod() after overriding will cause an error
% Note that when you comment out the clear sum prod line you will get 
% the error message:

% ??? Index exceeds matrix dimensions.
% Error in ==> Tutorial_09_1 at 91.  

% This error appears because Matlab interprets sum(x) and prod(x) as your 
% attempt to access elements in vectors or matrices that do not exist.
fprintf('Matlab Functions after Overriding:\n\n')
fprintf('x = %i  %i  %i  %i  %i\n',x)
% To create the error comment the next line (add a % a the beginning)
%fprintf('sum(x) = %2i , prod(x) = %g\n\n',sum(x), prod(x))

% Clear the variables sum and prod
clear

help eps  % matlab will display a description of eps
help prod % matlab will display a description of the prod() function
help student  % not found, you may use this variable in your program

%end tutorial