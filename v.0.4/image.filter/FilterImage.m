function[filtered_values] = FilterImage(image_array)

[rows,col,~] = size(image_array); % size function fills out variable 

filtered_values = image_array; % preallocating array for faster execution time

for i = 1:rows
    for j = 1:col
        red_colour = image_array(i,j,1);
        green_colour = image_array(i,j,2);
        blue_colour = image_array(i,j,3);
        determined = IsPixelBlue(red_colour,green_colour,blue_colour); % Get boolean value from function, IsPixelBlue
        if  determined == false % Assign the pixel to be white if returned value from function is
            filtered_values(i,j,1) = 255;
            filtered_values(i,j,2) = 255;
            filtered_values(i,j,3) = 255;
        end
    end
end
end

