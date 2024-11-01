%% SinusoidAnalyticSolution.m
% calculate the analytic solution of the ODE
% dy/dt = cos(omega * t);
%
% Author: PB 2021


% omega is the angular frequency
omega = 2*pi;

% our time range is from 0 to 1
t = linspace(0,1,100);

yAnalytic = 1 / omega * sin(omega * t);

figure(1)
plot(t,yAnalytic)