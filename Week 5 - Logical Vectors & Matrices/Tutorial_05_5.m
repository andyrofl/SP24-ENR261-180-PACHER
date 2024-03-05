%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_05_5";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% Create two matrices of different sizes
a = [1 2 4;6 8 10]
b = [1 3 5;7 9 11;13 15 17]

if (isscalar(a) | isscalar(b) | size(a) == size(b))
    dotProduct = a.*b
else
    disp("a.*b is not allowed")
end

b(3,:)=[];
dotProduct = a.*b

if size(a,2) == size(b,1) || isscalar(a) || isscalar(b) || size(a,1) == size(b,2)
    product = a*b;
else
    disp("a*b is not allowed")
end

%delete a column in matrix a
a(:,2)=[];
product = a*b


% Matrix Multiplication Loop Example

% Given
a = [1 2 3;
     4 5 6]
success = 0;
                  
% Continue reading in matrix b until two successful entries are provided
while (success < 2)
    b = input("\nEnter matrix b. Enclose the values in brackets:\n");
    if size(a,2) == size(b,1) || isscalar(a) || isscalar(b) %removed invalid condition || size(a,1) == size(b,2)
        % if satisfied, perform the multiplication and mark as correct
        matrixMult = a*b;
        success = success + 1;

        % Print success message
        fprintf("\n\nSuccess:\n")
        disp(matrixMult)
        fprintf("Rows in MatrixMult = %i = Rows in matrix a = %i\n", size(matrixMult,1), size(a,1));
        fprintf("Columns in MatrixMult = %i = Columns in matrix b = %i\n\n", size(matrixMult,2), size(b,2));
    else
        % If not satisfied, notify the user
        fprintf("Matrix b must have %i rows or be a scalar, try again\n",size(a,2));
    end
end


%end tutorial