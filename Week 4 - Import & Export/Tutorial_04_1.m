%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables
format default %set the default format

% Output of the title and author to the command window
tutorial_name = "Tutorial_04_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

%declare constants for the file metadata
FILE_NAME = 'Tutorial_04_1_Data.xlsx';
SHEET_NAME ='OldResistors';

%read range A4:D28 from excel sheet 'OldResistors'
resistors = readmatrix(FILE_NAME, 'Sheet', SHEET_NAME, 'Range', 'A4:D28')

%retrieve a vector of the size of resistors and display the data
resistors_size = size(resistors)
fprintf('%i rows and %i columns of data were read.\n\n', resistors_size)

%declare constansts for number of rows and columns. 
RESISTORS_ROWS = resistors_size(1);
RESISTORS_COLUMNS = resistors_size(2);
%calculate the total number of resistors in the matrix
resistors_count = RESISTORS_ROWS.*RESISTORS_COLUMNS

%create a 1x4 vector of the sum of each column with one line instead of using a loop to traverse the whole thing manually...
sum_columns = sum(resistors)

%calculate the sum of all resistors and the mean value of the resistors from the original matrix
resistors_sum = sum(sum_columns)
resistors_mean = resistors_sum./resistors_count

%compute the standard deviation using our old friend, vectors
deviations = (resistors - resistors_mean).^2;
sum_dev_columns = sum(deviations);
sum_deviations = sum(sum_dev_columns);
resistors_std = sqrt(sum_deviations/(resistors_count-1));

%compute the standard deviation a shorter way with our old friend, colon notation
resistors_std_2 = std([resistors(1,:),resistors(2,:),resistors(3,:),resistors(4,:)])

%compute the standard deviation the shortest way with our oldest fried, laziness
resistors_std_3 = std(resistors(:))

%print our calculated data
fprintf('The resistors matrix has the following attributes\n')
fprintf('The number of rows = %i\n', RESISTORS_ROWS)
fprintf('The number of columns = %i\n', RESISTORS_COLUMNS)
fprintf('The number of resistor values = %i\n', resistors_count)
fprintf('The sum of all resistor values = %g ohms\n', resistors_sum)
fprintf('The mean of all resistor values = %g ohms\n', resistors_mean)
fprintf('The std dev of all resistor values = %g ohms\n', resistors_std)

%write our calculated data to the excel file and notify the user
writematrix(resistors_count, FILE_NAME, 'Sheet', SHEET_NAME, 'Range', 'H4:H4')
writematrix(resistors_sum, FILE_NAME, 'Sheet', SHEET_NAME, 'Range', 'H5:H5')
writematrix(resistors_mean, FILE_NAME, 'Sheet', SHEET_NAME, 'Range', 'H6:H6')
writematrix(resistors_std, FILE_NAME, 'Sheet', SHEET_NAME, 'Range', 'H7:H7')
fprintf('These statistical values have also been written to Tutorial_04_1_Data.xlsx \n\n')

%save our calculated data to a .mat binary file and notify the user
save Tutorial_04_1 resistors_size resistors_count resistors_sum resistors_mean resistors_std;
fprintf('Workspace variables resistors_size, resistors_count, resistors_sum, resistors_mean,\n')
fprintf('and resistors_std have been saved to file Tutorial_04_1.mat\n\n')

%end tutorial