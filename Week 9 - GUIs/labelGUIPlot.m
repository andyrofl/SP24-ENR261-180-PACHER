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
%                     if omitted, the grid will be off%
% Outputs:
%     There are no outputs.
%
% See also TITLE, XLABEL, YLABEL, ZLABEL
function labelPlot(UIPlot, titleText, xLabel, yLabel, zLabel, gridOn)
	title(UIPlot, titleText)
	xlabel(UIPlot, xLabel)
	ylabel(UIPlot, yLabel)
	if(exist('zLabel', 'var'))
		zlabel(UIPlot, zLabel)
	end
	if(exist('gridOn', 'var') && gridOn)
		grid(UIPlot, "on")
	else
		grid(UIPlot, "off")
	end
end

%end program