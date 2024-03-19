%Program Description:
%The purpose of this program is to create four subplots in a single window and display data in accordance with problem 9.8 on page 235 of the Essential Matlab textbook


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
program_name = "Program_07_3";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%create vectors for x and y values
x = 1:20000;
y = 1:20000;
%set base case x and y values
x(1)=0;
y(1)=0;

%calculate the remainder of the 20000 points needed for the most complex plot
%smaller samples of this set will be taken for the less complex plots
for inc = 1:20000
	x(inc+1) = y(inc)*(1+sin(0.7*x(inc)))-1.2*sqrt(abs(x(inc)));
	y(inc+1) = 0.21-x(inc);
end


%open figure 1
figure(1)

%activate the top left of the four subplots
subplot(2,2,1)
%calculate vectors for plot 1 including the zero term
xp1 = x(1:250);
yp1 = y(1:250);
plot(xp1, yp1, 'b.', 'MarkerSize',1)%plot the subset using small blue dots
labelPlot('Fractal Plot with 250 Points', 'x', 'y')%label the plot

%activate the top right of the four subplots
subplot(2,2,2)
%calculate vectors for plot 2 including the zero term
xp2 = x(1:2500);
yp2 = y(1:2500);
plot(xp2, yp2, 'b.', 'MarkerSize',1)%plot the subset using small blue dots
labelPlot('Fractal Plot with 2500 Points', 'x', 'y')%label the plot

%activate the bottom left of the four subplots
subplot(2,2,3)
%calculate vectors for plot 3 including the zero term
xp3 = x(1:5000);
yp3 = y(1:5000);
plot(xp3, yp3, 'b.', 'MarkerSize',1)%plot the subset using small blue dots
labelPlot('Fractal Plot with 5000 Points', 'x', 'y')%label the plot

%activate the bottom right of the four subplots
subplot(2,2,4)
%calculate vectors for plot 4 including the zero term
xp3 = x(1:20000);
yp3 = y(1:20000);
plot(xp3, yp3, 'b.', 'MarkerSize',1)%plot the subset using small blue dots
labelPlot('Fractal Plot with 20000 Points', 'x', 'y')%label the plot

%end program