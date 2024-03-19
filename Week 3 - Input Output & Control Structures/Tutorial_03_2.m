%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
tutorial_name = "Tutorial_03_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assitance from %s. \n\n", tutorial_name, name, assisted_by)

%declare a variable and display it in the terminal
varA = 25
varA

%display some text
disp("just saying hello.")
disp(varA)
disp(" ")
disp("varA = ")
disp(" ")
disp(varA)
disp(" ")

%display some things incorrectly
disp("Displaying text and variables, the wrong way.")
disp("The next line should display 'varA = 25'.")
disp(["varA = ", varA])
disp(" ")

disp("Displaying text and variables, the right way.")
disp("The next line should display 'varA = 25'.")
disp(['varA = ', varA])
disp(" ")

%change the value of varA to 65
varA = 65;

%display things correctly
disp("Displaying text and variables, the right way. Final attempt...")
disp("The next line should display 'varA = 65'.")
disp(['varA = ', num2str(varA)])
disp(" ")

%display some things using fprintf
fprintf("Just saying hello.")
fprintf("\n\n\n")
fprintf("%i\n\n", varA)
fprintf("varA = %i\n\n", varA)
fprintf("varA = \n\n  %i\n\n", varA)

%display using fprintf and specify field with + precision
fprintf("Some right justified numers\n")
fprintf("%5i\n", 25)
fprintf("%5i\n", 100)
fprintf("%5i\n", 1000)
fprintf("Display varA as if it were a dollar amount:\n")
fprintf("varA has a value of $%5.2f\n\n", varA)

%display special characters using fprintf
fprintf("We need a double %% if we want the %% to print\n")
fprintf("We also need a double \\ if we want to print a \\\n")
fprintf("The \\t can be used to indent\n\tit represents using a tab on your keyboard.\n\n")


%end tutorial