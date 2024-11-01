function[pattern_cells] = CreatePatterns()

pattern_cells = cell(1,6);

pattern_cells{1} = uint8([255,255;0,0]);
pattern_cells{2} = uint8([0,0;255,255]);
pattern_cells{3} = uint8([0,255;0,255]);
pattern_cells{4} = uint8([255,0;255,0]);
pattern_cells{5} = uint8([0,255;255,0]);
pattern_cells{6} = uint8([255,0;0,255]);

end