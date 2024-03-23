%Program Description:
%The purpose of this program is to


%Clear the command window and all variables
clear %Clear the workspace variables
clc %Clear the command window contents
format default %Set the default format

%Output of the title and author to the command window
program_name = "Program_08_2";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%import data from the text file and assign to relevant variables
data = importdata('BirthDates.txt');
dates = data.data;
headers = data.textdata;

%display a header and the un-sorted data from the text file
print_date_data_to_console('Original Dates from BirthDates.txt\n', dates)

%use the dateSort() function to sort the data from the text file
sorted_dates = dateSort(dates);
%display a header and the sorted data from the text file
print_date_data_to_console('Birth Dates Sorted from Youngest to Oldest\n', sorted_dates)

%get the current year, month, and day
[y m d] =ymd(datetime('today'));

%use the over21() function to get a matrix of only entries in the sorted data where the person of interest is over 21 years of age
over_21 = over21(sorted_dates, y, m ,d);
%display a header and the sorted data of POI under 21 years of age
print_date_data_to_console('Birth Dates with Ages Less than 21 Years\n', sorted_dates(~over_21, :))

%display a header and the sorted data of POI aged 21 and older
print_date_data_to_console('Birth Dates with Ages Greater Than 21 Years\n', sorted_dates(over_21, :))


% function Definition
% H1: prints date data to the console
% Input Argument:
% header_text = text to display before the standard Year Month Day header
% date_data = a matrix with three columns of data data to display
% Output Argument:
% none. data has been printed to console
function print_date_data_to_console(header_text, date_data)
	fprintf(header_text)
	fprintf('\tYear   Month   Day\n')
	for row = 1:length(date_data(:,1))
		fprintf('\t%4i\t%02i\t\t%02i\n', date_data(row,1), date_data(row,2), date_data(row,3))
	end
	fprintf('\n')
end

%end program