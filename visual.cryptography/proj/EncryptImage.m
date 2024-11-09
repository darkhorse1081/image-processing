 function[cipheredPattern] = EncryptImage(greyscaleInput,keyPattern)
% function ciphers 2d uint8 pixel array in key patter based on corresponding greyscale input

% array pre allocation for faster speed
temporaryArray = uint8(zeros(2,2));

for i = 1:size(greyscaleInput,1)
    for j = 1:size(greyscaleInput,2)
        
        % image complement fucntion called based on dark pixel value on corresponding greyscaleInput
        if greyscaleInput(i,j) < 128
            temporaryArray = temporaryArray + ImageComplement(keyPattern{i,j});
            keyPattern{i,j} = temporaryArray;
        end
        temporaryArray = uint8(zeros(2,2));
    end
end

% final cipher outputted
cipheredPattern = keyPattern;


end