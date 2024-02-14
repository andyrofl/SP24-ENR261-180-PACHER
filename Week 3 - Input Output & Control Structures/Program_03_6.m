%Program Description:
%The purpose of this program is to convert the given input values for certain units to other measurement systems
%Part A converts yarsd to meters
%Part B converts kg to pounds
%Part C converts m/s to km/h
%Part D converts PSI to kPa
%Part E converts kJ to calories

%Clear the command window and all variables
clc %Clear the command window contents
clear %Clear the workspace variables

% Output of the title and author to the command window
program_name = "Program_03_6";
name = "Andy Pacher";
assisted_by = "Nobody";
fprintf("Output for %s written by %s, with assistance from %s. \n\n", program_name, name, assisted_by)

%DEFINE CONVERSION FACTORS
meters_per_yard = 0.9144; %meters_per_yard ratio taken from Program_03_6.md
pounds_per_kilogram = 1/(0.454); %inverting the ratio of grams per pound given on page 52
kph_per_mps = 3600/1000; %calculated by unit conversion of (meters/second)*(60seconds/minute)*(60minutes/hour)*(1kilometer/1000meters)
kPa_per_PSI = 101.325/14.7; %using the conversion values for kPa and psi given on page 52
calories_per_kilojoule = 1/(0.004184); %using the conversion value for calories and joules given on page 52


%Converting yards to meters
fprintf("Part A:\n")
distance_yards = input("Enter a distance in yards then hit enter: ");%input value must be a number but need not be an integer
distance_meters = distance_yards.*meters_per_yard;
fprintf("%g yards = %g meters\n\n", distance_yards, distance_meters)


%Converting kilograms to pounds
fprintf("Part B:\n")
weight_kg = input("Enter a weight in kg then hit enter: \n");%input value must be a number but need not be an integer
weight_lb = weight_kg.*pounds_per_kilogram;
fprintf("%g kg = %g pounds\n\n", weight_kg, weight_lb)


%Converting meters/second to kilometers/hour
fprintf("Part C:\n")
speed_mps = input("Enter a speed in m/s then hit enter: \n");%input value must be a number but need not be an integer
speed_kph = speed_mps.*kph_per_mps;
fprintf("%g m/s = %g km/h\n\n", speed_kph, speed_mps)


%Converting pounds per square inch to kiloPascals
fprintf("Part D:\n")
pressure_PSI = input("Enter a pressure in PSI then hit enter: \n");%input value must be a number but need not be an integer
pressure_kPa = pressure_psi.*kPa_per_PSI;
fprintf("%g psi = %g kPa\n\n", pressure_psi, pressure_kPa)


%Converting kilojoules to calories
fprintf("Part E:\n")
energy_kJ = input("Enter an energy in kJ then hit enter: \n");%input value must be a number but need not be an integer
energy_cal = energy_kJ.*calories_per_kilojoule;
fprintf("%g kJ = %g cal\n\n", energy_kJ, energy_cal)

%end program