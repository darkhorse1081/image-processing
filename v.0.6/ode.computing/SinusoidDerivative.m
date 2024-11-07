function [dydt] = SinusoidDerivative(t, y)
% SinusoidDerivative calculates the derivative dy/dt for the equation
% dy/dt = cos(omega * t)
%
% Inputs:   t, the independent variable representing time
%           y, the dependent variable representing displacement
% Output:   dydt, the derivative of y with respect to t
%
% Author: PB 2021

% omega is the angular frequency.
omega = 2 * pi;
dydt = cos(omega * t);

return