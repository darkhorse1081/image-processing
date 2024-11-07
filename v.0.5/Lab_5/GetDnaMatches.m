function [match_numbers] = GetDnaMatches(dnaStringShort)

% compare three strings with input loaded string (long/short)
% compare with sequence 1a, 1b and 2a

sequence1A = 'AGTCACT'; % whole is case insensitive
sequence1B = 'AcgT'; % whole is case sensitive
sequence2A = 'TACTga'; % only first three case insensitive

count_c = 0;

temporary = strfind(dnaStringShort,sequence2A(4:end));
    for i = 1:length(temporary)
        if strcmpi(dnaStringShort(temporary(i)-3:temporary(i)-1),sequence2A(1:3))
            count_c = count_c + 1;
        end
    end

match_numbers = [count(lower(dnaStringShort),lower(sequence1A)) count(dnaStringShort,sequence1B) count_c];

DnaOutputFormatter(match_numbers)

end
% string short - need to compare 
