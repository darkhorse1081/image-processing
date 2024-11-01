%% PlotSledSolutions.m
% PlotSledSolutions plots the solutions for the rocket-propelled sled.
% Uncomment the appropriate lines when the functions is created.
%
% Author: MZ 2021
clear
close all
clc

%%
% Initial velocity
v0 = 5;

% Number of time intervals
% Once all the functions are completed change the value of n and observe
% the differences.
n = 10;

%% SledAnalyticSolution
% Task 6.3
% Solve for rocket sled velocity analytically.

% Calculate analytical solution using SledAnalyticSolution
t_analytical = linspace(0, 10, n);
% Uncomment the following line when the function is created
% v_analytical = SledAnalyticSolution(t_analytical, v0);

%% SledNumericalSolutionOde45
% Task 6.5
% Solve for rocket sled velocity numerically with Ode45

% Solving for time 0 through to 10 seconds
tspan = [0 10];

% Calculate numerical solution using NumericalSolutionOde45
% Uncomment the following line when the function is created
% [t_ODE45, v_ODE45] = SledNumericalSolutionOde45(tspan, v0);

%% SledNumericalSolutionEuler
% Exam Practice Question
% Solve for rocket sled velocity numerically with the Euler Method.

% t_euler = linspace(0, 10, n);

% Calculate numerical solution using NumericalSolutionOde45
% Uncomment the following line when the function is created
% [v_euler] = SledNumericalSolutionEuler(t_euler, v0);

%% Plot solutions

figure
hold on
% Uncomment the plot commands when each associated function is complete
% plot(t_analytical,v_analytical)
% plot(t_ODE45,v_ODE45)
% plot(t_euler ,v_euler)
title('Rocket-Propelled Sled Velocity')
legend('Analytic solution', 'Numerical solution (ODE45)', 'Numerical solution (Euler)')
xlabel('Time (s)')
ylabel('Velocity (m/s)');
