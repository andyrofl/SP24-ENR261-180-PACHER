%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
program_name = "Program_02_3";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assitance from %s. \n\n", program_name, name, assisted_by)

fprintf('Part A:\n')
disp(sqrt(2))

fprintf('Part B:\n')
disp((3+4)./(5+6))

fprintf('Part C:\n')
disp((5+3)./(5.*3))

fprintf('Part D:\n')
disp(2.^(3.^2))

fprintf('Part E:\n')
disp((2.*pi).^2)

fprintf('Part F:\n')
disp(2.*pi.^2)

fprintf('Part G:\n')
disp(1/sqrt(2.*pi))

fprintf('Part H:\n')
disp(1/(2.*sqrt(pi)))

fprintf('Part I:\n')
disp((2.3.*4.5).^(1/3))

fprintf('Part J:\n')
disp((1- 2/(3+2))/(1+ 2/(3-2)))

fprintf('Part K:\n')
disp(1000.*(1+(0.15/12)).^60)

fprintf('Part L:\n')
disp((1.23e-5 +5.678e-3).*0.4567e-4)


%end program
