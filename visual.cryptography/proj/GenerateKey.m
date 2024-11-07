function[output_key] = GenerateKey(integer_values, pattern_create)

[row,col] = size(integer_values);
output_key = cell(size(integer_values));

for i = 1:row
    for j = 1:col
        output_key{i,j} = pattern_create{integer_values(i,j)};
    end
end

end
