% function Definition
% H1: Determines if an age is over 21 years old as of a given year,month,day
% Input Arguments:
% x = matrix of dates with the following columns: 4 digit year, 
% 2 digit month, 2 digit day
% year is the current year
% month is the current month
% day is the current day
% Output Argument:
% y = logical vector with a 1's in positions with ages >= 21 and 0's in
%     positions with ages < 21.

function [y] = over21(x,year,month,day)
	cleared_by_year = x(:, 1) < (year -21); %over 21 as of jan 1st in the current year
	cleared_by_month = (x(:, 1) == (year-21)) & (x(:, 2) < month); %under 21 as of jan 1st, but over 21 by the first of the current month
	cleared_by_day = (x(:, 1) == (year-21)) & (x(:, 2) == month) & (x(:, 3) <= day); %turned 21 this month. happy birthday!

	y= cleared_by_year | cleared_by_month | cleared_by_day; %return any matches to above conditions
end