function [FinalMark] = FinalPercentage(Marks)
% FinalPercentage calculates the final percentage of the course given some
% assessment percentages (entered as values between 0 and 100 inclusive)

% Unpacking the marks
LabMark = Marks(1);
AssignmentMark = Marks(2);
ProjectMark = Marks(3);
TestMark = Marks(4);
ExamMark = Marks(5);

% Find course mark (out of 100).
FinalMark = LabMark/100*24 + AssignmentMark/100*2 + ProjectMark/100*20 ...
    + TestMark/100*24 + ExamMark/100*30; 
end 