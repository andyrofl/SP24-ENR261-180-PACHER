%Program Description:
%The purpose of this program is to load input data from an excel sheet and perform calculations on attendance data using logical vectors
% the calculated data is then output to a different sheet in the original excel file and output to the console window.


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
program_name = "Program_05_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%import
FILE_NAME = 'ClassList.xlsx';
IMPORT_RANGE = 'A4:B34';
attendance_data = readmatrix(FILE_NAME, 'Sheet', 'Feb_06', 'Range', IMPORT_RANGE);

fprintf('Class List as of February 6\n\n')
fprintf('\tStudent #\t\tAbsences\n')
disp(attendance_data)%display the attendance data loaded from the spreadsheet

fprintf('Students with 1 or 2 absences who will recieve a warning letter\n\n')
fprintf('\tStudent #\t\tAbsences\n')
warning_vector = (attendance_data(:,2)) >0 & (attendance_data(:,2)) <3;%create a logical vector for all student with 1 or 2 absences
disp(attendance_data(warning_vector, :))%display data for students meeting above criteria

fprintf('Students with >= 3 absences who will receive a drop letter\n\n')
fprintf('\tStudent #\t\tAbsences\n')
drop_vector = (attendance_data(:,2)) >2;%create a logical vector for all student with 3 or more absences
disp(attendance_data(drop_vector, :))%display data for students meeting above criteria

retained_students = attendance_data(~drop_vector, :);%create a new matrix of students not meeting the drop criteria
fprintf('Class List as of February 13\n\n')
fprintf('\tStudent #\t\tAbsences\n')
disp(retained_students)%display data for students after dropping delinquents
writematrix(retained_students,FILE_NAME,'Sheet','Feb_13', 'Range', IMPORT_RANGE)%save data for retained students to next page of excel sheet using same range as imported data, knowing that by only dropping students the class size can never increase 
%notify the user that data has been saved
fprintf('The new class list has also been sent to ClassList.xlsx\n')

%end program