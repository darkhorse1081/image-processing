function [gas_pressure] = WriteGasData(file_name,volume_data,temperature_data)

initial_pressure = ((2.*8.314.*(temperature_data+273.15))./volume_data);

file_identification = fopen(file_name,'w');
    if file_identification == -1
        disp('Error opening file');
    else
        fprintf(file_identification, 'Pressure (Pa)\n');
        fprintf(file_identification, '%f', initial_pressure);
        fclose(file_identification);
        gas_pressure = initial_pressure;
    end
end

% gas data - experimental data on vol + temp (values)
% temp from C - K .. +273.15 - n = 2mol R = 8.314
% Pa (pressure to obtain) -> PV = nRT

% function adds array of calculated pressure to text.file + returns the pressure output