%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
tutorial_name = "Tutorial_03_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assitance from %s. \n\n", tutorial_name, name, assisted_by)


fprintf("Output will also be sent to the file Tutorial_03_1_Output.txt")
diary Tutorial_03_1_Output.txt

%create a matrix
matrixA = [1 2 3 4; 5 6 7 8; 9 10 11 12]

%create two more matrices
matrixB = ones(2,3)
matrixC = ones(4)

%create a matrix filled with zeroes
matrixD = zeros(3,2)

%create an identity matrix
identityMatrix = eye(3)

%access varipus values from the matrices
matrixA(2,3)
matrixA(3,:)
matrixA(:,2)
matrixA(:,[1,3])
matrixA(:,1:2:3)
matrixA(:,2:4)

%begin trig table the long way
angles = [0:30:360]
sineValues = sind(angles)
cosineValues = cosd(angles)
tangentValues = tand(angles)
trigTable = [angles', sineValues', cosineValues', tangentValues'];

%display the trig table
disp('Angle(Deg)    Sine      Cosine   Tangent')
disp(trigTable)

%end tutorial
