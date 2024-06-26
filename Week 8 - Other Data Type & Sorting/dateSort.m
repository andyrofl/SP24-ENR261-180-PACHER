% function Definition
% H1: Sorts a matrix of dates into descending order using a Bubble Sort 
% Input Argument:
% x = matrix of dates with the following columns: 4 digit year, 
% 2 digit month, 2 digit day
% Output Argument:
% y = matrix with the x in descending order (youngest to oldest)

function [sorted_dates] = dateSort(dates_to_be_sorted)
	INDEX_YEAR = 1;
	INDEX_MONTH = 2;
	INDEX_DAY = 3;
	INDEX_COLUMN_VECTOR = 1;
	SORT_METHOD = 'stable';%does not re-order terms when using unique()

	sorted_dates=[];%create return variable sorted_dates
	unique_years = unique(dates_to_be_sorted(:,INDEX_YEAR), SORT_METHOD);%get an unsorted list of unique years from any row in column 1 of dates_to_be_sorted
	unique_years = sort_matrix_by_index(unique_years, INDEX_COLUMN_VECTOR);%bubble sort the list of unique years in dates_to_be_sorted
	for current_year = 1:length(unique_years)%loop through all years that are present in dates_to_be_sorted in ascending order
		%create a logical vector for all rows that match the current_year
		current_year_logical_vector = dates_to_be_sorted(:, INDEX_YEAR) == unique_years(current_year);
		%create a sub-matrix of all rows that match current_year using the logical vector
		current_year_sub_matrix = dates_to_be_sorted(current_year_logical_vector, :);

		%within the current year, get an unsorted list of unique months from any row in column 2 
		unique_months_in_current_year = unique(current_year_sub_matrix(:, INDEX_MONTH), SORT_METHOD);
		%sort the list of unique months in the current year
		unique_months_in_current_year = sort_matrix_by_index(unique_months_in_current_year, INDEX_COLUMN_VECTOR);
		for current_month = 1:length(unique_months_in_current_year)%loop through all months that are present in current_year in ascending order
			%create a logical vector of all rows within the current_month and current_year
			current_month_logical_vector = current_year_sub_matrix(:, INDEX_MONTH) == unique_months_in_current_year(current_month);
			%create a sub-matrix of all rows matching the current_month and current_year using the logical vector
			current_month_sub_matrix = current_year_sub_matrix(current_month_logical_vector, :);
			
			%bubble sort the sub-matrix of dates only within the current month and year, then add it to the return variable
			sorted_dates = [sorted_dates; sort_matrix_by_index(current_month_sub_matrix, INDEX_DAY)];%matrix changes size every iteration, may consider finding a way to pre-allocate size
		end
	end
	sorted_dates=flipud(sorted_dates);%reverse the order of dates by row from top to bottom so they are in descending order
end


% function Definition
% H1: Sorts a vector into ascending order according to the given index using a Bubble Sort 
% local function to be used by dateSort function
% Input Argument: input_matrix to be sorted
% Output Argument: output_matrix sorted in ascending order by the given index
function [output_matrix] = sort_matrix_by_index(input_matrix, index)
	matrix_size = size(input_matrix);  % compute the number of elements in x
	n = matrix_size(1);
	
	sorted = false;  % a boolean flag variable used to determine if the vector is fully sorted
	passes = 0;  % 0 passes completed at the start

	if(n>1)%if n>1, proceed with sort, otherwise the input matrix is already sorted
		while (~sorted)% while loop that continues to make passes through x until it is fully sorted.
    		sorted = true;  % assumes x is fully sorted at the start of each pass
    		passes = passes +1; % add one to the number of passes
    		
    		for j = 1: n-passes
       			if input_matrix(j, index) > input_matrix(j+1, index) % compares the current element input_matrix(j, index) with the next element input_matrix(j+1, index)
           			temp = input_matrix(j,:);  % stores the current row in a temp memory location
           			input_matrix(j,:) = input_matrix(j+1,:); % stores the next value into the current value
           			input_matrix(j+1,:) = temp; % stores the original current value into the next value.
           			sorted = 0; % sets sorted to 0 to indicate that an out of order element was found. This will cause the while loop to make another pass through x.
       			end
			end
		end%end while loop
	end
	output_matrix = input_matrix;  % returns the sorted vector
end