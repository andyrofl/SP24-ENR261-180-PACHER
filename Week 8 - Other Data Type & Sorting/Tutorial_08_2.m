%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_08_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% Vector v1 with only one element out of order, largest element first
fprintf('Vector v1') % print the vector name
v1 = [5 1:4];  % define the vector
bubble(v1);     % send the vector to the bubble() function

% Vector v2 with only one element out of order, smallest element last
fprintf('\nVector v2')
v2 = [2:5 1];
bubble(v2);

% Vector v3 with elements in descending order
fprintf('\nVector v3')
v3 = 5:-1:1;
bubble(v3);

% Vector v4 with all elements in ascending order
fprintf('\nVector v4')
v4 = 1:5;
bubble(v4);

% Vector v5 with character elements
fprintf('\nVector v5')
v5 = ['B' 'C' 'D' 'E' 'A' 'a'];
sorted = bubble(v5); % prints the order using the ASCII numerical values
                     % A = 65, B = 66, C = 67, D = 68, E = 69, a = 97
fprintf('\nSorted Character Vector\n')
% prints the sorted vector using a %c format that outputs the character
% values of the vector instead of their ASCII values
fprintf('%c\n',sorted);

%end tutorial