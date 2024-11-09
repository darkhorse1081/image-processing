function[greyscaleImage] = DecryptImage(cipherArray,keyArray)

greyscaleImage = uint8(zeros(size(keyArray)));


% corresponding pixels of the cipher and key uint8 data is compared and b/w pixel value is inserted accorindingly into the greyscale output
for i = 1:size(keyArray,1)
    for j = 1:size(keyArray,2)
        
        % compares when both corresponding values are the same within cipher-key paires
        if (cipherArray(i,j) == 255 && keyArray(i,j) == 255) || (cipherArray(i,j) == 0 && keyArray(i,j) == 0)
            greyscaleImage(i,j) = 255;

        else
            greyscaleImage(i,j) = 0;

        end
            

    end
end


end