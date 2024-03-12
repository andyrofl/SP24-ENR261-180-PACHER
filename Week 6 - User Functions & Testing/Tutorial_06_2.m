%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_06_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

%create formatted text for input prompts
row_prompt = sprintf('Enter the number of rows to create (0 to quit): ');
col_prompt = sprintf('Enter the number of columns to create (0 to quit): ');

% Ask the user for a count of row and columns
numRows = input(row_prompt);
numCols = input(col_prompt);

% while loop to continue the program until numRows or numCols == 0
while (numRows ~= 0 && numCols ~= 0)
    % input the desired mean and standard deviation of the matrix
    avg = input('Enter the desired mean of the matrix: ');
    std = input('Enter the desired standard deviation of the matrix: ');
    
    %create the matrix
    matrix = avg + std*randn(numRows,numCols);
    
    % print the matrix with row and column numbers using function matPrint
    matPrint(matrix)
    
    % Compute the actual mean and standard deviation using function matStat
    [matrixMean, matrixStd] = matStat(matrix);
    % Print the mean and standard deviation
    fprintf('\n\nMatrix Mean = %10.2e, Matrix Standard Deviation = %10.2e\n\n',...
             matrixMean, matrixStd)
    
    % Ask the user for a count of row and columns
    numRows = input(row_prompt);
    numCols = input(col_prompt);
end


while (true)
    % Ask the user for a count of row and columns
    numRows = input(row_prompt);
    numCols = input(col_prompt);

    % quit if numRows or numCols == 0
    if (numRows == 0 || numCols == 0)
        break;
    end

    % input the desired mean and standard deviation of the matrix
    avg = input('Enter the desired mean of the matrix: ');
    std = input('Enter the desired standard deviation of the matrix: ');
    
    %create the matrix
    matrix = avg + std*randn(numRows,numCols);
    
    % print the matrix with row and column numbers using function matPrint
    matPrint(matrix)
    
    % Compute the actual mean and standard deviation using function matStat
    [matrixMean, matrixStd] = matStat(matrix);
    % Print the mean and standard deviation
    fprintf('\n\nMatrix Mean = %10.2e, Matrix Standard Deviation = %10.2e\n\n',...
             matrixMean, matrixStd)
end



%end tutorial