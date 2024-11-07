function fileNames=GetFileNames()
% returns a cell array containg a list of all in the files in the 
% current directory

% grab directory listing
dirListing = dir;
% locate which listings are directories
dirIndex = [dirListing.isdir]
% remove directories from list
fileInfo = dirListing(dirIndex == 0);
% extract file names from file information structures
fileNames = {fileInfo.name};

return;


