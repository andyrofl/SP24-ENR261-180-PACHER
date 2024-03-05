%Program Description:
%The purpose of this program is to take two input matrices from the user, validate the input, and
% perform matrix multiplcation manually by traversing each element in two matrices. This calculation will be compared
% with MATLAB's matrix multiplcation operator to verify accuracy.


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
program_name = "Program_05_5";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

input_valid = false;

while(~input_valid)
	A = input('Enter matrix A. Enclose the values in brackets:\n');
	
	B = input('Enter matrix B. Enclose the values in brackets:\n');

	%create variables for sizes of input matrices for readability
	rows_A = size(A, 1);
	columns_A = size(A, 2);
	rows_B = size(B, 1);
	columns_B = size(B, 2);

	%to perform matrix multiplication, the number of columns of the first matrix must equal the number of rows in the second
	%if this condition is met the exit contition is triggered and the loop terminates, otherwise the user is notified of the error and the input prompt repeats
	%this will reject cases where one matrix is empty but will allow both matrices to be empty and calculates the same product as the standard matrix multiplcation operation
	if(columns_A == rows_B || isscalar(A) || isscalar(b))
		input_valid = true;
		continue
	end
		
	fprintf('# Columns in A must equal # Rows in B, try again\n\n')
end

A %display A and B here for some reason
B
fprintf('Number of rows in C = %i\n\nNumber of columns in C = %i\n\n', rows_A, columns_B)
C=zeros(rows_A,columns_B); %pre-allocating for performance and readability. the size of the output matrix is the number of rows in the first matrix and the number of columns of the second matrix
for ra = 1:rows_A %the first for loop traverses each row in matrix_A
	for cb = 1:columns_B %the second for loop traverses each column in matrix_B
		accumulator = 0; %reset the variable used to sum each calculation in the next loop
		%the third for loop traverses the columns in matrix_A to allow each element from the current row in matrix_A to be multiplied by each element in the current column in matrix_B
		for ca = 1:columns_A 
			accumulator = accumulator + A(ra,ca).*B(ca,cb);
		end
		%after every element in the current row of matrix_A has been multiplied by every element in the current column of Matrix_B
		%store the sum in the row corresponding to the current row number in matrix_A and the column correspoding to the current column in matrix_B
		C(ra, cb) = accumulator;
	end
end
%display the result of the matrix multiplcation from the nested for loops and compare with MATLAB's matrix multiplcation operator
fprintf('C using nested for loops and Tutorial_05_6 formulas\n')
C %Elapsed time is 0.001827 seconds.
fprintf('C1 using matrix multiplication A*B\n')
C1 = A*B %Elapsed time is 0.000365 seconds.

fprintf('Check: All elements in C-C1 should be equal to 0\n')
C_minus_C1 = C-C1

%end program