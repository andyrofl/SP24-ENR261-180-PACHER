%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_08_3";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

% Define the original matrix
original = [20 90 40
            60 20 30
            70 50 10
            50 10 60];

% 1 means sort columns, if 'ascend' is omitted the default is ascend        
colSortAscend = sort(original,1)
colSortDescend = sort(original,1,'descend')
% 2 means sort by rows
rowSortAscend = sort(original,2,'ascend')
rowSortDescend = sort(original,2,'descend')
% output the original matrix for easy comparison
disp(' ')
original

% Sort original's row 4, row4SortAscend is a vector with the contents of
% row 4 in ascending order. Row4OriginalCols is a vector showing each sorted
% element's original column number 
[row4SortAscend,row4OriginalCols] = sort(original(4,:),2,'ascend')

% preallocate memory for the ColShiftByRow4 Matrix
nRows = size(original,1);
nCols = size(original,2);
colShiftByRow4 = zeros(nRows,nCols);

% Use a for loop to shift the columns of each row of the original vector into an
% order determined by the ascending order of row 4.
for n = 1:nRows
     % uses the row4OriginalCols vector to re-arrange each row (n,:) into
     % the order determined by row4OriginalCols.
     colShiftByRow4(n,:)= original(n,row4OriginalCols);
end
% outputs the new matrix with columns shifted according to the ascending
% order of row 1
original
colShiftByRow4



%end tutorial