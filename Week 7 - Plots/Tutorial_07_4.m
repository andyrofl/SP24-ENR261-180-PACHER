%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_07_4";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% Create two rows and two columns of subplots and activate the upper left plot
subplot(2,2,1)

% Define the vectors to plot
year = [2000 2001 2002 2003 2004 2005];
profits = [1.2 3.3 3.7 5.9 5.6 10.2];  % in millions of US Dollars

% The following plot command will create a default 2D plot with a solid 
% blue line connecting the data points. The axes are autoscaled and
% default tick labels are added.
plot(year,profits);

% Add the title "Default Graph of Profits" to the graph
title("Default Graph of Profits")

% Activate the upper right plot
subplot(2,2,2)

% Override the default line settings 
plot(year,profits,'linestyle','--','color','r','linewidth',3)

% Use a vector to define the labels and tick marks that will appear on
% the x and y axes.
set(gca,'xtick',year) % vector year used to label the x tick marks
set(gca,'ytick',0:2:12) % 0:2:12 vector used to label the y tick marks

% axis overrides the x and y axis autoscaling
axis([2000 2005 0 12])  % axis([xmin xmax ymin ymax])
grid on  % Adds gridlines at each tick label position

% adds a title and axis labels
title('Graph of Profits with Line Attributes Overriden and Axis Controls')
xlabel('Fiscal Year')
ylabel('Profits in Millions of US $')

% Activate the lower left plot
subplot(2,2,3)

% Create a plot with shorthand 'd' indicating diamonds for the markers
plot(year,profits,'d','markersize',8, ...
          'markerfacecolor','c','markeredgecolor','k')

title('Graph of Profits with Line Replaced with Markers')

% repeat of items from the second plot
set(gca,'xtick',year)
set(gca,'ytick',0:2:12)
axis([2000 2005 0 12])
grid on
xlabel('Fiscal Year')
ylabel('Profits in Millions of US $')

% Activate the lower right plot
subplot(2,2,4)

% Draws both a line and markers
plot(year,profits,'g:^','linewidth',2, 'markersize',9, ...
                  'markerfacecolor','g','markeredgecolor','m')
              
% text can be added to the graph beginning in location (2001,9)              
text(2001,9,'2004 Includes Our New Plant Acquisition', ...
            'color','r','fontsize',12) 

title('Graph of Profits with a Line and Markers') 

% repeat of items from the second graph
set(gca,'xtick',year)
set(gca,'ytick',0:2:12)
axis([2000 2005 0 12])
grid on
xlabel('Fiscal Year')
ylabel('Profits in Millions of US $')

%end tutorial