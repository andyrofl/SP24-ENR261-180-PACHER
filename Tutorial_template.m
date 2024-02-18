%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables
format default %set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)


%end tutorial