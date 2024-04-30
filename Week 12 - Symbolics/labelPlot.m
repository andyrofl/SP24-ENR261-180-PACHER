% LABELPLOT Adds a title, x and y axis labels, and gridlines to a plot.
%
% This function will only apply the aforementioned properties to the
% currently active plot, so be sure to activate the plot prior to running
% this function.
%
% Inputs:
%     titleText   : a string for the title of the graph.
%     xLabel      : a string for the x axis label of the graph.
%     yLabel      : a string for the y axis label of the graph.
%     zLabel      : an optional string for the z axis label of the graph.
%     gridOn      : an optional boolean to turn the grid on or off,
%                     if omitted, the grid will be off
%
% Outputs:
%     There are no outputs.
%
% See also TITLE, XLABEL, YLABEL, ZLABEL
function labelPlot(titleText, xLabel, yLabel, zLabel, gridOn)
	title(titleText)
	xlabel(xLabel)
	ylabel(yLabel)
	if(exist('zLabel', 'var'))
		zlabel(zLabel)
	end
	if(exist('gridOn', 'var') && gridOn)
		grid on
	else
		grid off
	end
end

%end program