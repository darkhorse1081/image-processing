function results = FindPhoneNumber(searchstring, contacts)
% Author: MZ 2021

load(contacts, 'names', 'phonenumbers');

% Scan through contacts
results = cell(length(contacts));
% peopleFound = 1;
for i=1:length(names)
    % currentName = names(i);
    if contains(lower(names{i}), lower(searchstring)) % (length(strfind()))>0
        results{i} = {names{i}, phonenumbers{i}};
    end

end