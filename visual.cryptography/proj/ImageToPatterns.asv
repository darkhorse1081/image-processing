function[cellPattern] = ImageToPatterns(greyscaleImage)

% Scale the number of rows and columns by 0.5 (halving the final cell)
[row,col] = size(greyscaleImage);
cellPattern = cell(row/2,col/2);

storageArray = uint8(zeros(2,2));

count = 0;
second_count = 0;

for i = 1:2:row
    second_count = second_count + 1;
    for j = 1:2:col
        if i == 1 % needs rework
            for m = i:i+1
                for n = j:j+1
                    storageArray(i,j) = greyscaleImage(i,j); % logic works
                end
            end
            cellPattern{i,(i+j)/2} = storageArray; % this needs rework
        else
            count = count + 1;
            for m = i:i+1
                for n = j:j+1
                    storageArray(i,j) = greyscaleImage(i,j);
                end
            end
            cellPattern{i-(second_count-1),j-(count-1)} = storageArray;
        end
    end
    count = 0;
end



end