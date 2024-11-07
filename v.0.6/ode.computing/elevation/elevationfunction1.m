function [y] = elevationfunction1(x)
% elevationfunction1 returns the sled elevation from sea level at a given
% distance from the cliff face.
% Input: x, distance from cliff face
% Output: y, sled elevation from sea level.
% Author: MZ 2021

y = -(x-3).*(x-5);

end