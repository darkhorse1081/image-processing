function [outputArray] = ElectricalCircuitCurrent(parameter_array)
    
resistance = [1 -1 0 0 0; 
     0 1 1 -1 0;
     0 0 -1 1 -1;
     0 parameter_array(2) 0 parameter_array(4) parameter_array(5);
     0 parameter_array(2) 0 0 parameter_array(5)];

voltage = [0;0;0;parameter_array(1);parameter_array(1)-parameter_array(3)];

outputArray = resistance\voltage;
% outputArray = reshape(output_current,1,numel(output_current));
end
