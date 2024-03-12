%Program Description:
%The purpose of this program is to compare the output of the exp() function with the user function taylorExp() for a given set of test data and
%display the results to the command window. The test data set can be adjusted with the variable DATA_SET_RANGE and the user function is defined only
%for input values greather than or equal to zero. Negative inputs will have a return value of 1.


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
program_name = "Program_06_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%define the start, end, and interval for the test range
DATA_SET_RANGE = 0:0.5:20;

%display header
fprintf('\tx\t\tTaylorExp(x)\t\tExp(x)\t  Exp(x) - TaylorExp(x)\n')
for x = DATA_SET_RANGE
	%calculate taylorExp(x) and exp(x)
	taylorX = taylorExp(x);
	expX = exp(x);
	%print data to the command window for each iteration of the loop
	fprintf('  %4.1f \t\t%0.5e\t\t%0.5e\t\t%0.5e\n', x, taylorX, expX, expX-taylorX)
end
%end program