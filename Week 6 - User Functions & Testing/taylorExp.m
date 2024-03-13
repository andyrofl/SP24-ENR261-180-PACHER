% H1: Computes e^x using a Taylor Series for x >= 0
% Help Text:
% Input argument:
% x = a vector of exponents, all values of x >= 0
% 
% Output Argument:
% Texp = a vector of e^x values computed using a Taylor Series
% A value of 1 is output for any values of x < 0
%
function [series]=taylorExp(x)
	TOLERANCE = 1*10^-6; %create contant for tolerance threshold
	series = zeros(size(x)); %create the output vector sized to the input vector x
	increment = 0; %set iterator to 0
	indices_to_iterate = true(1, length(x)); %create logical vector with all terms set to true indicating that all terms should be iterated on

	while(any(indices_to_iterate))
		current_term = (x.^increment)/factorial(increment); %caclculate the Taylor series term for the current iteration. any term to the 0th power is 1 and 0 factorial is 1, returning a value of 1 for the first term
		indices_to_iterate = (abs(current_term) > TOLERANCE); %create logical vector for all elements where the current_term will increase precision by more than the tolerance
		series(indices_to_iterate) = series(indices_to_iterate) + current_term(indices_to_iterate); %add current_term elements needing additional precision
		increment = increment+1; %update the iterator
	end
end