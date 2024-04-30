%Program Description:
%The purpose of this program is to


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format compact %Set compact format

%Output of the title and author to the command window
program_name = "Program_12_3";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%define symbols
syms T Fax Fay W x
fprintf('The Original Equations to Solve\n')
a = (12*T)/5 - W*x == 0
b = Fax - (4*T)/5 == 0
c = Fay + (3*T)/5 - W == 0

%part a
fprintf('\nPart A: Solutions for T, Fax, and Fay in terms of x and W\n')
[solution_Fax, solution_Fay, solution_T] = solve(a, b, c, Fax, Fay, T)


%part b
fprintf('\nPart B: Solutions for T, Fax, and Fay with W = 200 lbs\n')
solution_Fax = subs(solution_Fax, W, 200)
solution_Fay = subs(solution_Fay, W, 200)
solution_T = subs(solution_T, W, 200)

%part c
hold on
tp = ezplot(solution_T, [0 4], 1);
tp.set('Color', 'b');
fxp = ezplot(solution_Fax, [0 4], 1);
fxp.set('Color', 'r', 'LineStyle','-.')
fyp = ezplot(solution_Fay, [0 4], 1);
fyp.set('Color', 'g', 'LineStyle', '--');
plot_title = sprintf('T, %s, %s for a Beam', sym("F_a_x"), sym("F_a_y"));
labelPlot(plot_title, 'x in Feet', 'Force in Pounds');
xlim([0 4]);
ylim([0 333]);
legend('T', 'Fax', 'Fay');
hold off

%end program