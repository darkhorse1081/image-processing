function [final] = AlterByOne(value)
    % This function adjusts the input value by adding or subtracting 1.
    
    if value == 255
        % If the input value is 255, subtract 1 to avoid overflow.
        final = uint8(value - 1);
    elseif value < 255
        % If the input value is less than 255, add 1 to increment it.
        final = uint8(value + 1);
    end
end
