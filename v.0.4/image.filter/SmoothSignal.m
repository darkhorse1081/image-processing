function [newPoint] = SmoothSignal(input_array, n)
% input is array and n signal times
% output is smoothed after n times
    
    % for loop iterates n signal times
    for i = 1:n
        temp = SmoothSignalPass(input_array); % function stores temporary value
        input_array = temp;
    end

% final loop output executed    
newPoint = temp;


end