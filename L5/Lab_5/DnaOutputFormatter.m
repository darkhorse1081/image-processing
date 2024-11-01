function OutputString = DnaOutputFormatter(DNAStringMatches)
% DnaOutputFormatter formats the output of the function GetDnaMatches.
% 
% Input:  DNAStringMatches: array containing the DNA matches for [seq1a
%                               seq1b seq2a].
% Output:  OutputString:    a single string variable containing the
%                               formatted string.
%
% Author: MZ 2021

% Create each line separately.
line1 = sprintf('%15s%6s%15s%5s\n', 'Sequence 1','|','Sequence 2',' ');
line2 = sprintf(' %-9s%9i | %-10s%8i \n', 'a:', DNAStringMatches(1), 'a:', DNAStringMatches(3));
line3 = sprintf(' %-9s%9i | %19s\n', 'b:', DNAStringMatches(2), ' ');
line4 = sprintf('%s',repmat('-',1,41));
line5 = sprintf('\n %-9s%9i | %-10s%8i \n', 'Total:', DNAStringMatches(1) + DNAStringMatches(2) , 'Total:', DNAStringMatches(3));

% Combine each line into a single string.
OutputString = [line1 line2 line3 line4 line5];

end