function [avgim] = regread(name,slicenumber);

% RDM 080318

slice=slicenumber;
filename=name;

totalvol=niftiread(filename);
avgim = totalvol(:,:,slice);

end

