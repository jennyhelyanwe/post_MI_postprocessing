%%%% This script is to generate the POM and baseline figure for ctrl and MI
clear
close all

cd ../SKPOMNZ
Parameters=importdata('NZPOM253.mat');
AbnormalityNZmid=importdata('AbnormalityMidNZ253.mat');
cleanindex=find(AbnormalityNZmid(:,1)==0);%%%% 245 models without abnormality in mid NZ

%% plot POM for NZ and Acute BZ1 as grey and baselines as black
cd NZepiPOM253
param.bcl=1000;
figure()
for i=1:length(cleanindex)
    index=Parameters(cleanindex(i),1);
    filename=sprintf('%s%d%s%d%s','NZepiCL',param.bcl,'Model',index,'.mat');
    data=importdata(filename);
    plot(data.time,data.V,'color','b')
    hold on
    
end
cd ..
baselineNZEpi=importdata('NZepiCL1000Model0.mat');

% title('NZ Epicardial Models')
xlabel('Time (ms)')
ylabel('Vm (mV)')
set(gca,'fontsize',16,'fontweight','bold');

cd ../SKPOMBZ/BZepiPOM253Allcurrents
% figure()
for i=1:length(cleanindex)
    index=Parameters(cleanindex(i),1);
    filename=sprintf('%s%d%s%d%s','BZepiCL',param.bcl,'Model',index,'.mat');
    data=importdata(filename);
    plot(data.time,data.V,'color',[0.5 0.5 0.5])
    hold on    
end
baselineBZ1Epi=importdata('BZepiCL1000Model0.mat');
plot(baselineNZEpi.time,baselineNZEpi.V,'color','k','LineWidth',2)
plot(baselineBZ1Epi.time,baselineBZ1Epi.V,'color','r','LineWidth',2)
% title('Chronic RZ1 Epicardial Models')
xlabel('Time (ms)')
ylabel('Vm (mV)')
set(gca,'fontsize',16,'fontweight','bold');
cd ..
%% plot POM for NZ and RZ1 as grey and baselines as black
cd ../SKPOMNZ/NZepiPOM253
param.bcl=1000;
figure()
for i=1:length(cleanindex)
    index=Parameters(cleanindex(i),1);
    filename=sprintf('%s%d%s%d%s','NZepiCL',param.bcl,'Model',index,'.mat');
    data=importdata(filename);
    plot(data.time,data.V,'color','b')
    hold on
    
end
cd ..
baselineNZEpi=importdata('NZepiCL1000Model0.mat');

% title('NZ Epicardial Models')
xlabel('Time (ms)')
ylabel('Vm (mV)')
set(gca,'fontsize',16,'fontweight','bold');

cd ../SKPOMHFRZ/RZepiPOM253HegyiCaMKJrelSlow
% figure()
for i=1:length(cleanindex)
    index=Parameters(cleanindex(i),1);
    filename=sprintf('%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'.mat');
    data=importdata(filename);
    plot(data.time,data.V,'color',[0.5 0.5 0.5])
    hold on    
end
baselineRZ1Epi=importdata('RZepiCL1000Model0.mat');
plot(baselineNZEpi.time,baselineNZEpi.V,'color','k','LineWidth',2)
plot(baselineRZ1Epi.time,baselineRZ1Epi.V,'color','r','LineWidth',2)
% title('Chronic RZ1 Epicardial Models')
xlabel('Time (ms)')
ylabel('Vm (mV)')
set(gca,'fontsize',16,'fontweight','bold');
cd ..

cd ../SKPOMHFBZ