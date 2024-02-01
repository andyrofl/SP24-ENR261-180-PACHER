%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
program_name = "Program_02_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assitance from %s. \n\n", program_name, name, assisted_by)

format bank % set output format to two decimal places for handling money values

%declare variables
capital_investment = 1000; % initial capital investment
rate = 0.09; % annual percentage yield
years_invested = [0:5:50]; % row vector with ten evenly spaced elements in range 0 to 50

%calculate the final balance
final_balance = capital_investment.*(1+rate).^years_invested;

table = [years_invested', final_balance'];
disp('Years Invested    Final Balance($)')
disp(table)

format default % reset format

%end program
