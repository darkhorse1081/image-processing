function [v] = SledNumericalSolutionEuler(t, v0)
% SledNumericalSolutionEuler solves the derivative defined by
% SledVelocityDerivative (Task 6.4) using the Euler method.
%
% Inputs: t = time steps
%         v0 = initial velocity
% Output: v = velocity found with the euler method.
%
% Author: MZ 2021

% Step size
h = t(1)-t(0);

% Iterate through the time steps.
v(1) = v0;
for i = 1:length(t)
   v(j + 1) = v(i) + h * feval(SledVelocityDerivative, t(i), v(i))
end

end

