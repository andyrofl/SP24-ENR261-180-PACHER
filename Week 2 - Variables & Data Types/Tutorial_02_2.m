%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
tutorial_name = "Tutorial_02_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assitance from %s. \n\n", tutorial_name, name, assisted_by)

%scalars
radius = 6
height = 12
width = 2

%vectors
row_vector = [1,2,3,4]
column_vector = [2;4;6;8]

%display a transposition of variable row_vector
row_vector'
%display a transposition of variable column_vector
column_vector'

%create a new vector using other vectors
meta_row_vector = [row_vector, column_vector', 0, 5]

%create vectors using colon notation
row_vector_2 = 0:10:100
row_vector_3 = -10:0

%create a vetor containing 6 evenly spaces values from zero to (pi/6)
pi_vector = linspace(0, pi/6, 6)

%create a 3x4 matrix of floaring point values
m=[3.0, 1.8, 3.6;
    4.6, -2.0, 21.3;
    0.0, -6.1, 12.8;
    2.3, 0.3, -6.1]

%display several values from within the matrix m
m(2,3)
fprintf("The value at row 3, column 3 of the matrix is %4.1f. ", m(3,3))
fprintf("The second element in row_vector_2 is %i. ", row_vector_2(2))
fprintf("The second element in column_vector is %i.\n", column_vector(2))

row_vector_2(2:4) %access the second through fourth elements in row_vector_2
row_vector_2(2:2:6) %access the elements in row_vector_2 in positions two, four, and six

m(2,3) %display the current value of m(2,3)
m(2,3) = 42.8; %update the value of m(2,3) to 42.8 but suppress output
m(2,3) %display the updated value of m(2,3)


%end tutorial