%Program Description:
%The purpose of this program is to calculate the interest accrued and final balance of a bank account over a 12 month period
%assuming a variable interest rate based on the balance at the end of the month and a monthly deposit that is added after
%interest is acccrued each month. The data is then output in a table for the 12 month period.

%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
program_name = "Program_03_3";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%declare given variables and create vectors for output data
balance = 100000;
deposit = 1000;

%print header before starting loop
fprintf("Starting Balance = $%.2f, Monthly Deposit = $%.2f\n\n", balance, deposit)
fprintf("Month  Interest   Interest     Final\n")
fprintf("         Rate     Earned($)   Balance($)\n")
for inc = 1:12
    rate = 0;
    if(balance < 110001)
        rate = 0.01;
    elseif (balance < 125001)
        rate = 0.015;
    elseif (balance >125000)
        rate = 0.02;
    end %rate will be set to zero if no case is triggered

    %calculate the interest earned this month and the final balance
    interest = balance * rate; %calculate the interest accumulated this month
    balance = balance + deposit + interest; %calculate new cumulative balance after monthly deposit and interest added

    %print row data for current month. if month number is a single digit print an extra space before month number
    if inc<10
        fprintf("% i       %.3f     %.2f    %.2f\n", inc, rate, interest, balance)
    else
        fprintf("%i       %.3f     %.2f    %.2f\n", inc, rate, interest, balance)
    end
end


%end program