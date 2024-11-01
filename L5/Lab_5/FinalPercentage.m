function [FinalMark] = FinalPercentage(Marks)
% FinalPercentage calculates the final percentage of the course given some
% assessment percentages (entered as values between 0 and 100 inclusive)
% 
% Input:  Marks: A 1D array containing the marks for each component
%                as a value from 0 to 100 (e.g. 100 indicates 100%) The 1D
%                array should have the marks in the following order labs
%                score, assignments score, projects score, tests score,
%                exams score
%
%                The marks array does not have to contain integers
%              
% Output: FinalMark: final percentage for the course
%
% Example call:
% f = FinalPercentage([100 100 100 75 50])
% 
% Author: MZ 2021

% Unpacking the marks
LabMark = Marks(1);
AssignmentMark = Marks(2);
ProjectMark = Marks(3);
TestMark = Marks(4);
ExamMark = Marks(5);

% Apply assessment weights for percentage of final grades.
% Find course mark (out of 100).
FinalMark = LabMark/100*24 + AssignmentMark/100*2 + ProjectMark/100*20 ...
    + TestMark/100*24 + ExamMark/100*30; 
end