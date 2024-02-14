%Program Description:
%The purpose of this program is to calculate the sum of various geometric series using loops and then again using vector math
%to show the differing length of compute times between the two approaches to the same result

%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
program_name = "Program_03_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%BEGIN EXERCISE 1
fprintf("Exercise 1:\n")
%loop through the vector and sum the square of all values from 1 to 1,000
tic
s = 0;
for i = 1:1000
    s = s + i*i;
end
fprintf("Sum of N^2 with N = 1 to 1,000 using a for loop = %i\n", s)
toc

%repeat the calculation with vectorization, using the sum() function
tic
n= 1:1000;
s = sum(n.^2);
fprintf("\nSum of n^2 with n = 1 to 1,000 using a vector = %i\n", s)
toc

clear
% BEGIN EXERCISE 2
fprintf("\n\nExercise 2:\n")
%loop through a vector with all odd values from 1 to 1,000 and sum the reciprocals with alternating odd and even signs
tic
s = 0;
sign = 1; %begin with a positive sign for the first iteration
for i = 1:2:1003
    s = s + (sign/i);
    sign = -sign; %after calculating this iteration, flip the sign for the next loop
end
fprintf("Sum of =/-1/N odds from N=1 to 1,003 using a for loop = %1.4f\n", s)
toc

%repeat the calculation with vectorization
tic
n= 1:4:1003; %icrement by four for each index to prevent double counting
s = sum(1./n - 1./(n+2)); %at any index n, sum the reciprocal of n minus the reciprocal of n+2. for any given odd number n this ensures that n+2 is also odd
fprintf("\nSum of =/-1/N odds from N=1 to 1,003 using a vector = %1.4f\n", s)
toc

clear
%BEGIN EXERCISE 3
fprintf("\n\nExercise 3:\n")
%loop through a vector with all odd values with 500 terms starting from 1 and sum the inverse of (n^2 + (n+2)^2)
tic
s = 0;
for i = 1:2:1000
    s = s + 1./((i*i)*((i+2)*(i+2)));
end
fprintf("Sum of 1/(N^2 * (N+2)^2 with N odds from N=1 to 1,000 using a for loop = %1.4f\n", s)
toc

%repeat the calculation with vectorization
tic
n= 1:2:1000;
s = sum(1./((n.^2).*(n+2).^2)); %at any index n, sum the inverse of n^2 * (n+2)^2
fprintf("\nSum of 1/(N^2 * (N+2)^2 with N odds from N=1 to 1,000 using a vector = %1.4f\n", s)
toc

%end program