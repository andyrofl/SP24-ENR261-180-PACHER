%Program Description:
%The purpose of this program is to create and display a surface plot for a given equation using a given meshgrid


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
program_name = "Program_07_4";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%create the x y meshgrid
[X,Y] = meshgrid(-3.5:0.25:3.5);

%calculate the z values
exponent = -1.5*X*sqrt(X^2 + Y^2);
Z= 1.8^(exponent)*cos(0.5*Y)*sin(X);
surf(X, Y, Z)
labelPlot('Z=1.8^{(-1.5*sqrt(X^2 + Y^2))}*cos(0.5*Y)*sin(X)', 'x', 'y', 'z', true)

%end program