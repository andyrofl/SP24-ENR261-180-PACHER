%Program Description:
%The purpose of this program is to generate a vector of random resistors given a specification of quantity, mean, and standard deviation. Various statistics
% of the resistors are output to the console window related to distribution and any resistors identified to be beyond the maximum acceptable tolerance


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
program_name = "Program_05_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%declare specifications
MEAN_SPEC = 100;
STDDEV_SPEC = 15;
COUNT_SPEC = 10000;

%generate randomly valued resistors per the input specification and notify the user  
resistors = MEAN_SPEC + STDDEV_SPEC.*randn(COUNT_SPEC, 1);
fprintf('A total of %i resistors were created.\n\n', COUNT_SPEC)

%calculate the actual mean and standard deviation and display the output to the user
actual_mean = mean(resistors);
actual_std = std(resistors);
fprintf('Actual mean = %5.2f Ohms\n', actual_mean)
fprintf('Actual standard deviation = %6.2f Ohms\n\n', actual_std)

%calculate count of resistors over and under the actual mean. As a count the sums may not equal COUNT_SPEC if any match that value but should be accurate as a percentage when rounded
count_over_mean = sum(resistors > actual_mean);
count_under_mean = sum(resistors < actual_mean);
%display the calculated statistics to the user
fprintf('Percentage of Resistors > mean = %4.2f\n', 100*count_over_mean/COUNT_SPEC)
fprintf('Percentage of Resistors < mean = %4.2f\n\n', 100*count_under_mean/COUNT_SPEC)

%create first logical array of all resistors within the first standard deviation then calculate the percentage within the first stddev
inside_first_deviation = (resistors < actual_mean+actual_std) & (resistors > actual_mean-actual_std);
percent_first_deviation = 100*sum(inside_first_deviation) / COUNT_SPEC;
%display stats to user for this calculation
fprintf('Percentage of resistors within + or - 1 Stdev of the mean = %4.2f\n', percent_first_deviation)

%create second logical array of all resistors within the second standard deviation then calculate the percentage within the second stddev
inside_second_deviation = (resistors < actual_mean+2*actual_std) & (resistors > actual_mean-2*actual_std);
percent_second_deviation = 100*sum(inside_second_deviation) / COUNT_SPEC;
%display stats to user for this calculation
fprintf('Percentage of resistors within + or - 2 Stdev of the mean = %4.2f\n', percent_second_deviation)

%create second logical array of all resistors within the third standard deviation then calculate the percentage within the third stddev
inside_third_deviation = (resistors < actual_mean+3*actual_std) & (resistors > actual_mean-3*actual_std);
percent_third_deviation = 100*sum(inside_third_deviation) / COUNT_SPEC;
%display stats to user for this calculation
fprintf('Percentage of resistors within + or - 3 Stdev of the mean = %4.2f\n\n', percent_third_deviation)

%display header data for 'rejected resistors' more than 3 standard deviations from the calculated mean
fprintf('Rejected Resistor < mean-3*std or > mean+3*std\n\n')
fprintf('Resistor #\tResistor Value (Ohms)\n')
%loop through the rejected resistors and display output
for inc = 1:COUNT_SPEC
    if inside_third_deviation(inc) == 0
        fprintf("%5i\t\t\t%6.2f\n", inc, resistors(inc))
    end
end

%end program