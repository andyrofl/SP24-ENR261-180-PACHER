%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_08_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% Create a row vector of 100,000 values with a mean of 50 and stdev of 15
normal = 50 + 15*randn(1,100000);
% Using the rand() function to create a uniform distribution from 0 to 100
uniform = 100*rand(1,100000) + 0;

binCenters = 2.5:5:97.5;
% Bin boundaries are the left and right boundaries of the bins
binBoundaries = 0:5:100;

% Open figure 1
figure(1)

% Create 2 subplots, one on top of the other, activate plot 1
subplot(2,1,1)

histogram(normal, binBoundaries)
% Set the tick mark labels at each bin center
set(gca,'xtick', binCenters)
% Set the axis limits
axis([0 100 0 2500])
% override the y axis limits with autoscaling
axis 'auto y'

% Get the handle to the current plot (returns a 2x1 "Group" or array)
h = findobj(gca)

% Display the properties we can work with
h(2)
% Update the properties of the plot with the handle and property names
set(h(2),'FaceColor','g','EdgeColor','k')

% Create the second plot in figure window 1
subplot(2,1,2)
% Make a historgram of the uniform distribution, it's the same as the
% normal distrubution, just use the uniform data instead.
histogram(uniform, binBoundaries)

% The following lines control the second graph as described above
set(gca,'xtick',binCenters)
axis([0 100 0 2500])
axis 'auto y'

% Get the handle to the current plot
h = findobj(gca);
% Update the properties of the plot with the handle and property names
h(2).FaceColor = 'r'
h(2).EdgeColor = 'w'

labelPlot('Uniform Distribution','Bin Boundaries','Frequency')

findobj()
histograms = findobj('Type', 'Histogram')
histograms(1)

% We know the first Histogram object was the uniform distribution
freqUniform = histograms(1).BinCounts;
freqNormal = histograms(2).BinCounts;

% Print the heading of the table
fprintf(' Bin      Normal    Uniform \n')
fprintf('Center  Frequency  Frequency \n')
% Create a matrix named table with three rows
table = [binCenters; freqNormal; freqUniform];
% Print the table values three per line
fprintf(' %4.1f \t  %5i \t %5i\n',table)

%end tutorial