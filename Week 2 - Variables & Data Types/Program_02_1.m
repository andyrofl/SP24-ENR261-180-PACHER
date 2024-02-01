%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
program_name = "Program_02_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assitance from %s. \n\n", program_name, name, assisted_by)

% Begin exercise 2.1
fprintf("Output for exercise 2.1.\n")

% create VectorA with initial Values
VectorA = [2 3 -1]

% create VectorAPlus1 by adding 1 to the current value of each entry in VectorA
VectorAPlus1 = VectorA + 1


% Begin exercise 2.2
fprintf("Output for exercise 2.2.\n")

% create VectorB with initial values
VectorB = [1 4 8]

% create VectorBTimes3 by multiplying the current value of each entry in...
VectorBTimes3 = VectorB*3

% Begin exercise 2.3
fprintf("Output for exercise 2.3.\n")

% create VectorC and VectorD with initial values
VectorC = [1 2 3]
VectorD = [0 -1 1]

% create VectorCTimesVectorD by multiplying VectorC and VectorD
VectorCTimesVectorD = VectorC.*VectorD

% Begin exercise 2.4
fprintf("Output for exercise 2.4.\n")

% create VectorE with initial values
VectorE = [2 3 1]

% create VectorESquared by squaring the value of each entry in VectorE
VectorESquared = VectorE.^2

%end program
