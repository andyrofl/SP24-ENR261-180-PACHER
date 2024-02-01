%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
tutorial_name = "Tutorial_02_3";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assitance from %s. \n\n", tutorial_name, name, assisted_by)

% create two vectors
vector_A = 1:5
vector_B = 10:10:50

% output addition and subtraction operations using vectors A and B
vector_A+vector_B
vector_A-vector_B

% output multiplcation and division operations using vectors A and B
vector_A.*vector_B
vector_A./vector_B

% output matrix multiplication and division operations on vector A
vector_A*2
vector_A/2

% output element-wise multiplication and division operaations on vector A
vector_A.*2
vector_A./2

% output the square of each element in vector A
vector_A.^2

% create a time table giving the velocity and position of a falling object over time
% declare intitial data for time table
INITIAL_VELOCITY = 19.6;
INITIAL_POSITION = 0;
GRAVITY =9.81;

% create a vector for the time increment
time_increment = 0:0.25:4;

% compute the velocity over the time increment
velocity_Y = INITIAL_VELOCITY - GRAVITY*time_increment.^2;

% compute the position over the time increment
position = INITIAL_POSITION + INITIAL_VELOCITY.*time_increment + (1/2).*time_increment.^2;

%create a table to display the output of the calculations
display_table = [time_increment', velocity_Y', position'];

%display the output
disp('Analysis of a falling object')
disp(' ')
disp('    Time(s)  Vel(m/s)   Pos(s)')
disp(display_table)

%end tutorial