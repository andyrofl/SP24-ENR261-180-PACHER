% function Definition
% H1: Sorts a matrix of dates into descending order using a Bubble Sort 
% Input Argument:
% x = matrix of dates with the following columns: 4 digit year, 
% 2 digit month, 2 digit day
% Output Argument:
% y = matrix with the x in descending order (youngest to oldest)

function [y] = dateSort(x)
	INDEX_YEAR = 1;
	INDEX_MONTH = 2;
	INDEX_DAY = 3;
	SORT_METHOD = 'stable';

	%get unique months, sort
	%for through each year
	%	get unique months in current year, sort
	%	for through each month in this current year
	%		bubble sort the days in the current month and year, adding the output onto the temp list
	%highest numbers first

	y=[];
	unique_years = unique(x(:,INDEX_YEAR), SORT_METHOD);%get an unsorted list of unique years from any row in column 1
	unique_years = sort_matrix_by_index(unique_years, 1);%bubble sort the list of unique years
	for current_year = 1:length(unique_years)
		current_year_logical_vector = x(:, INDEX_YEAR) == unique_years(current_year); %create a smaller matrix with only rows matching the current year
		current_year_sub_matrix = x(current_year_logical_vector, :);
		unique_months_in_current_year = unique(current_year_sub_matrix(:, INDEX_MONTH), SORT_METHOD);%within the current year, get an unsorted list of unique months from any row in column 2 
		unique_months_in_current_year = sort_matrix_by_index(unique_months_in_current_year, 1);%sort the list of unique months in the current year
		for current_month = 1:length(unique_months_in_current_year)
			current_month_logical_vector = current_year_sub_matrix(:, INDEX_MONTH) == unique_months_in_current_year(current_month);
			current_month_sub_matrix = current_year_sub_matrix(current_month_logical_vector, :);
			%unique_days_in_current_month = unique(current_year_sub_matrix(:, INDEX_MONTH), SORT_METHOD);%
			y= [y; sort_matrix_by_index(current_month_sub_matrix, INDEX_DAY)];
		end
	end
	y=flipud(y);
end


% function Definition
% H1: Sorts a vector into ascending order according to the given index using a Bubble Sort 
% local function to be used by dateSort function
% Input Argument: input_matrix to be sorted
% Output Argument: output_matrix sorted in ascending order by the given index
function [output_matrix] = sort_matrix_by_index(input_matrix, index)
	matrix_size = size(input_matrix);  % compute the number of elements in x
	disp(matrix_size)
	n = matrix_size(1);
	
	sorted = false;  % a boolean flag variable used to determine if the vector is fully sorted
	passes = 0;  % 0 passes completed at the start

	if(index == 3)
		fprintf('index day\n')
	end
	if(n>1)%if n>1, proceed with sort, otherwise the input matrix is already sorted
		while (~sorted)% while loop that continues to make passes through x until it is fully sorted.
    		sorted = true;  % assumes x is fully sorted at the start of each pass
    		passes = passes +1; % add one to the number of passes
    		
    		% On each pass through vector x the for loop starts with the first
    		% element and continues until the (n-passes) element. After the first
    		% pass the largest value in x will fall to the last element therefor on
    		% the second pass there is no need to check to see if the last value is
    		% in the correct order.  After each subsequent pass the x(n-passes:n)
    		% elements are in the correct order.  This is why the for loop limits
    		% go from 1 to (n-passes).
    		for j = 1: n-passes
       			if input_matrix(j, index) > input_matrix(j+1, index) % compares the current element input_matrix(j, index) with the next element input_matrix(j+1, index)
           			temp = input_matrix(j);  % stores the current row in a temp memory location
           			input_matrix(j) = input_matrix(j+1); % stores the next value into the current value
           			input_matrix(j+1) = temp; % stores the original current value into the next value.
           			sorted = 0; % sets sorted to 0 to indicate that an out of order element was found. This will cause the while loop to make another pass through x.
       			end
			end
		end%end while loop
	end
	output_matrix = input_matrix;  % returns the sorted vector
end