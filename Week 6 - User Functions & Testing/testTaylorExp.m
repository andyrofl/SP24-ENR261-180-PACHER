function tests = testTaylorExp
clc;
tests = functiontests(localfunctions);
format long
end

% Test cases of whole X values
function testValidSolutionWhole(testCase)
	X = [1,2,8,16,32,64];
	
	expectedExp = exp(X);
	actualExp = taylorExp(X);
	
	% Verify equal using tolerance
	verifyEqual(testCase, actualExp, expectedExp, 'RelTol', 0.000001);
end

% Test cases with non-whole X values
function testValidSolutionFraction(testCase)
	X = [0.0001, 0.25, 0.5, 1/2, 1.5, 3/2];
	
	expectedExp = exp(X);
	actualExp = taylorExp(X);
	
	% Verify equal using tolerance
	verifyEqual(testCase, actualExp, expectedExp, 'RelTol', 0.000001);
end

% Test a valid solution with a scalar X value
function testValidSolutionScalar(testCase)
	X = 6;
	
	expectedExp = exp(X);
	actualExp = taylorExp(X);
	
	% Verify equal using tolerance
	verifyEqual(testCase, actualExp, expectedExp, 'RelTol', 1*10^-6);
end

% Test a zero X value returns 1
function testZeroX(testCase)
	X = 0;
	
	expectedExp = 1;
	actualExp = taylorExp(X);
	
	% Verify equal using tolerance
	verifyEqual(testCase, actualExp, expectedExp, 'RelTol', 1*10^-6);
end

% Test that negative X values return 1
function testNegativeX(testCase)
	X = [-1,-2,-4,-8];
	
	expectedExp = [1,1,1,1];
	actualExp = taylorExp(X);
	
	% Verify equal using tolerance
	verifyEqual(testCase, actualExp, expectedExp, 'AbsTol', 1*10^-6);
end

% Test an empty X value returns blank
function testEmptyX(testCase)
	X = [];
	
	expectedExp = [];
	actualExp = taylorExp(X);
	
	% Verify equal using tolerance
	verifyEqual(testCase, actualExp, expectedExp, 'AbsTol', 1*10^-6);
end
