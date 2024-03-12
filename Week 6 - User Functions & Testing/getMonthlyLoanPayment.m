% H1: Computes e^x using a Taylor Series for x >= 0
% Help Text:
% Input argument:
% x = a vector of exponents, all values of x >= 0 
% Output Argument:
% Texp = a vector of e^x values computed using a Taylor Series
% A value of 1 is output for any values of x < 0
%
function payment = getMonthlyLoanPayment(principal, yearly_rate, num_payments)
	%validate inputs
	if(isnumeric(principal) & isnumeric(yearly_rate) & isnumeric(num_payments))%validate that inputs are numeric
		if((principal >= 0) & (yearly_rate>= 0) & (num_payments>=0))%validate that inputs are positive or equal to zero
			monthly_rate = yearly_rate./12;
			numerator = monthly_rate.*((1+monthly_rate).^num_payments);
			denominator = ((1+monthly_rate).^num_payments)-1;
			payment = principal.*(numerator./denominator);
		else
			payment = [];%payment value empty if any inputs are less than zero
		end
	else
		payment = [];%payment value empty if any inputs are non-numeric
	end
end