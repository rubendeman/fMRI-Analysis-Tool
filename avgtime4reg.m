% RDM 080218

filename={'1','2','3','4','5','6','7','8','9','10','11','12','13','14','reference'};

for i=1:length(filename)
    V=niftiread(strcat(filename{i},'.nii'));
    W=mean(V,4);
    niftiwrite(W,strcat(filename{i},'_processed.nii'));
end