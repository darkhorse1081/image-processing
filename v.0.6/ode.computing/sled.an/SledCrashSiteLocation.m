function [x] = SledCrashSiteLocation(elevationfunction, h)

% Initial crash site search guess
x0 = 0;
% Value, above which, is non-zero.
tol = 1e-6;

% Keep trying to look for the crash site until it is found.
offsetFunction = elevationfunction + h;
isFound = false;
while ~isFound
    % Calling fzero with the elevation function (with an offset) to try
    % find a root (possible crash location)
    x = fzero(offsetFunction,x0);
    if x > 0 && abs(offsetFunction(x)) < tol
        % exit condition, first positive non-zero crash location.
        isFound = true;
    end
    x0 = x0 + 1;    
end


end

