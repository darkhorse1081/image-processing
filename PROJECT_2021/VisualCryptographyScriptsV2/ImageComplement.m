function[swapped_array] = ImageComplement(greyscale_array)

% input = 2d array of grey scale values with b/w pixels
% output = 2d array of uint8 values for complement

[rows,columns] = size(greyscale_array); % sets size for rows-cols of original array
swapped_array = uint8(zeros(size(greyscale_array))); % initialized 2d array in uint8 format

for i = 1:rows % loops rows
    for j = 1:columns % loops cols
        swapped_array(i,j) = 255-greyscale_array(i,j); % calculates complemement for each pixel
    end
end
end