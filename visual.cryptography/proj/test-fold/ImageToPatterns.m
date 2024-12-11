function[cellPattern] = ImageToPatterns(greyscaleImage)

% Scale the number of rows and columns by 0.5 (halving the final cell)
[row,col] = size(greyscaleImage);
cellPattern = cell(row/2,col/2);

% counter updates upon iteration through greyscale dimensions
count = 0;
second_count = 0;

% loop iterated every two spaces based on 2x2 factor for each block
for i = 1:2:row
    second_count = second_count + 1;
    for j = 1:2:col
            count = count + 1;
            storageArray = uint8(zeros(2,2));

            % storage interior array concatanated with greyscale values
            % before added to cell
            storageArray = storageArray + greyscaleImage(i:i+1,j:j+1);
            cellPattern{i-(second_count-1),j-(count-1)} = storageArray;
            if j == col-1
                count = 0;
            end
    end
end

end