%% Step 1: Creating a key
%
% This script calls several functions that you will write, using them to
% create a key image, which can be used to "lock" up a message (or unlock it)
% The size of the key to create is determined by the size of the message 
% image(s) that need to be encrypted.
%
% For this script to work you will need to write the following functions:
% CreatePatterns, GenerateKey, PatternsToImage, EmbedImage

r = input('Enter the number of rows in your message image:');
c = input('Enter the number of columns in your message image:');

% Generate a random number from 1 to 6 for each element in the key
randomArray = randi(6,r,c);

% Generate six 2x2 patterns storing them in a 1D 1x6 cell array
p = CreatePatterns(); % You will write this function

% Create a cell array of patterns to act as key, by converting each random
% number to the associated 2x2 pattern
key = GenerateKey(randomArray,p); % You will write this function

% Convert they key from a cell array to a grayscale image 
% i.e. a 2D array of uint8 values, so that it can saved to a file
keyImage = PatternsToImage(key); % You will write this function

keyFilename = input('Enter the filename for your key image (or hit enter to use key.png):','s');

% Use the default name if one wasn't entered
if (length(keyFilename) == 0)
    keyFilename = 'key.png'; % no name entered, so default to 'key.png'
end

% Save our key to a png image
imwrite(keyImage,keyFilename);

% Next embed the key image within another image to hide it.
colourImageFilename = input('Enter the filename of a colour image to embed the key in:','s');
colourImage = imread(colourImageFilename);
hiddenImage = EmbedImage(keyImage,colourImage);

hiddenFilename = input('Enter the filename for your hidden key image (or hit enter to use hiddenKey.png):','s');

% Use the default name if one wasn't entered
if (length(hiddenFilename) == 0)
    hiddenFilename = 'hiddenKey.png'; % no name entered, so default to 'hiddenKey.png'
end

imwrite(hiddenImage,hiddenFilename);

% Display the generated key
figure(1)
imshow(keyImage)
title('Key image');

%% Step 2: Encryption
%
% This script encrypts a binary image (i.e. grayscale image containing
% contrasting black and white pixels), using a key that has been generated
% and then saved as an image.  The resulting cipher image is then embedded
% within a colour image to hide it.
% 
% For this script to work you will need to write the following functions:
% ImageToPatterns, EncryptImage, PatternsToImage, EmbedImage

plainImageFilename = input('Enter the filename of a binary image to encrypt:','s');

% Get image to encrypt
plainImage = imread(plainImageFilename); % will be a binary image (black/white)

keyImageFilename = input('Enter the filename for your key image (or hit enter to use key.png):','s');
% Use the default name if one wasn't entered
if (length(keyImageFilename) == 0)
    keyImageFilename = 'key.png'; % no name entered, so default to 'key.png'
end

% Get key to use
keyImage = imread(keyImageFilename);
% Convert key image to a cell array of patterns that we can work with
key = ImageToPatterns(keyImage); % You will write this function

% Encrypt the binary image using the key
cipher = EncryptImage(plainImage,key); % You will write this function
cipherImage = PatternsToImage(cipher); % You will write this function

% Write out the cipher image (not embbeded)
imwrite(cipherImage,'cipherImage.png');

% Next embed the cipher image within another image to hide it.
colourImageFilename = input('Enter the filename of a colour image to embed the cipher image in:','s');
colourImage = imread(colourImageFilename);
hiddenImage = EmbedImage(cipherImage,colourImage);

hiddenFilename = input('Enter the filename for your hidden cipher image (or hit enter to use hiddenCipher.png):','s');

% Use the default name if one wasn't entered
if (length(hiddenFilename) == 0)
    hiddenFilename = 'hiddenCipher.png'; % no name entered, so default to 'hiddenCipher.png'
end

imwrite(hiddenImage,hiddenFilename);

% Display the key and cipher images
figure(2)
subplot(1,2,1);
imshow(cipherImage)
title('Cipher image');
subplot(1,2,2);
imshow(keyImage);
title('Key image')

%% Step 3: Decryption
%
% This script decrypts a ciphered image that has been hidden in another
% one.
%
% For this script to work you will need to write the following functions:
% ExtractImage, DecryptImage

hiddenCipherFilename = input('Enter the filename for your hidden cipher image (or hit enter to use hiddenCipher.png):','s');
% Use the default name if one wasn't entered
if (length(hiddenCipherFilename) == 0)
    hiddenCipherFilename = 'hiddenCipher.png'; % no name entered, so default to 'hiddenKey.png'
end

hiddenKeyFilename = input('Enter the filename for your hidden key image (or hit enter to use hiddenKey.png):','s');
% Use the default name if one wasn't entered
if (length(hiddenKeyFilename) == 0)
    hiddenKeyFilename = 'hiddenKey.png'; % no name entered, so default to 'hiddenKey.png'
end

% Read in images and extract them
hiddenCipherImage = imread(hiddenCipherFilename);
hiddenKeyImage = imread(hiddenKeyFilename);

% Extract the hidden images
cipherImage = ExtractImage(hiddenCipherImage);
keyImage = ExtractImage(hiddenKeyImage);


% Decrypt the cipher image using the key
plainImage = DecryptImage(cipherImage,keyImage);
imwrite(plainImage,'plainImage.png');

% display the decrypted message
figure(3)
imshow(plainImage);
title('Decrypted Image');

%% AlterByOne
function [final] = AlterByOne(value)
    % This function adjusts the input value by adding or subtracting 1.
    
    if value == 255
        % If the input value is 255, subtract 1 to avoid overflow.
        final = uint8(value - 1);
    else
        % For all other values, add 1 to increment it.
        final = uint8(value + 1);
    end
end

%% ImageComplement
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

%% CreatePatterns
function[pattern_cells] = CreatePatterns()
    % This function creates a cell array containing six different 2x2 patterns.
    % Each pattern is represented as a 2x2 matrix with values of 0 or 255 (black or white).

    pattern_cells = cell(1,6);
    
    % Define each pattern as a 2x2 uint8 matrix and assign it to the cell array.
    pattern_cells{1} = uint8([255,255;0,0]);
    pattern_cells{2} = uint8([0,0;255,255]);
    pattern_cells{3} = uint8([0,255;0,255]);
    pattern_cells{4} = uint8([255,0;255,0]);
    pattern_cells{5} = uint8([0,255;255,0]);
    pattern_cells{6} = uint8([255,0;0,255]);

end

%% GenerateKey
function[output_key] = GenerateKey(integer_values, pattern_create)
    % This function generates an output cell array based on integer values
    % and a set of patterns. Each integer in the input array is used to select
    % a pattern from the pattern_create cell array.

    [row,col] = size(integer_values);

    % Initialize output_key as a cell array with the same size as integer_values.
    output_key = cell(size(integer_values));
    
    for i = 1:row
        for j = 1:col
            % Use the integer value at position (i, j) to select a pattern
            % from pattern_create and assign it to the corresponding cell in output_key.
            output_key{i,j} = pattern_create{integer_values(i,j)};
        end
    end

end

%% PatternsToImage
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
end

%% EmbedImage
function[embedded_output] = EmbedImage(binary,colour)

% initialized row and col based on array dimensions
[row,col] = size(binary);

for i = 1:row
    for j = 1:col
        % takes in uint8 values based on binary coordinates corresponding
        % to colour rgb array measurements
        red = colour(i,j,1);
        green = colour(i,j,2);
        blue = colour(i,j,3);

        total = double(red) + double(green) + double(blue);
        
        % compares values based on black and white and manipulates data
        % processes data based on odd calculation
        if binary(i,j) == 255
            if mod(total,2) == 0
                if colour(i,j,1) == 255
                    colour(i,j,1) = colour(i,j,1) - 1;
                else
                    colour(i,j,1) = colour(i,j,1) + 1;
                end
            else 
                colour(i,j,1) = colour(i,j,1);
            end
        % processes data based on even calculation
        elseif binary(i,j) == 0
            if mod(total,2) == 1
                if colour(i,j,1) == 255
                    colour(i,j,1) = colour(i,j,1) - 1;
                else
                    colour(i,j,1) = colour(i,j,1) + 1;
                end
            else
                 colour(i,j,1) = colour(i,j,1);
            end
        end
    end
end

% assigns colour to final output after embedding binary values
embedded_output = colour;

end

%% ImageToPatterns
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

%% EncryptImage
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

%% ExtractImage
function[binary] = ExtractImage(colour)

% binary dimesion data is used to initialize array parameters
binary = uint8(zeros(size(colour(:,:,1))));
[row,col] = size(colour(:,:,1));

% iterates through each element of each dimesnion for data comparion
for i = 1:row
    for j = 1:col
        red = colour(i,j,1);
        green = colour(i,j,2);
        blue = colour(i,j,3);
        
        % total values from dimension stored for data comparison
        total = double(red)+double(green)+double(blue);

        % typcasted value is converted to double then compared with binary data being modified
        if mod(total,2) == 0
            binary(i,j) = 0;
        elseif mod(total,2) == 1
             binary(i,j) = 255;
        end

    end
end

end

%% DecryptImage
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
%% end --
