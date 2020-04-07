i=1;
pcc=zeros(32,8);
mpfc=zeros(32,8);
for name=['']

dcm=['dcm_a',name];
    load(dcm)
xY = DCM.Y;
Hz = DCM.Hz;
% plot(Hz,real(xY.csd(:,1,1)))
% figure
% plot(Hz,real(xY.csd(:,2,2)))
% figure
% plot(Hz,real(xY.csd(:,1,2)))
% 
% figure
% csd(:,1) = abs(xY.csd(:,1,1));
% plot(Hz,csd(:,1))
% figure
% csd(:,2) = abs(xY.csd(:,2,2));
% plot(Hz,csd(:,2))
pcc(:,i) = abs(xY.csd(:,1,1));
mpfc(:,i) = abs(xY.csd(:,2,2));
i=i+1;
end

figure
drug=mpfc(:,1:4);
cont=mpfc(:,5:8);
drugmean=mean(drug');
contmean=mean(cont');
plot(Hz,drugmean) 
hold on 
plot(Hz,contmean)

figure
drug=pcc(:,1:4);
cont=pcc(:,5:8);
drugmean=mean(drug');
contmean=mean(cont');
plot(Hz,drugmean) 
hold on 
plot(Hz,contmean)