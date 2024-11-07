function [x] = SledCrashSiteLocation(elevationfunction, h)
% SledCrashSiteLocation determines the distance from the cliff the
% rocket-propelled sled has landed into the ocean derived from the flight
% elevation function.
%
% NOTE: Even though some functions may not "look" representative of a
% flight elevation path (i.e. starting in the negatives down) we still are
% looking for the smallest positive root.
% 
% Input: elevationfunction: mathematical function f(x) describing the
%           flight elevation
%        h: cliff height.
% Output: x: crash site distance from cliff
%
% Author: MZ 2021

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
    % Increment crash site search location.
    x0 = x0 + 1;    
end


end

