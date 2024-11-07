% format string

labs = str2double(input('Enter your lab marks: ','s'));
assignments = str2double(input('Enter your assignment marks: ','s'));
projects = str2double(input('Enter your project marks: ','s'));
test = str2double(input('Enter your test marks: ','s'));
exam = str2double(input('Enter your exam mark: \n','s'));

final_mark = [labs,assignments,projects,test,exam];

fprintf('ENGGEN 131 Marks\n')
fprintf('Lab mark is %5d\n',labs)
fprintf('Assignments %5d\n',assignments)
fprintf('Projects    %5d\n',projects)
fprintf('Tests       %5d\n',test)
fprintf('Exams       %5d\n',exam)
disp('----------------------')
fprintf('Final Mark  %5d',FinalPercentage(final_mark))



