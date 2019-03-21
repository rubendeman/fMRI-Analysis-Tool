function [avgim] = avgread(name)

% RDM 080318, Revised 032119

filename=name;

totalvol=niftiread(filename);
avgim = mean(totalvol,4);

end

