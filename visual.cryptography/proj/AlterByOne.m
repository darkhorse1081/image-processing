function[final] = AlterByOne(value)
    if value == 255
        final = uint8(value - 1);
    elseif value < 255
        final = uint8(value + 1);
    end
end




















