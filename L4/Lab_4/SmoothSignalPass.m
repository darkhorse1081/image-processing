function [smoothed_points] = SmoothSignalPass(input_array)
% smoothes signal once


    initial = input_array;

    % based on length of initial values
    for i = 2:length(initial)-1
        input_array(i) = ThreePointSmooth([initial(i-1),initial(i),initial(i+1)]); 
    end

    smoothed_points = input_array;

end
