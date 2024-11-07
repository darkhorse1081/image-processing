function[time_values, velocity_values] = SledNumericalSolutionOde45(timeSpan, initV)

[time_values,velocity_values] = ode45('SledVelocityDerivative',timeSpan,initV);

end