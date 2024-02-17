%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables
format default %set the default format

% Output of the title and author to the command window
tutorial_name = "Tutorial_04_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

%load variables from previous tutorial and notify the user
FILE_NAME_MAT = 'Tutorial_04_1.mat'
load (FILE_NAME_MAT);
fprintf('The following variables have been retrieved from %s\n\n', FILE_NAME_MAT)
whos resistors_count resistors_mean resistors_size resistors_std resistors_sum

fprintf('Variable values:\n\n')
fprintf('resistors_size = %g\n', resistors_size)
fprintf('resistors_count = %i\n', resistors_count)
fprintf('resistors_sum = %g\n', resistors_sum)
fprintf('resistors_mean = %g\n', resistors_mean)
fprintf('resistors_std = %g\n', resistors_std)

%create a new resistors matrix with values distributed according to the mean and deviation of the original matrix
resistors = resistors_mean + resistors_std*randn(resistors_size)
%get meta data from the new matrix
new_resistors_size = size(resistors)
NEW_RESISTORS_ROWS = new_resistors_size(1);
NEW_RESISTORS_COLUMNS = new_resistors_size(2);
new_resistors_count = NEW_RESISTORS_ROWS.*NEW_RESISTORS_COLUMNS
new_resistors_sum = sum(sum(resistors))
new_resistors_mean = new_resistors_sum./new_resistors_count
new_resistors_std = std(resistors(:))

%output the new data to the command window
fprintf('The resistors matrix has the following attributes\n')
fprintf('The number of rows = %i\n', NEW_RESISTORS_ROWS)
fprintf('The number of columns = %i\n', NEW_RESISTORS_COLUMNS)
fprintf('The number of resistor values = %i\n', new_resistors_count)
fprintf('The sum of all resistor values = %g ohms\n', new_resistors_sum)
fprintf('The mean of all resistor values = %g ohms\n', new_resistors_mean)
fprintf('The std dev of all resistor values = %g ohms\n', new_resistors_std)

%write the new resistor data to the appropriate sheet in the excel file
FILE_NAME = 'Tutorial_04_1_Data.xlsx';
SHEET_NAME = 'newResistors';
writematrix(resistors,FILE_NAME,'Sheet',SHEET_NAME,'Range','A4:D28')
fprintf('These statistical values have also been written to Tutorial_04_1_Data.xlsx \n\n')


%end tutorial