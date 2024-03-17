%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_07_8";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% computing the x, y, and z coordinates to plot
t = 0:0.2:10;
x = t;
y = sin(t);
z = t.^1.5;

% Open Figure 1 and create a 2x2 grid of plots, activate the top left plot
figure(1)
subplot(2,2,1)

% plot3() with a continuous line                
plot3(x,y,z,'r-','linewidth',2)
% add a grid, title, and labels
grid on
title('plot3(x,y,z) with a Solid Line') 
xlabel('x')
ylabel('y')
zlabel('z')


% Activate the upper right subplot
subplot(2,2,2)
% plot3() with a line and markers 
plot3(x,y,z,'r-o','linewidth',2,'markersize',6,'markerfacecolor','b' ...
    ,'markeredgecolor','k')
% add a grid, title, and labels
grid on
title('plot3(x,y,z) with a Line and Markers') 
xlabel('x')
ylabel('y')
zlabel('z')


% Activate the lower left subplot
subplot(2,2,3)
stem3(x,y,z,'o','markersize',6, 'markerfacecolor','c','markeredgecolor','b')
% add a grid, title, and labels
grid on
title('stem3(x,y,z) with Solid Fill') 
xlabel('x')
ylabel('y')
zlabel('z')

% Activate the lower right subplot
subplot(2,2,4)

scatter3(x,y,z,'o','markerfacecolor','c','markeredgecolor','b')
% add a grid, title, and labels
grid on
title('scatter3(x,y,z)') 
xlabel('x')
ylabel('y')
zlabel('z')


% Define the x and y vectors
x = -8:8;
y = x;

% Create 2 matrices for x and y of the same size to represent all the (x,y)
% coordinates on the surface.
[xGrid,yGrid] = meshgrid(x,y);

r = sqrt(xGrid.^2 + yGrid.^2) + eps;
z = sin(r) ./ r;

% Open Figure 2 and create a 2x2 grid of plots, activate the top left plot
figure(2)
subplot(2,2,1)

% creates a mesh graph (colored wireframe)
mesh(x,y,z)
% add a grid, title, and labels
grid on
title('mesh(x,y,z)') 
xlabel('x')
ylabel('y')
zlabel('z')

% Activate the upper right subplot
subplot(2,2,2)

% surf() creates a colored surface plot
surf(x,y,z)
% add a grid, title, and labels
grid on
title('surf(x,y,z)') 
xlabel('x')
ylabel('y')
zlabel('z')

% Activate the lower left subplot
subplot(2,2,3)

% contour3() creates a 3D contour plot with 25 contour lines
contour3(x,y,z,25)
% add a grid, title, and labels
grid on
title('contour3(x,y,z,25)') 
xlabel('x')
ylabel('y')
zlabel('z')

% Activate the lower right subplot
subplot(2,2,4)

% contour() creates a 2D contour plot with 25 contour lines
contour(x,y,z,25)
% add a grid, title, and labels
grid on
title('contour(x,y,z,25)') 
xlabel('x')
ylabel('y')
zlabel('z')


% NegFunction = @ represents the notation for an annonymous function.  It
% creates a function named NegFunction(x) where x is a vector of independent
% variables.
negFunction =  @(x)((-1*sin(x(1)^2+x(2)^2+eps))/(x(1)^2+x(2)^2+eps));

% The values [0.1,0.1] are the initial guess of where the maximum occurs
[xyMaxVector,zMax] = fminsearch(negFunction,[0.1,0.1]);

% Print out the maximum of the function along with the coordinates at which
% the maximum occurs.  Note that we must negate the z value to represent the 
% maximum.
fprintf('The maximum value was z(%6.3f , %6.3f) = %2.0f\n', xyMaxVector(1) ... 
     ,xyMaxVector(2),-zMax)


%end tutorial