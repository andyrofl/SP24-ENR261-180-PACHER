%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
tutorial_name = "Tutorial_02_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assitance from %s. \n\n", tutorial_name, name, assisted_by)

A=[1 2 3]
a=10

scalar = 5
row_vector = [1 2 3 4 5]
column_vector = [6;7;8]
matrix = [1 2 3; 4 5 6; 7 8 9]

payday = "Thursday" %create variable payday
GRAVITY = 9.81

payday %print value of variable payday

who %display all variable names
whos %display all varible info

whos GRAVITY %display information on variable GRAVITY
whos GRAVITY payday %display information on variables GRAVITY and payday

pi %display the value of pi

pi=10 %create a local variable pi with value 10

clear pi %clear the local variable pi

pi %display the value of pi

%end tutorial