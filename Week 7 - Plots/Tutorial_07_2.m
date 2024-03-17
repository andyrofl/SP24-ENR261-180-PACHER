%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_07_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% Define a vector x from 0 to 20 with increments of 5
x=0:5:20;
% define vector y
y=10*cos(x);

figure(1)  % opens figure window 1
plot(x,y)  % Plot a graph of y vs x in Figure Window 1
xlabel('X')
ylabel('Y=10*cos(x)')
title('Extreme Aliasing:  Delta X = 5')

% Define a vector x from 0 to 20 with increments of 1
x=0:1:20;
y=10*cos(x);

figure(2)  % opens figure window 2
plot(x,y)  % Plot a graph of y vs x in Figure Window 2
xlabel('X')
ylabel('Y=10*cos(x)')
title('Moderate Aliasing:  Delta X = 1')

% Define a vector x from 0 to 20 with increments of 0.5
x=0:0.5:20;
y=10*cos(x);

figure(3)  % opens figure window 3
plot(x,y)  % Plot a graph of y vs x in Figure Window 3
xlabel('X')
ylabel('Y=10*cos(x)')
title('Minor Aliasing:  Delta X = 0.5')

figure(4)  % opens figure window 4

% Note that the function must be enclosed in apostrophes.
% [0 20] are [xmin xmax]
fplot(@(x)10*cos(x),[0 20])  % fplot of 10*cos(x) in Figure Window 4
xlabel('X')
ylabel('Y=10*cos(x)')
title('No Aliasing:  Function Plotted with fplot()')

%end tutorial