%Program Description:
%The purpose of this program is to take input values of the user's birth month and year to calculate their current age
%Age calculation assumes that if it is the user's birth-month currently, then their birthday has already passed


%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
program_name = "Program_03_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%define the current month and year
current_year = 2024;
current_month = 02;

%get input values for the user's month and year or birth
user_year = input("In which year were you born? ");
user_month = input("In which number month (1-12) were you born? ");

%calculate the difference between the user's birth year and the current year.
user_age = current_year - user_year;
%if the birth month has not yet passed, subtract one year as the user's birthday has not happened yet.
if (user_month > current_month)
    user_age = user_age - 1;
end

%print output accordingly based on the user's current age
if user_age < 20
        fprintf("%i? Wow, you're pretty young!\n", user_age)
elseif user_age <=40
        fprintf("%i? You're getting up there.\n", user_age)
elseif user_age > 40
        fprintf("%i? You're pretty old!\n", user_age)
else
    fprintf("There was an error")
end

%end program
