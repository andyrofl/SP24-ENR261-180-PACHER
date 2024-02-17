%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables
format default %set the default format

% Output of the title and author to the command window
tutorial_name = "Tutorial_04_3";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

FILE_NAME = 'NorthernHemTempIndex.txt';
temp_matrix = readmatrix(FILE_NAME)

years = temp_matrix(:,1)
num_years = length(years)
temp_matrix(:, 1) = []

%compute the mean monthly temperature by column
mean_monthly_temps = mean(temp_matrix)
%compute the mean yearly temperature by row
mean_yearly_temps = mean(temp_matrix, 2)

%output the date to a file
file_id = fopen('TempertureDataTable.txt', 'w');
fprintf(file_id,'Table of Northern Hemisphere Temperature Changes in Degrees Fahrenheit\n\n');
fprintf(file_id,'Year      Jan\t Feb\t  Mar\t  Apr\t  May\t  Jun\t  Jul\t  Aug\t  Sep\t  Oct\t  Nov\t  Dec\tMean');

for r = 1:num_years
    fprintf(file_id,'\n%4i', years(r));
    for c = 1:12
        fprintf(file_id, '\t  %3i', temp_matrix(r,c));
    end
    fprintf(file_id, '\t%5.2f', mean_yearly_temps(r));
end
fprintf(file_id, '\nMean');

for mean = mean_monthly_temps
    fprintf(file_id, '\t%5.2f', mean);
end
fclose(file_id);
fprintf('\n\nThe Output Data Table is in the file TemperatureDataTable.txt\n\n')
%end tutorial