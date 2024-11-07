%% PlotSurfaces.m
% PlotSurfaces plots the surface f(x, y) = x^2 * y(y-1)(y+1) over [-1, 1] x
% [-1, 1] using two different methods for creating a surface, nested for
% loops and meshgrid.
%
% Author: MZ 2021
close all;
clear
clc

%% Creating the plot points
% Number of intervals for each direction.
x = linspace(-1, 1, 10);
y = linspace(-2, 2, 10);

%% Surface using method 1.
X = zeros(length(y), length(x));
Y = zeros(length(y), length(x));
Z1 = zeros(length(y), length(x));

for i = 1:length(y)
    for j = 1:length(x)
        Y(i, j) = y(i);
        X(i, j) = x(j);
        Z1(i, j) = 1 / exp(((X(i, j) * 5)^2) * ((Y(i, j) * 5)^2));
    end
end

%% Surface using method 2.
[X, Y] = meshgrid(x, y);
Z2 = Y .* sin(X * 5) - X .* cos(Y * 5);

%% Plotting

% Create a figure object.
figure

% Create a subplot with 2 columns.
% For the left subplot, plot the surface created with the nested for loops.
subplot(1, 2, 1)
surf(X, Y, Z1)
title('Plot of $1/exp((5*x)^2*(5*y)^2); using nested for loops', 'Interpreter', 'latex')
xlabel('x')
ylabel('y')

% For the right subplot, plot the surface created with mesh grid.
subplot(1, 2, 2)
surf(X, Y, Z2)
title('Plot of $y \cdot sin(5*x) - x \cdot cos(5*y); using meshgrid$', 'Interpreter', 'latex')
xlabel('x')
ylabel('y')
