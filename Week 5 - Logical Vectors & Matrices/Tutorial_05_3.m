%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents

%Output of the title and author to the command window
tutorial_name = "Tutorial_05_3";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

format compact  % Unformatted ouput will not have blank lines added

x=0
y=1
z=50

% An if statement with a scalar expression is true if the scalar has any 
% non-zero value               
if (x)  % false since x = 0
    disp('x is true')
else
    disp('x is false')
end

if (y)  % true since y ~= 0
    disp('y is true')
else
    disp('y is false')
end

if (z)  % true since z ~= 0
    disp('z is true')
else
    disp('z is false')
end

vectorA = [10, 20, 30, 40, 50]
vectorB = [10, 0, 30, 40, 50]

if (vectorA)  % true since vectorA has no elements = 0
    disp('vectorA is true.')
else
    disp('vectorA is false.')
end

if (vectorB)  % false since at least one element of vectorA is 0
    disp('vectorB is true.')
else
    disp('vectorB is false.')
end

if (vectorA == vectorB)  % false since not all elements are equal
    disp('vectorA == vectorB is true.')
else
    disp('vectorA == vectorB is false.')
end

if (vectorA ~= vectorB)  % false since not all elements are unequal
    disp('vectorA ~= vectorB is true.')
else
    disp('vectorA ~= vectorB is false.')
end

if all(vectorA == vectorB) % false since all values are not equal
    disp('All values in vectorA and vectorB are equal')
else
    disp('Not all values in vectorA and vectorB are equal')
end

x=0:1:10
y=10:-1:0
if all(x == y) % false since not all elements are unequal
    disp('All values in the vectors are equal')
else
    disp('Not all values in the vectors are equal')
end

% true, since the position of 5 is the same for both vectors
if (any(vectorA ~= vectorB))
    disp('any(vectorA ~= vectorB) is true.')
else
    disp('any(vectorA ~= vectorB) is false.')
end


%end tutorial