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