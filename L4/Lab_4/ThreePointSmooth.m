function [newPoint] = ThreePointSmooth(oldPoints)
% ThreePointSmooth takes an array of three points and returns a weighted
% average of these points.  This smoothing must be applied to an entire
% signal (except for its endpoints).
%
% INPUT:
%     oldPoints = array of 3 adjacent points from the unsmoothed signal
% OUTPUT:   
%     newPoint = smoothed point
%
% Author: PB 2021

newPoint = (oldPoints(1) + 2 * oldPoints(2) + oldPoints(3)) ./ 4;

end