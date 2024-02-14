%Program Description:
%The purpose of this program is to take input from a user and compare it against a list of "favorite numbers"" terminating
%the program when they have successfully guessed a number from that list

%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
program_name = "Program_03_4";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%define a list of my favorite numbers
fav_numbers = [4, pi, 42, 4.000001, 525600];

fprintf("HI! Try to guess my favorite number\n")
guessed_correctly = false;
%loop continuously until flag guessed_correctly has been set true
while(~guessed_correctly)
    user_guess = input("Enter a number: ");
    
    %loop through my favorite numbers and set guessed_correctly to true if one is a match for user_input
    for current_number = fav_numbers
        if current_number == user_guess
            guessed_correctly = true;
        end
    end

    %print the appropriate output for this guess if they were correct or incorrect
    if guessed_correctly
        fprintf("Good guess! %g is one of my favorite numbers!\n", user_guess)
    else
        fprintf("Good guess, but %g is not one of my favorite numbers\n", user_guess)
    end
end
%end program