%Program Description:
%The purpose of this program is to define two symbolic equations and evauate the simplest form of several expressions


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format compact %Set compact format

%Output of the title and author to the command window
program_name = "Program_12_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%define common symbols
syms x

fprintf('Original symbolic equations\n')
S1 = (x-4)^2 - (x+3)^2 + 16*x - 4
S2 = x^3 -6*x^2 - x + 30

%part a
fprintf('\nPart A: S1*S2\n')
product = S1*S2
fprintf('\n')
collected = collect(product)
fprintf('\npretty(S1*S2)\n')
pretty(collected)


%part b
fprintf('Part B: S1/S2\n')
S1divS2 = S1/S2
fprintf('\n')
simpled = simplify(S1divS2) %simple() has been removed matlab 2015 and onward
fprintf('\npretty(S1/S2)\n')
pretty(simpled)

%part c
fprintf('\nPart C: S1+S2\n')
S1plusS2 = S1+S2
fprintf('\n')
expanded = expand(S1+S2)
fprintf('\npretty(S1+S2)\n')
pretty(expanded)

%part d
S1plusS2_x_eq2 = subs(S1plusS2, x, 2)


%end program