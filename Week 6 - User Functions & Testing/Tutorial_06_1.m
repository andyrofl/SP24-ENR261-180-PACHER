%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_06_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

%create and print the un-sorted x vector
x = [1:10, -20:3:-5, 12:2:36];
fprintf('Unsorted x\n')
disp(x')

%sort vector x, and display the sorted vector
sortedX = inefficientSort(x);
fprintf('Sorted x\n')
disp(sortedX')

%end tutorial
