function [gas_volume,gas_temperature] = ReadGasData(file_name,row_count)

% file i/o - txt file data pre processed - read->obtain val->write
% read gas txt file ->
gas_volume = zeros(1,row_count);
gas_temperature = zeros(1,row_count);

file_identification = fopen(file_name,'r'); % open and read
    if file_identification == -1
        disp('Error opening file');
    else
        i = 1;
        data_loader = fgetl(file_identification); % scan contents according to row

        while (ischar(data_loader)) && (i <= row_count)
            data_loader = fgetl(file_identification);
            array_values = sscanf(data_loader,'%f %f');
            gas_volume(i) = array_values(1);
            gas_temperature(i) = array_values(2);
            i = i + 1;
        end

    fclose(file_identification);
    end

end