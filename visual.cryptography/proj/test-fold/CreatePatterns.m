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