function [filtered_array] = FilterImage(image_array)

[rows,cols,colours] = size(image_array);
    
    for i = 1:rows
        for j = 1:cols
            for k = 1:colours
                if IsPixelBlue(i,j,k) == false
                    image_array(i,j,k) = 255;
                end
            end
        end
    end
    filtered_array = image_array;
end