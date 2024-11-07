%% TestFindPhoneNumber.m 
% TestFindPhoneNumber tests the function FindPhoneNumber.
%
% NOTE: ALL PHONENUMBERS ARE RANDOMLY GENERATED, ANY PHONENUMBERS YOU MAY
% RECOGNISE ARE PURELY COINCIDENTAL.
%
% Author: MZ 2021
clear
clc
close all

%% Test 1
% Searching the name Thorin in the small contacts list should bring up
% Thorin's mobile phone number, i.e. it should display the line:
%  Name: Thorin      		Number: 027 0906 0127

searchstring1 = "Thorin";
results1 = FindPhoneNumber(searchstring1, "contactsSmall.mat");

fprintf("Searching for: %s\n", searchstring1);
if isempty(results1)
    fprintf("Did not find a match for %s\n", searchstring1)
else
    for i =1:length(results1)
        fprintf("Name: %-12s\t\tNumber: %s\n", results1{i}{1}, results1{i}{2});
    end
end
fprintf("\n");

%% Test 2
% Entering the name fili (note lowercase f) should bring up Fili's number.
% It should display the line:
%  Name: Fili        		Number: 027 0633 0098



%% Test 3
% Searching the name ILI (note capitals) in the small contacts list should
% bring up Fili and Kili's number (since both contain ili).  It should
% display the lines:
%  Name: Fili        		Number: 027 0633 0098
%  Name: Kili        		Number: 021 0547 0958



%% Test 4
% Searching the name Oin in the small contacts list should bring up Oin and
% Gloin's number (since both contain oin).  It should display the lines:
%  Name: Oin         		Number: 021 0422 0916
%  Name: Gloin       		Number: 027 0960 0656



%% Test 5
% Searching the name Bilbo in the small contacts list should display the
% line:
%  Did not find a match for Bilbo
% since that name is not in the contact list.



%% Test 6
% Searching the name "mic" in the large contacts list should It should
% display the lines:
%  Name: Micah       		Number: 021 0867 7719
%  Name: Michaela    		Number: 021 8296 7669
%  Name: Micaela     		Number: 022 2409 7150
%  Name: Michelle    		Number: 027 5428 5401

searchstring6 = "mic";
results6 = FindPhoneNumber(searchstring6, "contactsLarge.mat");

fprintf("Searching for: %s\n", searchstring6);
if isempty(results6)
    fprintf("Did not find a match for %s\n", searchstring6);
else
    for i =1:length(results6)
        fprintf("Name: %-12s\t\tNumber: %s\n", results6{i}{1}, results6{i}{2});
    end
end
fprintf("\n");