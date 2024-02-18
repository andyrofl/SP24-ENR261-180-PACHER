%Program description
%This program takes input data on the week and number of assignments
%to generate m file templates for the tutorials and programs that week

clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

week_number =input("Enter the week number: ");%week_number will not contain the correct leading zeroes for numbers less than 10. to display correctly in a string %02i will need to be used
num_tutorials = input("Enter the number of tutorials this week: ");
num_programs = input("Enter the number of programs this week: ");

%loop through tutorial creation
for inc = 1:num_tutorials
    file_name = sprintf('Tutorial_%02i_%i.m', week_number, inc);
    file_id = fopen(file_name,  'w'); 
    fprintf(file_id, '%%Clear the command window and all variables\nclear %%Clear the workspace variables\nclc %%Clear the command window contents\nformat default %%Set the default format\n\n');
    fprintf(file_id, '%%Output of the title and author to the command window\ntutorial_name = "Tutorial_%02i_%i";', week_number, inc);
    fprintf(file_id, '\nname = "Andy Pacher";\nassisted_by = "Nobody";\nfprintf("Output for %%s written by %%s, with assistance from %%s. \\n\\n", tutorial_name, name, assisted_by)\n\n\n%%end tutorial');

    fclose(file_id);
end


%loop through program creation
for inc = 1:num_programs
    file_name = sprintf('Program_%02i_%i.m', week_number, inc);
    file_id = fopen(file_name,  'w');
    fprintf(file_id, '%%Program Description:\n%%The purpose of this program is to\n\n\n%%Clear the command window and all variables\nclear %%Clear the workspace variables\nclc %%Clear the command window contents\nformat default %%Set the default format\n\n');
    fprintf(file_id, '%%Output of the title and author to the command window\nprogram_name = "Program_%02i_%i";', week_number, inc);
    fprintf(file_id, '\nname = "Andy Pacher";\nassisted_by = "Nobody";\nfprintf("Output for %%s written by %%s, with assistance from %%s. \\n\\n", program_name, name, assisted_by)\n\n\n%%end program');

    fclose(file_id);
end

%end program