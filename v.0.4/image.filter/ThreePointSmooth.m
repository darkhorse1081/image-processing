function [newPoint] = ThreePointSmooth(oldPoints)
% ThreePointSmooth takes an array of three points and returns a weighted
% average of these points (except for its endpoints).

newPoint = (oldPoints(1) + 2 * oldPoints(2) + oldPoints(3)) ./ 4;

end