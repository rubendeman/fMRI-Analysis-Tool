function [maskim] = applymask(imname,maskname)

% RDM 032119

totalvol=niftiread(imname);
mask=niftiread(maskname);
maskim=mask.*totalvol;

end