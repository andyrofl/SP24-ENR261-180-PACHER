%Program Description:
%The purpose of this program is to


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
program_name = "Program_08_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%import data
data = importdata('Data_08_1.txt');

%calculate the total rating from the Cost, Durability, Function, and Marketability columns, append as a new column onto the existing matrix
for row = 1:length(data(:,1))
	data(row, 6) = sum(data(row, 2:5));
end

%print the data for the original design ratings to the console
print_design_data_to_console('Original Design Ratings\n', data);

%sort the data in ascending order by the Cost column
sorted_data = sort_matrix_by_index(data, 2);%index 2 is Cost
print_design_data_to_console('Rows Shifted by the Descending order of the Cost Column\n', sorted_data);

%sort the data in ascending order by the Durability column
sorted_data = sort_matrix_by_index(data, 3);%index 3 is Durability
print_design_data_to_console('Rows Shifted by the Descending order of the Durability Column\n', sorted_data);

%sort the data in ascending order by the Function column
sorted_data = sort_matrix_by_index(data, 4);%index 4 is Function
print_design_data_to_console('Rows Shifted by the Descending order of the Function Column\n', sorted_data);

%sort the data in ascending order by the Marketability column
sorted_data = sort_matrix_by_index(data, 5);%index 5 is Marketability
print_design_data_to_console('Rows Shifted by the Descending order of the Marketability Column\n', sorted_data);

%sort the data in ascending order by the Total column
sorted_data = sort_matrix_by_index(data, 6);%index 6 is Total
print_design_data_to_console('Rows Shifted by the Descending order of the Total Score Column\n', sorted_data);


% function Definition
% H1: Sorts a vector into descending order according to the given index using a Bubble Sort 
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
	output_matrix = flipud(input_matrix);  % returns the sorted vector
end

% function Definition
% H1: prints date data to the console
% Input Argument:
% header_text = text to display before the standard header
% date_data = a matrix with five columns of data data to display
% Output Argument:
% none. data has been printed to console
function print_design_data_to_console(header_text, design_data)
	fprintf(header_text)
	fprintf('\nDesign #  Cost   Durability  Function   Marketability  Total\n')
	for row = 1:length(design_data(:,1))
		Num = design_data(row,1);
		Cost = design_data(row,2);
		Durability = design_data(row,3);
		Function = design_data(row,4);
		Marketability = design_data(row,5);
		Total = design_data(row,6);
		fprintf('  %3i\t   %2i\t\t%2i\t\t\t%2i\t\t\t%2i\t\t\t%2i\n', Num, Cost, Durability, Function, Marketability, Total)
	end
	fprintf('\n')
end

%end program