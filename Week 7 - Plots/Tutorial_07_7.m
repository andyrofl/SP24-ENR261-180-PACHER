%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_07_7";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% Create a mesh grid of values from 0-5
[x, y] = meshgrid(0:5);

% Compute the vectorized function to get z values here
z=(x.^2 - y.^2);

% Create the surface plot
surf(x, y, z)

% Add title, axis labels, and turn the grid on
title('(X^2-Y^2)')
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on

%end tutorial