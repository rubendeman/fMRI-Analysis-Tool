% RDM 080218

sliceno=6; % Must have mask image for ROI!
checksize=5;
filename={'1','2','3','4','5','6','7','8','9','10','11','12','13','14'};

load(strcat('roi',int2str(sliceno)));
maskimg=roi;

for j=1:length(filename)
a=regread(strcat(filename{j},'_registered.nii'),sliceno);
b=regread(strcat(filename{j},'_processed.nii'),sliceno);
orig{j}=b;
reg{j}=a;
mask{j}=maskimg.*reg{j};
end

figure
imshow([orig{2},orig{3},orig{5},orig{6};orig{7},orig{8},orig{9},orig{10};orig{11},orig{12},orig{13},orig{14}],[]);
figure
imshow([reg{2},reg{3},reg{5},reg{6};reg{7},reg{8},reg{9},reg{10};reg{11},reg{12},reg{13},reg{14}],[]);
figure
imshow([mask{2},mask{3},mask{5},mask{6};mask{7},mask{8},mask{9},mask{10};mask{11},mask{12},mask{13},mask{14}],[]);

drug=(mask{3}+mask{5}+mask{7}+mask{9}+mask{11}+mask{13})/6;
cont=(mask{2}+mask{6}+mask{8}+mask{10}+mask{12}+mask{14})/6;

figure
imshow([drug,cont],[])
diff=drug-cont;
% figure
% imshow([diff],[])
figure
imagesc(diff)
colormap(hot)
colorbar

[y,x]=ginput(1);
drugcheck=drug(x-checksize:x+checksize,y-checksize:y+checksize);
contcheck=cont(x-checksize:x+checksize,y-checksize:y+checksize);

[h,p,ci,stats] = ttest2(reshape(drugcheck,[1,numel(drugcheck)]),reshape(contcheck,[1,numel(contcheck)]))