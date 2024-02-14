%Program Description:
%The purpose of this program is to perform various element-wise vector math operations on the given vectors and output the results 

%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
program_name = "Program_03_5";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)


fprintf("Output for Exercise 2.4 using format rat")
format rational
%create vector n
n = 1:5
PartA = n.*2 %double every element
PartB = n./2 %half every element
PartC = 1./n %invert every ement
PartB = (1./n).^2 %square the inverse of every element
format default


%clear variables and begin part 2 of the program
clear
fprintf("\nOutput for Instructor Problem 2.1 using the default format")
A = [12,24,36,48]
B = [6,4,2,1]

APlusB = A + B %add each element in the two vectors
AMinusB = A - B %subtract elements in B from their corresponding elements in A
ATimesB = A.*B %multiply elements in A by their corresponding elements in B
ADividesByB = A./B %divide elements in A by their corresponding elements in B
ARaisedToB = A.^B %raise elements in A to their corresponding elements in B

%end program