function[swapped_array] = ImageComplement(greyscale_array)
% This function takes a grayscale image array as input
% and returns its complement by inverting the pixel values.


 % Get the size (number of rows and columns) of the grayscale array.
[rows,columns] = size(greyscale_array);

    for i = 1:rows 
        for j = 1:columns 
            % Compute the complement of each pixel by subtracting 
            % the pixel value from 255, which inverts the grayscale.
            greyscale_array(i,j) = 255-greyscale_array(i,j);
        end
    end

swapped_array = greyscale_array;
end