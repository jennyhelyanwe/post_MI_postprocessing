%%%%%% This script is to plot the EAD POM from Chronic RZ2
clear
close all

cd ../SKPOMNZ
Parameters=importdata('NZPOM253.mat');
AbnormalityNZmid=importdata('AbnormalityMidNZ253.mat');
cleanindex=find(AbnormalityNZmid(:,1)==0);%%%% 245 models without abnormality in mid NZ


%% plot all the traces and abnormal traces of Chronic RZ2 mid
cd ../SKPOMHFRZAll/
AbnormalityChronicRZ2mid=importdata('Abnormality253MidRZAllCaMKJrelSlow.mat');

cd RZmidPOM253AllCaMKJrelSlow
param.bcl=1000;
figure()
for i=1:length(cleanindex)
    index=Parameters(cleanindex(i),1);
    filename=sprintf('%s%d%s%d%s','RZmidCL',param.bcl,'Model',index,'.mat');
    data=importdata(filename);
    plot(data.time,data.V,'color',[0.5 0.5 0.5])
    hold on
end
title('Chronic RZ2 Midmyocardial Cells')
xlabel('Time (ms)')
ylabel('Vm (mV)')
set(gca,'fontsize',16,'fontweight','bold');

% figure()
for i=1:size(Parameters,1)
    if AbnormalityChronicRZ2mid(i,1)==1 || AbnormalityChronicRZ2mid(i,3)==1
        index=Parameters(i,1);
        if ismember(i,cleanindex)==1
    filename=sprintf('%s%d%s%d%s','RZmidCL',param.bcl,'Model',index,'.mat');
    data=importdata(filename);
    plot(data.time,data.V,'r','LineWidth',2)
    hold on
        end
    end
end
% title('Chronic RZ2 Midmyocardial Cells')
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% set(gca,'fontsize',12,'fontweight','bold');
figure()
for i=1:length(cleanindex)
    index=Parameters(cleanindex(i),1);
    filename=sprintf('%s%d%s%d%s','RZmidCL',param.bcl,'Model',index,'.mat');
    data=importdata(filename);
    plot(data.time,data.Cai,'color',[0.5 0.5 0.5])
    hold on
end
title('Chronic RZ2 Midmyocardial Cells')
xlabel('Time (ms)')
ylabel('Cai (mM)')
set(gca,'fontsize',16,'fontweight','bold');

cd ../../SKPOMHFBZ