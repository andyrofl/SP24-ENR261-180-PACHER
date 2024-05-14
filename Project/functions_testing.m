clear
clc
format default

%declare tuneable time constants in milliseconds
DIT = 0.100; %base unit of 100 ms
DAH = 3*DIT;
SPACE = DIT;
SPACE_LETTER = 3*DIT;
SPACE_WORD = 7*DIT;
%tolerance multipliers are based on the time duration they are multiplied with
TOLERANCE_LOW = 0.5;
TOLERANCE_HIGH = 2;

filename = "morseTable.txt";
opts = detectImportOptions(filename);
opts.VariableTypes = {'string', 'string'};
opts.DataLines = [1 38];

word_book = readtable(filename, opts);

board_list = readlines('board_types.txt')
port_list = serialportlist'

a = arduino('COM6', 'Nano3');
character_vector = '';
current_dit_dah_vector = '';
recent_character = '';
reading_high = false;
reading_low = false;
while(true)%WHILE TRUE REPLACED BY listening variable
	pin_status = a.readDigitalPin("D9");
	if(pin_status)%pin value high
		if(reading_high)%was previously reading high, continue reading high
			%do nothing, maybe tic idk?
		else%first time reading high, swap monitor booleans and analyze low time
			reading_high = true;
			reading_low = false;
			time_low = toc;
			%process time length low
			if((time_low > (SPACE*TOLERANCE_LOW)) && (time_low < (SPACE*TOLERANCE_HIGH)))
				%do nothing, letter is not finished yet
			elseif((time_low > (SPACE_LETTER*TOLERANCE_LOW)) &&(time_low < (SPACE_WORD*TOLERANCE_HIGH)))
				%if(time_low < (SPACE_LETTER*TOLERANCE_HIGH))
				converted_character =check_string_against_dictionary(word_book, current_dit_dah_vector);
					if(strcmp(converted_character, 'AR'))
						fprintf('special char AR found, message complete')
					elseif(strcmp(converted_character, 'KA'))
						fprintf('special char KA found')
						clc
					else
						fprintf('%s', converted_character)
						character_vector = converted_character;
					end
				if(time_low > (SPACE_WORD*TOLERANCE_LOW))
					fprintf(' ')
					character_vector = ' ';
				end
				current_dit_dah_vector = '';%clear vector after processing
			end
			tic;
		end
	else
		if(reading_low)
			%do nothing?, maybe flip conditions
		else%first time reading low, swap monitor booleans and analyze high time
			reading_high = false;
			reading_low = true;
			time_high = toc;
			%if the time high was greater than DAH length times low tolerance, and lower than DAH length times high tolerance
			if((time_high > (DAH*TOLERANCE_LOW)) && (time_high < (DAH*TOLERANCE_HIGH)))
				current_dit_dah_vector(end+1) = '-';
			elseif((time_high > (DIT*TOLERANCE_LOW)) && (time_high < (DIT*TOLERANCE_HIGH)))
				current_dit_dah_vector(end+1) = '.';
			end
			tic
		end
	end
end

%when listen enabled
%1. calculate time high before signal goes low again
	%if high for 1 dit record a ., if high for 1 dah record a -
%2. calculate time that signal has stayed low
	%if low for 1 dit, return to 1 and continue listening for current character
	%if low for 3 dits or more
		%send character to dictionary
		%if not listening, check for KA character, set recording to active and return to 1
		%if already in a recording state
			%check for AR character and end recording if so
			%if character is not AR terminating character, then add to message string
			%if low for 7 dits, add a space to the message spring
			%in either the 3 or 7 case, return to 1 and continue listening

%check_string_against_dictionary(dictionary, '.-')

function character =  check_string_against_dictionary(dictionary, input_string)
	character = '';
	%dictionary_length = size(dictionary(:,2))
	for inc = 1:38
		if(strcmp(input_string, dictionary{inc,2}))
			character = dictionary{inc, 1};
		end
	end
end

