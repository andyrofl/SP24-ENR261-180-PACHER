%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_07_9";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% Open a Figure 1 window
figure(1)

points = 10000;
t = linspace(0,pi,points);
x = cos(2*t).*(cos(t).^2);
y = sin(2*t).*(sin(t).^2);
comet(x,y);

% Open a Figure 2 window
figure(2)

t = linspace(0,10*pi,points);
comet3(exp(-0.02*t).*sin(t),exp(-0.02*t).*cos(t),t);

% Open a Figure 3 window
figure(3)

x = -8:8;
y = x;
[xGrid,yGrid] = meshgrid(x,y);
r = sqrt(xGrid.^2 + yGrid.^2) + eps;
z = sin(r) ./ r;

% Set the elevation angle that we will view the graph to 0 degrees 
el = 0;

% The for loop changes the azimuth angle that the graph will be viewed from
for az = -90:15:90
    surf(x,y,z)
    view(az,el)  % view changes the viewpoint used to display the plot.
    pause(0.5)  % pause before drawing the next graph
end

% Open a Figure 4 window
figure(4)

% We'll reuse the values from Figure 3

% set the azimuth to 0 degrees
az = 0;

% change the elevation using the for loop
for el = 90:-15:-90
    figure(4) % ***IMPORTANT***
    surf(x,y,z)
    view(az,el)
    pause(0.5)
end

%end tutorial