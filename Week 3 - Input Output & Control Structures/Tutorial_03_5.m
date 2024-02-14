%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
tutorial_name = "Tutorial_03_5";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assitance from %s. \n\n", tutorial_name, name, assisted_by)

%create a row vector of 10 through 1 descending
rowVector = fliplr(1:10);

%sum all of the values in rowVector and print the value and cumulative sum during each iteration
sum = 0;
for element = rowVector
    sum = sum + element;
    fprintf("The value of sum was %4.2f, after adding %i, sum is now %4.2f.\n", sum - element, element, sum)
end
%calculate and print the average value in rowVector
average = sum/10;
fprintf("The average value in rowVector is %4.2f.\n\n", average)

%print the current value of sum during each iteration, then add the next value in rowVector
sum = 0;
for element = rowVector
    fprintf("The value of sum was %4.2f", sum)
    sum = sum + element;
    fprintf(", after adding %i, sum is now %4.2f.\n", element, sum)
end
%calculate and print the average value in rowVector
average = sum/10;
fprintf("The average value in rowVector is %4.2f.\n\n", average)

%create a matrix
matrixA = [1:4; 5:8; 9:12];

%use a nested for loop to traverse each row and column in the matrix and print each value
for row = 1:3
    for col = 1:4
        fprintf("%i ", matrixA(row, col))
    end
    fprintf("\n")
end

shouldContinue = true;
while(shouldContinue)
    % Print a menu of options
    fprintf("Select one of the following options:\n")
    fprintf("\t1. Move forward\n")
    fprintf("\t2. Move backward\n")
    fprintf("\t3. Move left\n")
    fprintf("\t4. Move right\n")
    
    % Get the user input
    userChoice = input("\nPlease choose an option: ");
    
    % Now, check what the user chose
    switch userChoice
        case 1
            fprintf("You chose to move forward.\n\n")
            shouldContinue = false;
        case 2
            fprintf("You chose to move backward.\n\n")
            shouldContinue = false;
        case 3
            fprintf("You chose to move left.\n\n")
            shouldContinue = false;
        case 4
            fprintf("You chose to move right.\n\n")
            shouldContinue = false;
        otherwise
            fprintf("You entered an invalid choice, try again.\n\n")
    end
end


%end tutorial