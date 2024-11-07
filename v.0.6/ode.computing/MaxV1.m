function [maximum_voltage] = MaxV1(parameter_values)

outputCurrent = ElectricalCircuitCurrent(parameter_values);
    while abs(outputCurrent(1))<=5 && abs(outputCurrent(2))<=5 && abs(outputCurrent(3))<=5 && abs(outputCurrent(4))<=5 && abs(outputCurrent(5))<=5
    parameter_values(1) = parameter_values(1) + 0.1;
    outputCurrent = ElectricalCircuitCurrent(parameter_values);
    end
    maximum_voltage = parameter_values(1) - 0.1;
end
    