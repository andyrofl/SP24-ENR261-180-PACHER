%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
tutorial_name = "Tutorial_03_4";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assitance from %s. \n\n", tutorial_name, name, assisted_by)

%create variable someVal and show that it is non-zero
someVal = 1;
if(someVal)
    fprintf("someVal is not zero (%4.2f)\n\n", someVal)
end

%change the value of zomeVal to zero and print output conditionally
someVal = 0;
if(someVal)
    fprintf("someVal is not zero (%4.2f)\n\n", someVal)
elseif(~someVal)
    fprintf("someVal is equal to zero (%i)\n\n", someVal)
end

%add a third conditional for the impossible case that someVal is neither zero or non-zero
if(someVal)
    fprintf("someVal is not zero (%4.2f)\n\n", someVal)
elseif(~someVal)
    fprintf("someVal is equal to zero (%i)\n\n", someVal)
else
    fprintf("something is wrong if we hit this condition")
end

%re-write the if statement with the second conditional checking explicitly for a value equal to zero
if(someVal > 0 | someVal < 0)
    fprintf("someVal is not zero (%4.2f)\n\n", someVal)
elseif(someVal == 0)
    fprintf("someVal is equal to zero (%i)\n\n", someVal)
else
    fprintf("something is wrong if we hit this condition")
end


%use a switch statement to process the user's input
userChoice = input("Enter a number 1 through 5: ");
switch userChoice   
    case 1|2
        fprintf("You chose 1 or 2\n\n")
    case 3
        fprintf("You chose 3\n\n")
    case 4
        fprintf("You chose 4\n\n")
    case 5
        fprintf("You chose 5\n\n")
    otherwise
        fprintf("It appears you chose something other than 1-5...\\n\\n")
end

%end tutorial