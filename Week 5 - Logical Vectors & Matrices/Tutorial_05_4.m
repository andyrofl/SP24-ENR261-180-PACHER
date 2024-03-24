%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_05_4";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

NUM_STUDENTS=50;
num_grades = 75 + 15*randn(1, NUM_STUDENTS);
letter_grades = blanks(NUM_STUDENTS);
count_by_grade = zeros(1,5);

%create logical vectors for each letter grade based on the num_grades vector
	%sum the number of students for each letter grade and store in count_by_grade vector
	%assign the appropriate letter grade
grade_a = num_grades>=90;
	count_by_grade(1) = sum(grade_a);
	letter_grades(grade_a) ='A';
grade_b = (num_grades>=80 & num_grades<90);
	count_by_grade(2) = sum(grade_b);
	letter_grades(grade_b) = 'B';
grade_c = (num_grades>=70 & num_grades<80);
	count_by_grade(3) = sum(grade_c);
	letter_grades(grade_c) = 'C';
grade_d = (num_grades>=60 & num_grades<70);
	count_by_grade(4) = sum(grade_d);
	letter_grades(grade_d) = 'D';
grade_f = num_grades<60;
	count_by_grade(5) = sum(grade_f);
	letter_grades(grade_f) = 'F';


% Print out the heading for the table of results
fprintf('Grade Report for ENR 261 Spring 2022\n\n')
fprintf('Student Number  Numerical Grade  Letter Grade\n')

% for loop to print each element in the num_grades and letter_grades vectors
for n = 1:1: length(num_grades)
    fprintf('\t\t%2i\t\t\t%5.1f \t\t\t %s\n', n, num_grades(n), letter_grades(n))
end

% Summary statistics
% LetterChoices vector is used to efficiently use the for loop
GRADE_LETTERS = ['A' 'B' 'C' 'D' 'F'];

% Heading for summary statistics
fprintf('\nNumber Students Earning Each Letter Grade\n\n')
fprintf('Letter Grade  Number of Students\n')
% Prints the letter grade and the number of students earning that grade
for n = 1:5
    fprintf('\t\t%s\t\t%2i\n',GRADE_LETTERS(n), count_by_grade(n))
end
% Total students is a good check to be sure that the sum of the letter
% grades earned is equal to 50
fprintf('\n%s \t\t %2i\n','Total Students', sum(count_by_grade))

%end tutorial