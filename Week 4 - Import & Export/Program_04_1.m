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
change_values = readmatrix(FILE_NAME, 'Sheet', SHEET_NAME, 'Range', 'B4:B43');
fprintf('Original Data read from %s\n\n', FILE_NAME)


%loop through the change_values matrix and calculate the necessary change for each entry.
for current_change_value = change_values
    remainder = mod(current_change_value, QUARTER); %calculate the remainder if the maximum number of quarters are given
    quarters = (current_change_value-remainder)./QUARTER;%divide the difference of the current_change_value and the remainder by the constant QUARTER to determine the number of quarters that were given as change 
    current_change_value = remainder;%update the current_change_value to be the remainder after giving quarters as change. updating the loop index might be illegal but seems to work as expected
   
    %repeat calculation for dimes
    remainder = mod(current_change_value, DIME);
    dimes = (current_change_value-remainder)./DIME;
    current_change_value = remainder;

    %repeat calculation for nickels
    remainder = mod(current_change_value, NICKEL);
    nickels = (current_change_value-remainder)./NICKEL;
    current_change_value = remainder;

    %repeat calculation for pennies
    remainder = mod(current_change_value, PENNY);
    pennies = (current_change_value-remainder)./PENNY;
    current_change_value = remainder;

    %calculate total coins for this current_change_value and add all to the coin_quantities matrix
    total_coins = quarters+dimes+nickels+pennies;
    coin_quantities = [quarters, dimes, nickels, pennies, total_coins];
end

%output the calculated values to the command window with header data
fprintf('Minimum Number of Coins Needed to Make Change\n\n')
fprintf('Change due(cents)\tQuarters\tDimes\tNickels\tDimes\tPennies\tTotalCoins\n')
disp([change_values, coin_quantities])

%write calculated values to SHEET_NAME in FILE_NAME
writematrix(coin_quantities, FILE_NAME, 'Sheet', SHEET_NAME, 'Range', 'C4:G43')
fprintf('These values have also been written to Tutorial_04_1_Data.xlsx')

%end program