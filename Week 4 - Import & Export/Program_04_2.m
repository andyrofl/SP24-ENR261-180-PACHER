%Program Description:
%The purpose of this program is to load raw grade data from a text file and calculate a numerical average and letter grade
%for each student using that data, then to save that data to a separate text file.


%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables
format default %set the default format

% Output of the title and author to the command window
program_name = "Program_04_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%declare constants
WEIGHT_HW = 0.2;
WEIGHT_TEST = 0.35;
WEIGHT_FINAL = 0.45;
INDEX_STUDENT = 1;
INDEX_HW = 2;
INDEX_TEST = 3;
INDEX_FINAL = 4;

%load matrix from file and determine the number of students
raw_grades = readmatrix('RawGrades.txt');
num_students = length(raw_grades(:,1));

%calculate numerical average for each student
numerical_average = round((raw_grades(:,INDEX_HW).*WEIGHT_HW) + (raw_grades(:,INDEX_TEST).*WEIGHT_TEST) +(raw_grades(:,INDEX_FINAL).*WEIGHT_FINAL));

%calculate the mean and standard deviation of numerical averages
mean = sum(numerical_average)/length(numerical_average);
std_dev = std(numerical_average);

%calculate minimum values for each letter grade
MIN_A = mean + 1.5.*std_dev;
MIN_B = mean + 0.5.*std_dev;
MIN_C = mean - 0.5.*std_dev;
MIN_D = mean - 1.5.*std_dev;

%create row vector for letter grades and calculate for each student based on their numerical average
letter_grade = 1:num_students;
for r = 1:num_students
    if(numerical_average(r) >= MIN_A)
        letter_grade(r) = 'A';
    elseif(numerical_average(r) >= MIN_B)
        letter_grade(r) = 'B';
    elseif(numerical_average(r) >= MIN_C)
        letter_grade(r) = 'C';
    elseif(numerical_average(r) >+ MIN_D)
        letter_grade(r) = 'D';
    else
        letter_grade(r) = 'F';
    end
end

%open the output file and create the header data. if the file does not exist it will be created
file_id = fopen('FinalGrades.txt', 'w');
fprintf(file_id, 'Final Grade Report for ENR 261\n\n');
fprintf(file_id, 'Mean Numerical Grade = %2.1f , Standard Deviation = %2.1f', mean, std_dev);
fprintf(file_id, '\n\nSTUDENT #\t HW AVE\t\tTEST AVE\t FINAL EXAM\t   NUMERICAL AVE\tLETTER GRADE');

%loop through each student's data and write them to the output file file_id
for r= 1:num_students
    fprintf(file_id, '\n %5i\t\t\t%2i\t\t\t%2i\t\t\t%2i\t\t\t\t%2i\t\t\t\t %s', raw_grades(r,INDEX_STUDENT), raw_grades(r,INDEX_HW), raw_grades(r, INDEX_TEST), raw_grades(r, INDEX_FINAL), numerical_average(r), letter_grade(r));
end

%close the file and inform the user that the data has been calculate and saved in the output file
fclose(file_id);
fprintf('The calculated grade values have been written to FinalGrades.txt')

%end program