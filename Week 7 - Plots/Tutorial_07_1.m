%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_07_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% A matrix can be used to display a table of values
angles=0:30:360;
table=[angles' sind(angles)' cosd(angles)' tand(angles)'];

% Display the data using disp()
disp('  Angle(Deg)      Sine        Cosine        Tangent')
disp(table)

% Plotting the results
clear angles % clears variable angles
angles=0:360;

figure(1)
plot(angles,sind(angles),angles,cosd(angles),angles,tand(angles))

% Adds title, axis label, and gridlines
title('Trigonometric Functions')
xlabel('Angle(Degrees)')
ylabel('sin, cos, tan')

% More condiguration options
grid on
axis([0,360,-2,2]) % sets the xmin, xmax, ymin, ymax of a graph
legend('sin', 'cos', 'tan') % adds a legend to define each data set

%end tutorial