%Program Description:
%The purpose of this program is to simulate the infinite monkeys theorem by incrementally generating the phrase: "to_be" using randomly generated
%numbers and compare the time taken to generate five characters in sequence to smaller subsets of that phrase


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
program_name = "Program_10_1";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%define the target phrase
full_phrase = 'to_be';

%loop through each sub-sequence of the target phrase from index 1 to index inc
for inc = 1:length(full_phrase)
	tic
	sequence = full_phrase(1:inc);
	fprintf('\n\nThe attempted sequence is: %s\n\n', sequence)
	cycles = generate_phrase(sequence);%call user function generate_phrase() to calculate the number of attempts to generate the phrase
	fprintf("It took %i attempts to generate the sequence: %s\n\n", cycles, sequence)
	toc
end


% H1: Computes the number of attempts to generate the input_phrase by randomly generating sequential characters 
% Help Text:
% Input argument:
% input_phase = a string of characters to incrementally generate using random numbers
% 
% Output Argument:
% attempt_counter: the cumulative number of cycles to randomly generate each character in sequence
%
function attempt_counter = generate_phrase(input_phrase)
character_set = 'abcdefghijklmnopqrstuvwxyz_';%define the character set to be all lowercase letters and the underscore character
attempt_counter = 0; %start the counter at zero, for a single character generated on the first run through both loops the attempt counter will still be incrememnted once

	%loop through each character one at a time
	for current_char_index = 1:length(input_phrase)
		done_with_loop = false;
		while(~done_with_loop)
			%generate a random integer from 1 to 27 with each integer corresponding to a character in the character_set vector
			generated_char = round(1+ rand()*26);
			%determine if the generated character is a match for the character at index current_char_index in the input_phrase. store this as the
			%logival value that the while loop checks at the start of each iteration
			done_with_loop = character_set(generated_char) == input_phrase(current_char_index);
			%increment the attempt counter
			attempt_counter = attempt_counter + 1;
		end
	end
end
%end program