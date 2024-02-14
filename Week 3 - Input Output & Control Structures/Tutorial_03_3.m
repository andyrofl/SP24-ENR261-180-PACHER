%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
tutorial_name = "Tutorial_03_3";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assitance from %s. \n\n", tutorial_name, name, assisted_by)

%take the user's age as an input
userAge = input("What is your age? ")
userName = input("What is your name? ", "s");

%print the user's name and age 
fprintf("You said your name was %s and you are %i years old, hello %s!\n\n", userName, userAge, userName)

%end tutorial