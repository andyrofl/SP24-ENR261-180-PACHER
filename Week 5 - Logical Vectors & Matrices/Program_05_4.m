%Program Description:
%The purpose of this program is to generate ASCII art as efficiently as possible using the built-in functions in MATLAB


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
program_name = "Program_05_4";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%generate matrix A resembling a hollow box centered within the canvas
a=zeros(12,12); %fill with zeros
a(3:10, 3:10) = ones(8,8); %fill inner box with ones
a(5:8, 5:8) = zeros(4,4) %hollow out box with zeros

%generate matrix B with a border around the canvas
b = ones(12,12); %fill with ones
b(2:11,2:11) = zeros(10,10) %overwrite everything except the border with zeros

%generate matrix C resembling an 'X' crossing the diagonals of the canvas
c=eye(12,12); %create an identity matrix from top left to bottom right
c = double(c | rot90(c)) %cast a logical vector of the identity matrix OR'd with its 90 degree rotation into 12x12 double

%generate matrix D consisting of two horizontal and vertical lines crossing each other on the canvas
d = a(1:6, 1:6); %copy the top left quadrant of matrix A
d = double(d | rot90(rot90(d))); %cast a logical vector of the quadrant OR'd with its 180 degree rotation into a 6x6 double
d = repmat(d, 2) %repeat the quadrant into a 12x12 double

e = [a(9:12, 3:4), a(1:4, 3:4)]; %copy two 2x4 sections from matrix A to create a 4x4 checkerboard pattern
e = repmat(e, 3) %repeat the checkerboard pattern into a 12x12 double

%end program