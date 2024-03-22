function tests = test_dateSort
clc;
tests = functiontests(localfunctions);
format long
end

% Test a single valid date
function test_valid_single_date(test_case)
	date = [1900, 1,1];
	
	expected_value = [1900, 1,1];
	actual_value = dateSort(date);

	verifyEqual(test_case, actual_value, expected_value);
end

% Test a valid set of dates
function test_valid_date_matrix(test_case)
	date = [2003, 3, 21; 0001, 1,1; 2003, 3, 25; 2003, 3, 22; 2003, 4, 20; 2002, 3, 21];
	
	expected_value = [0001, 1,1; 2002, 3, 21; 2003, 3, 21; 2003, 3, 22; 2003, 3, 25; 2003, 4, 20];
	actual_value = dateSort(date);

	verifyEqual(test_case, actual_value, expected_value);
end

% Test that an improperly formatted date does not throw an error
function test_invalid_date_format(test_case)
	date = [23, 3, 21];
	
	actual_value = dateSort(date);
	expected_value = [23, 3, 21];
	
	% Verify equal using tolerance
	verifyEqual(test_case, actual_value, expected_value);
end


% Test that an empty date value throws an error
function test_empty_date(test_case)

	verifyError(test_case, @()dateSort([]), 'MATLAB:badsubscript');
end