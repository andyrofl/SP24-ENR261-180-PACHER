%Program Description:
%The purpose of this program is to generate a vector of random resistors given a specification of quantity, mean, and standard deviation.
% Any resistors with a value outside of the first deviation based on the mean value are identified, rejected, and re-generated until
% all resistor values are within one standard deviation at which point the program terminates and final statistics are displayed on the
% total number of resistors rejected and the number of batches with rejected resistors.


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
program_name = "Program_05_3";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%declare specifications
MEAN_SPEC = 100;
STDDEV_SPEC = 15;
COUNT_SPEC = 1000;

%generate randomly valued resistors per the input specification and notify the user  
resistors = MEAN_SPEC + STDDEV_SPEC.*randn(COUNT_SPEC, 1);
fprintf('A total of %i resistors were created.\n\n', COUNT_SPEC)

%calculate the actual mean and standard deviation from the intial batch and display the output to the user
actual_mean = mean(resistors);
actual_std = std(resistors);
fprintf('Actual mean = %5.2f Ohms\n', actual_mean)
fprintf('Actual standard deviation = %6.2f Ohms\n\n', actual_std)
fprintf('Resistors falling outside of the mean +/- 1 Standard Deviation are rejected\n\n')

%create variables needed inside the loop to keep all logic inside loop.
current_reject_count = COUNT_SPEC;
rejected_resistor_count = 0;
batch_count = 1;

while(current_reject_count > 0)
	%create logical array of all resistors outside the first standard deviation and sum the logical array
	%the mean and standard deviation are not re-calculated after the first batch
	outside_first_deviation = (resistors > actual_mean+actual_std) | (resistors < actual_mean-actual_std);
	current_reject_count = sum(outside_first_deviation);

	if(current_reject_count == 0)
		continue%return to top of loop if exit condition met, this prevents redundant printing and inrementing if all 
	elseif(current_reject_count == 1)
		fprintf('\n%i Resistor was rejected in Batch %i\n\n', current_reject_count, batch_count);%conditional for proper wording in the event that there is only one rejected resistor
	else
		fprintf('\n%i Resistors were rejected in Batch %i\n\n', current_reject_count, batch_count);
	end

	%perform data output operation for this batch if exit condition has not been met.
	fprintf('Position #\tResistor Value (Ohms)\n')
	for inc = 1:COUNT_SPEC
		if(outside_first_deviation(inc) == 1)
        	fprintf("%5i\t\t\t%6.2f\n", inc, resistors(inc))
    	end
	end

	%re-generate rejected resistors, still using orignal specifications
	resistors(find(outside_first_deviation == 1)) = MEAN_SPEC + STDDEV_SPEC.*randn(current_reject_count,1);
	%increment the cumulative count of rejected resistors and the batch number
	rejected_resistor_count = rejected_resistor_count + current_reject_count;
	batch_count = batch_count +1;
end

%Display final statistics. It is extremely unlikely that either number here will be one so singular verbage is unncessary.
%Final output line displays information on number of rejected resistors and batches with rejected resistors. It does not account for the number of 'good' resistors or how many batches needed to be created to accumulate that many 'good' resistors.
fprintf('\nA total of %i resistors were rejected in a total of %i batches\n', rejected_resistor_count, batch_count-1)


%end program