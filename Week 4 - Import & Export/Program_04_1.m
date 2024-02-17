%Program Description:
%The purpose of this program is to read a list of hypothetical change values from an Excel file and calculate the minimum
%quantity and combination of coins to return as change for that given value. The resulting data will be output to the command
%window and saved in the original Excel file.


%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables
format default %set the default format

% Output of the title and author to the command window
program_name = "Program_04_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%declare math constants
QUARTER = 25;
DIME = 10;
NICKEL = 5;
PENNY = 1;

%declare file constants
FILE_NAME = 'Tutorial_04_1_Data.xlsx';
SHEET_NAME = 'Coins';

%read data from sheet and notify the user
original_change_values = readmatrix(FILE_NAME, 'Sheet', SHEET_NAME, 'Range', 'B4:B43');
fprintf('Original Data read from %s\n\n', FILE_NAME)


%===========================
%BEGIN MATH
%===========================
change_values = original_change_values;%create a copy of original_change_values with which to incrementally reduce to calculate coin quantities
remainder = mod(change_values, QUARTER); %calculate the remainder if the maximum number of quarters are given for each element in change_values
quarters = (change_values-remainder)./QUARTER;%divide the difference of each change_value and each remainder by the constant QUARTER to determine the number of quarters that were given as change 
change_values = remainder;%update each change_value to be the remainder after giving quarters as change.
   
%repeat calculation for dimes
remainder = mod(change_values, DIME);
dimes = (change_values-remainder)./DIME;
change_values = remainder;
%repeat calculation for nickels
remainder = mod(change_values, NICKEL);
nickels = (change_values-remainder)./NICKEL;
change_values = remainder;
%repeat calculation for pennies
remainder = mod(change_values, PENNY);
pennies = (change_values-remainder)./PENNY;
change_values = remainder;
%calculate total coins for each change_value
total_coins = quarters+dimes+nickels+pennies;
%=========================
%END MATH
%=========================

%display header information
fprintf('Minimum Number of Coins Needed to Make Change\n\n')
fprintf('Change Due(cents)\tQuarters\tDimes\t   Nickels\t   Pennies\t Total Coins')
%output the calculated values to the command window with header data
for r=1:length(original_change_values)
    fprintf('\n\t\t %3i \t\t %3i \t\t%3i \t\t%3i \t\t%3i \t\t%3i', original_change_values(r), quarters(r), dimes(r), nickels(r), pennies(r), total_coins(r))
end

%write calculated values to SHEET_NAME in FILE_NAME
writematrix([quarters, dimes, nickels, pennies, total_coins], FILE_NAME, 'Sheet', SHEET_NAME, 'Range', 'C4:G43')
fprintf('\n\nThese values have also been written to %s\n', FILE_NAME)

%end program