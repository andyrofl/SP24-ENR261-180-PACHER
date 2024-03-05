%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
tutorial_name = "Tutorial_05_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", tutorial_name, name, assisted_by)

%create a vector with negative vavlues
C = -4:2:4;
%get a logical vector of values greater than zero based on the initial vector C
D = C>0;


fprintf('\t\t\tC = %2i %2i %2i %2i %2i\n', C)
fprintf('\tD = (C>0) = %2i %2i %2i %2i %2i\n', D)

C = C .* D;
fprintf('C = (C .* D)  = %2i %2i %2i %2i %2i\n\n', C .* D)

E = -4:2:4;
%get a logical vector of values less than zero based on the initial vector E
F = E<0;

fprintf('\t\t\tE = %2i %2i %2i %2i %2i\n', E)
fprintf('  F = (E > 0) = %2i %2i %2i %2i %2i\n', F)
%assign those values to zero
E(F) = 0

%create an array with some zeros
x = [0, 4, 0, 8, 0];
%attempt to divide by zero
y = 1 ./ x; %creates divide by zero for 1st, 3rd and 5th elements

fprintf('This operation creates a divide by zero\n')
fprintf('\t\t  x   = %5i \t %5i \t %5i \t %5i \t %5i\n',x)
fprintf('y = (1 ./ x)  = %5.3f \t %5.3f \t %5.3f \t %5.3f \t %5.3f\n\n',y)

%replace 0 elements with eps. eps is the smallest increment in Matlab
fprintf('Replace the 0 elements in x with eps\n\n')
fprintf('\t\teps  = %9.3e\n\n',eps)

%get a logical vector of values that equal zero and print to command window
z = x == 0;
fprintf('\t\t  x  = %2i %2i %2i %2i %2i\n',x)
fprintf('z = (x == 0) = %2i %2i %2i %2i %2i\n\n',z)

%replace the values in x with eps and print to command window
x(z)=eps;
fprintf('z = (z .* eps) = %9.3e  %9.3e  %9.3e  %9.3e  %9.3e\n',x)

%divide with eps in place of zeros
y = 1 ./ x;
fprintf('y =  (1 ./ x)  = %9.3e  %9.3e  %9.3e  %9.3e  %9.3e\n',y)

%avoiding Infinity or really large terms
fprintf('\nReplacing Very Large Values in a Vector with 0\n\n')
v = 0:pi/24:2*pi;

%tanV will be very large when x = pi/2 and 3*pi/2
tanV = tan(v);

%largeTanV is equal to one when abs(tanV) < 1e10 and 0 for elements >= 1e10
largeTanV = abs(tanV) < 1e10;
%tanV2 .* largeTanV will remove large values because tanV .* largeTanV will = 0 for large tanV values
tanV2 = tanV .* largeTanV;

%for loop to print each line of the vectors with formatted output
disp(' v(deg)   tanV=tan(v)   largeTanV=abs(tanV)<1e10   tanV .* largeTanV')
for n=1:length(v)
    fprintf('%6.4f  %11.3e \t\t\t\t%i \t\t\t\t%11.3e\n',v(n),tanV(n),largeTanV(n),tanV2(n))
end

%plot graphs of the tan(x) with large values and with the very large values removed in the same figure window

% creates a figure window with 2 graphs (2 rows, 1 col), row 1 col 1 graph active
subplot(2,1,1)  
                
plot(v,tanV) %plot of the original y vector

%add labels and grid lines
title('tan(v) Without Removing Very Large Values')
xlabel('v (radians)')
ylabel('tan(v)')
grid on

subplot(2,1,2)  %row 1 col 1 graph active
plot(v,tanV2) %plot with the very large values of tanV replaced with zero

%addition of labels and grid lines
title('tan(v) With Very Large Values Replaced with 0')
xlabel('v (radians)')
ylabel('tan(v)')
grid on

%end tutorial