function[output_key] = GenerateKey(integer_values, pattern_create)
    % This function generates an output cell array based on integer values
    % and a set of patterns. Each integer in the input array is used to select
    % a pattern from the pattern_create cell array.

    [row,col] = size(integer_values);

    % Initialize output_key as a cell array with the same size as integer_values.
    output_key = cell(size(integer_values));
    
    for i = 1:row
        for j = 1:col
            % Use the integer value at position (i, j) to select a pattern
            % from pattern_create and assign it to the corresponding cell in output_key.
            output_key{i,j} = pattern_create{integer_values(i,j)};
        end
    end

end
