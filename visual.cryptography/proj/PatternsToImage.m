function[grey_scale] = PatternsToImage(cell_pattern)
% The function takes as input a 2x2 cell array of uint8-encoded patterns, each representing discrete segments of an image. 
% It processes these patterns and synthesizes them into a unified grayscale image, represented as a 2D uint8 array, thereby 
% rendering it in a format compatible for visualization and subsequent storage.

[row,col] = size(cell_pattern);

% Scale the number of rows and columns by 2 (doubling the size of the final image)
scaled_row = 2*row;
scaled_col = 2*col;

% Initialize the greyscale image with zeros (black) of the scaled size
grey_scale = uint8(zeros(scaled_row,scaled_col));

% Loop through each element in the cell pattern (each small pattern)
for i = 1:row
    for j = 1:col
        interior_array = cell_pattern{i,j};

        for k = 1:size(interior_array,1)
            for l = 1:size(interior_array,2)
                % If it's the first pattern (top-left), directly embed to greyscale output
                if i == 1 && j == 1  
                    grey_scale(k,l) = interior_array(k,l);
                else
                    % For other patterns, determine where in the larger image to place the interior pattern
                    % Calculate the row index for the larger image based on whether the row (k) is odd or even
                    row_index = 2*i - (mod(k,2) == 1);
                     % Calculate the column index for the larger image based on whether the column (l) is odd or even
                    col_index = 2*j - (mod(l,2) == 1);

                    % Place the value from the interior pattern into the larger image at the calculated position
                    grey_scale(row_index, col_index) = interior_array(k,l);
                end
            end
        end
    end
end


