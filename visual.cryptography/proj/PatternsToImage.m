function[grey_scale] = PatternsToImage(cell_pattern)


[row,col] = size(cell_pattern);

scaled_row = 2*row;
scaled_col = 2*col;

grey_scale = uint8(zeros(scaled_row,scaled_col));

for i = 1:row
    for j = 1:col
        interior_array = cell_pattern{i,j};

        for k = 1:size(interior_array,1)
            for l = 1:size(interior_array,2)
                if i == 1 && j == 1
                    grey_scale(k,l) = interior_array(k,l);
                else
                    row_index = 2*i - (mod(k,2) == 1);
                    col_index = 2*j - (mod(l,2) == 1);
                    grey_scale(row_index, col_index) = interior_array(k,l);
                end
            end
        end
    end
end


