% RDM Created 080218, Revised 032119

thresh=0; %Must specify threshold
sliceno=10;
checksize=5;
expfiles={};
contfiles={};

for j=1:length(expfiles)
a=avgread(strcat(expfiles{j},'.nii'));
b=avgread(strcat(contfiles{j},'.nii'));
expimage{j}=a(:,:,sliceno);
expimage{j}(expimage{j}<thresh)=0;
contimage{j}=b(:,:,sliceno);
contimage{j}(contimage{j}<thresh)=0;
end

figure
imshow([expimage{1}],[])
figure
expdisp=cat(1,expimage{:});
contdisp=cat(1,contimage{:});
imshow([expdisp;contdisp],[]);
exp=mean(cat(3,expimage{:}), 3);
cont=mean(cat(3,contimage{:}), 3);

figure
imshow([exp,cont],[])
diff=exp-cont;
figure
imshow([diff],[])
figure
imagesc(diff)
colormap(hot)
colorbar

[y,x]=ginput(1);
expcheck=exp(x-checksize:x+checksize,y-checksize:y+checksize);
contcheck=cont(x-checksize:x+checksize,y-checksize:y+checksize);

[h,p,ci,stats] = ttest2(reshape(expcheck,[1,numel(expcheck)]),reshape(contcheck,[1,numel(contcheck)]))
