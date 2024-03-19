%Program Description:
%The purpose of this program is to create create and display several plots on two figures with a given data set of x and y values


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
program_name = "Program_07_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

% Dataset 
x = [10 20 30 100 200 300 500 700 1000];
y = [18 38 49  82 102 113 127 137 146];

%open figure 1
figure(1)
%activate the top left subplot, plot data, and apply labels
subplot(2,2,1)
plot(x,y)
labelPlot('Graph of plot(x,y)','x', 'y')
%activate the top right subplot, plot data, and apply labels
subplot(2,2,2)
loglog(x,y)
labelPlot('Graph of loglog(x,y)','x', 'y')
%activate the bottom left subplot, plot data, and apply labels
subplot(2,2,3)
semilogx(x,y)
labelPlot('Graph of semilogx(x,y)','x', 'y')
%activate the bottom right subplot, plot data, and apply labels
subplot(2,2,4)
semilogy(x,y)
labelPlot('Graph of semilogy(x,y)','x', 'y')

%activate figure 2
figure(2)
%calculate two coefficients and assign as m and b
coefficients=polyfit(log(x),y,1);
m=coefficients(1);
b=coefficients(2);

xf2 = linspace(10,1000, 100);%generate linearly spaced x values of quantity 100
yf2 = m.*log(xf2)+b;%calculate y values according to the coefficients

hold on
labelPlot('(x,y) Data Set with the Fir Equation y = m*ln(x) +b', 'x', 'y')%label the plot
plot(x,y, '*b')%plot the x and y data points
plot(xf2, yf2, 'Color','r')%plot the calculated curve
best_fit_text = sprintf('The best fit function is y= %3.1f*ln(x)%3.1f', m, b);
text(200,75,best_fit_text,'fontsize',10)%format and display the model in text on the plot
legend('(x,y) Data Set', 'Y=m*ln(x) + b Fit','Location','southeast')
hold off

%end program