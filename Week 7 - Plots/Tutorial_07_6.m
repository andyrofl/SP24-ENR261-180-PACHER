%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_07_6";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% Open a figure 1 window
figure(1)

% Given Data
xData = [1.0 1.5 3 4 6 8 10];
yData = [1.2 1.4 2.6 4.0 4.6 4.8 6.5];

% polyfit finds the coefficients of a polynomial that will best fit the data.
% The number 1 represents the order of the polynomial (1 = linear fit).
fitCoefficients = polyfit(xData,yData,1);

xFit = 0: 0.1: 10;  % values to evaluate the fit function at
yFit = polyval(fitCoefficients,xFit); % computes yFit at each xFit value
% And now, we plot the data, just as before.
% plot the fit equation and data on the same graph with blue circles for 
% the data points and a red line for the fit equation
plot(xData,yData,'ob',xFit,yFit,'r')
title('Linear Fit of Data')
xlabel('X')
ylabel('Y')
legend('Data Points','Fit Equation','Location','southeast')

% Open a figure 2 window
figure(2)

% plotting data with error bars and a fit equation on the same graph
% vector of error bars for yData
yErrors = [0.3 0.3 0.6 0.5 0.4 0.5 0.6];
errorbar(xData,yData,yErrors,'bo') % blue circles with vertical error bars

hold on
% This plot line will be placed on the same plot as the previous data
plot(xFit,yFit,'r')

% We still only need to call this once, since it's for a single plot
title('Linear Fit of Data with Error Bars')
xlabel('X')
ylabel('Y')
legend('Data Points w/ Error Bars','Fit Equation','Location','southeast')
hold off

%end tutorial