%Program Description:
%The purpose of this program is to


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format compact %Set compact format

%Output of the title and author to the command window
program_name = "Program_12_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%define common symbols
syms x

fprintf('Part A: Original function f defined\n')
f = x^5 -x^4 -27*x^3 +13*x^2 +134*x -120

%part a
fprintf('\nf = factor(f)\n')
f = factor(f)
fprintf('\nX = solve(f)\n')
X = solve(f)

%part b
fprintf('\nPart B: Original function g defined\n')
g = (x+2) * (x+3) * (x-4) * (x-5)
fprintf('\ng = expand(g)\n')
g = expand(g)
fprintf('\npretty(g)\n')
pretty(g)
fprintf('\nX = solve(g)\n')
X = solve(g)



%end program