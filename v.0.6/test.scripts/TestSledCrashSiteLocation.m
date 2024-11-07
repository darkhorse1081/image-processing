%% TestSledCrashSiteLocation.m
% TestSledCrashSiteLocation tests the function SledCrashSiteLocation.
%
% NOTE: Even though some functions may not "look" representative of a
% flight path (i.e. upside down) we still are looking for the smallest
% non-zero positive root.
%
% Author: MZ 2021
clear
close all
clc

%% Test 1
f1 = @elevationfunction1;
h1 = 25;
x1 = SledCrashSiteLocationFixed(f1, h1);

fprintf("Crash site location from the cliff: %f m\n", x1);

% Might be a good idea to plot the functions. (uncomment)
% figure
% hold on
% x1_points = linspace(0, 10, 100);
% plot(x1_points, f1(x1_points) + h1)
% plot(x1, f1(x1) + h1, 'o')
% xlabel('x')
% ylabel('y')

%% Test 2
f2 = @elevationfunction2;
h2 = 0;
x2 = SledCrashSiteLocationFixed(f2, h2);

fprintf("Crash site location from the cliff: %f m\n", x2);

% Might be a good idea to plot the functions. (uncomment)
% figure
% hold on
% x2_points = linspace(0, 10, 100);
% plot(x2_points, f2(x2_points) + h2)
% plot(x2, f2(x2) + h2, 'o')
% xlabel('x')
% ylabel('y')

%% Test 3
f3 = @elevationfunction3;
h3 = 25;
x3 = SledCrashSiteLocationFixed(f3, h3);

fprintf("Crash site location from the cliff: %f m\n", x3);

% Might be a good idea to plot the functions. (uncomment)
% figure
% hold on
% x3_points = linspace(0, 10, 100);
% plot(x3_points, f3(x3_points) + h3)
% plot(x3, f3(x3) + h3, 'o')
% xlabel('x')
% ylabel('y')

%% Test 4
% It would be a good idea to include more tests.


%% Test 5
