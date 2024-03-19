%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_07_5";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% Data set 1
x1=1:2:12;
y1=[25 170 420 750 1170 1660];

% Data set 2
x2=1:6;
y2=[30 75 150 360 750 1650];

% Data set 3
x3=5:1:10;
y3=[625 700 775 850 925 1000];

% Open figure 1 and create a subplot of two plots, one on top of the other.
% Activate the first plot
figure(1)
subplot(2,1,1)

% plot all three data sets on one graph using the default settings.
plot(x1,y1,x2,y2,x3,y3)

% Add a title "Linear Graph with 3 Sets of Data"
title('Linear Graph with 3 Sets of Data')

% Add axis labels, text, and legend.
xlabel('x');
ylabel('y');

% Add axis labels and text
text(4,500,'Data Set 3 can be fit with the linear function:  y = m*x + b',...
           'color','r','fontsize',12) 
% Add a legend, we can specify the location using polar coordinates
legend('Data set 1', 'Data set 2','Data set 3','Location','northwest')

% Notice that data set 3 is a straight line on the linear (default) graph.
% Data set 3 therefore has a functional form of y=m*x+b (linear).
% We can fit a polynomial of order 1 to this data set
linearCoeff=polyfit(x3,y3,1); % Two coefficients are produced 
m=linearCoeff(1);
b=linearCoeff(2);

% Calculate the best fit values using a linear model (y=mx+b)
xp3=linspace(5,10,100); % 100 linearly spaced values between 5 and 10
yp3=m*xp3+b;  % alternately we could use yp3=polyval(LinearCoeff,x3)

% Activate the second plot in the subplot set for this figure
subplot(2,1,2)

% Plot the data with asterisks (*) and the best fit function with a red line
plot(x3,y3,'*',xp3,yp3,'r');
% Add a title, axis labels and legend.
title('Data Set 3 with the Fit Equation y = m*x + b')
xlabel('x')
ylabel('y')
legend('Data Set 3','Y=m*x+b Fit','Location','southeast')



% Open figure 2 and create a subplot of two plots, one on top of the other.
% Activate the first plot
figure(2)
subplot(2,1,1)

% Create a semilogy graph with x1,y1 and x2,y2.
semilogy(x1,y1,x2,y2)

% Add title, axis labels, text, and legend
title('Semilogy Graph of Data Sets 1 and 2')
xlabel('x')
ylabel('y')
text(10E3,3,'Data Set 2 can be fit with an exponential function:  y = b*e^m',...
           'color','r','fontsize',12) 
legend('Data set 1', 'Data set 2','Location','southeast')

expCoeff=polyfit(x2,log(y2),1); % Two coefficients are produced 
m=expCoeff(1);
logb=expCoeff(2);
b=exp(logb);

% Calculate the best fit values using a linear model (y=mx+b)
xp2=linspace(1,6,100); % 100 values between 1 and 6
yp2=b*exp(m*xp2);  % find the fit values

% Activate the second plot in this Figure's subplot
subplot(2,1,2)

% Plot the data with asterisks (*) and the best fit function with a red line
plot(x2,y2,'*',xp2,yp2,'r');

% add a title, axis labels, and legend
title('Data Set 2 with an Exponential Fit Equation: Y=b*e^x')
xlabel('x')
ylabel('y')
legend('Data Points','Y=b*e^x Fit','Location','southeast')


% Open figure 3 and create a subplot of two plots, one on top of the other.
figure(3)
subplot(2,1,1)

% Plot the x1,y1 dataset on a loglog plot.
loglog(x1,y1)

% add a title, axis labels, text, and legend.
title('Loglog Graph with Data Set 1')
xlabel('x')
ylabel('y')
text(2,50,'Data Set 1 can be fit with a power function:  y = b*x^m',...
           'color','b','fontsize',12) 
legend('Data set 1','Location','southeast')

powerCoeff=polyfit(log(x1),log(y1),1); % Two coefficients are produced 
m=powerCoeff(1);
logb=powerCoeff(2);
b=exp(logb);

% Calculate the best fit values using a linear model (y=mx+b)
xp1=linspace(1,12,100); % 100 values between 1 and 12
yp1=b*xp1.^m;  % find the fit values


% Plot data set 1 and the power funtion fit on a linear graph
% Activate the second plot in this Figure's subplot
subplot(2,1,2)
legend('Data Paints', 'Y=b*e^x fit', 'Location','southeast')

% Plot the data with asterisks (*) and the best fit funtion with a red line
plot(x1, y1, '*', xp1, yp1, 'r')

% add a title, axis labels, and legend
title('Data Set 1 with a Power Fit Equation: Y=b*x.^m')
xlabel('x')
ylabel('y')
legend('Data Points','Y=b*e^x Fit','Location','southeast')

%end tutorial