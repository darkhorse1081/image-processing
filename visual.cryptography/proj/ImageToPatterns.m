function[cellPattern] = ImageToPatterns(greyscaleImage)

[row,col] = size(greyscaleImage);

% Scale the number of rows and columns by 2 (doubling the size of the final image)
scaledRow = row/2;
scaledCol = col/2;

cellPattern = cell(scaledRow,scaledCol);

storageArray = uint8(zeros(2,2));

for i = 1:2:row
    for j = 1:2:col
        if i <=2 && j <= 2
            storageArray(i,j) = greyscaleImage(i,j);
            cellPattern{} = storageArray;
        else
            row_index = 2*i - (mod(i,2)==1);
            col_index = 2*j - (mod(j,2)==1);

            storageArray(i,j) = greyscaleImage(i,j);
            cellPattern{row_index,col_index} = storageArray;
        end
    end
end



end