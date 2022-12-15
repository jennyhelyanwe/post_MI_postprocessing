%%%%%Plot AP, CaT and active tension (Ta) traces for the baseline models of
%%%%%NZ and HF BZ and RZ
clear
close all

%% %%% CL=1000ms

% NZendo=importdata('NZendoCL1000Model01ms.mat');
% NZepi=importdata('NZepiCL1000Model01ms.mat');
% NZmid=importdata('NZmidCL1000Model01ms.mat');
% 
% 
% BZendoH=importdata('ChronicBZendoCL1000Model01ms.mat');
% RZendoH=importdata('ChronicRZ1endoCL1000Model01ms.mat');
% RZendoA=importdata('ChronicRZ2endoCL1000Model01ms.mat');
% 
% BZepiH=importdata('ChronicBZepiCL1000Model01ms.mat');
% RZepiH=importdata('ChronicRZ1epiCL1000Model01ms.mat');
% RZepiA=importdata('ChronicRZ2epiCL1000Model01ms.mat');
% 
% 
% BZmidH=importdata('ChronicBZmidCL1000Model01ms.mat');
% RZmidH=importdata('ChronicRZ1midCL1000Model01ms.mat');
% RZmidA=importdata('ChronicRZ2midCL1000Model01ms.mat');

%% %%% CL=800ms

% NZendo=importdata('NZendoCL800Model01ms.mat');
% NZepi=importdata('NZepiCL800Model01ms.mat');
% NZmid=importdata('NZmidCL800Model01ms.mat');
NZepi=importdata('NZepiCL800Model0adaptive.mat');

% BZendoH=importdata('ChronicBZendoCL800Model01ms.mat');
% RZendoH=importdata('ChronicRZ1endoCL800Model01ms.mat');
% RZendoA=importdata('ChronicRZ2endoCL800Model01ms.mat');

% BZepiH=importdata('ChronicBZepiCL800Model01ms.mat');
% RZepiH=importdata('ChronicRZ1epiCL800Model01ms.mat');
% RZepiA=importdata('ChronicRZ2epiCL800Model01ms.mat');
BZepiH=importdata('ChronicBZepiCL800Model0adaptive.mat');
RZepiH=importdata('ChronicRZ1epiCL800Model0adaptive.mat');
RZepiA=importdata('ChronicRZ2epiCL800Model0adaptive.mat');

% BZmidH=importdata('ChronicBZmidCL800Model01ms.mat');
% RZmidH=importdata('ChronicRZ1midCL800Model01ms.mat');
% RZmidA=importdata('ChronicRZ2midCL800Model01ms.mat');


% figure()
% subplot(3,3,1)
% plot(NZendo.currents.time,NZendo.currents.V,'k',BZendoH.currents.time,BZendoH.currents.V,'r',RZendoH.currents.time,RZendoH.currents.V,'m',RZendoA.currents.time,RZendoA.currents.V,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% title('Baseline Endocardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1','Chronic RZ2')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,2)
% plot(NZmid.currents.time,NZmid.currents.V,'k',BZmidH.currents.time,BZmidH.currents.V,'r',RZmidH.currents.time,RZmidH.currents.V,'m',RZmidA.currents.time,RZmidA.currents.V,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% title('Baseline Midmyocardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1','Chronic RZ2')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,3)
% plot(NZepi.currents.time,NZepi.currents.V,'k',BZepiH.currents.time,BZepiH.currents.V,'r',RZepiH.currents.time,RZepiH.currents.V,'m',RZepiA.currents.time,RZepiA.currents.V,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% title('Baseline Epicardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1','Chronic RZ2')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,4)
% plot(NZendo.currents.time,NZendo.currents.Cai,'k',BZendoH.currents.time,BZendoH.currents.Cai,'r',RZendoH.currents.time,RZendoH.currents.Cai,'m',RZendoA.currents.time,RZendoA.currents.Cai,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('CaT (mM)')
% % title('Baseline Endocardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1','Chronic RZ2')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,5)
% plot(NZmid.currents.time,NZmid.currents.Cai,'k',BZmidH.currents.time,BZmidH.currents.Cai,'r',RZmidH.currents.time,RZmidH.currents.Cai,'m',RZmidA.currents.time,RZmidA.currents.Cai,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('CaT (mM)')
% % title('Baseline Midmyocardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1','Chronic RZ2')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,6)
% plot(NZepi.currents.time,NZepi.currents.Cai,'k',BZepiH.currents.time,BZepiH.currents.Cai,'r',RZepiH.currents.time,RZepiH.currents.Cai,'m',RZepiA.currents.time,RZepiA.currents.Cai,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('CaT (mM)')
% % title('Baseline Epicardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1','Chronic RZ2')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,7)
% plot(NZendo.currents.time,NZendo.currents.Ta,'k',BZendoH.currents.time,BZendoH.currents.Ta,'r',RZendoH.currents.time,RZendoH.currents.Ta,'m',RZendoA.currents.time,RZendoA.currents.Ta,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Ta (kPa)')
% % title('Baseline Endocardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1','Chronic RZ2')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,8)
% plot(NZmid.currents.time,NZmid.currents.Ta,'k',BZmidH.currents.time,BZmidH.currents.Ta,'r',RZmidH.currents.time,RZmidH.currents.Ta,'m',RZmidA.currents.time,RZmidA.currents.Ta,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Ta (kPa)')
% % title('Baseline Midmyocardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1','Chronic RZ2')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,9)
% % plot(NZepi.time,NZepi.Ta,'k',BZepiH.time,BZepiH.Ta,'r',RZepiH.time,RZepiH.Ta,'m',RZepiA.time,RZepiA.Ta,'b','LineWidth',2)
% plot(NZepi.currents.time,NZepi.currents.Ta,'k',BZepiH.currents.time,BZepiH.currents.Ta,'r',RZepiH.currents.time,RZepiH.currents.Ta,'m',RZepiA.currents.time,RZepiA.currents.Ta,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Ta (kPa)')
% % title('Baseline Epicardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1','Chronic RZ2')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% %% plot pair-wise comparison between NZ BZ and RZ currents filled
% figure()
% subplot(3,2,1)
% plot(NZepi.currents.time,NZepi.currents.INa,'k',BZepiH.currents.time,BZepiH.currents.INa,'r',RZepiH.currents.time,RZepiH.currents.INa,'m','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('INa (\muA/\muF)')
% xlim([0 3])
% title('Baseline Epicardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,2,2)
% plot(NZepi.currents.time,NZepi.currents.INa,'k',BZepiH.currents.time,BZepiH.currents.INa,'r',RZepiA.currents.time,RZepiA.currents.INa,'m','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('INa (\muA/\muF)')
% xlim([0 3])
% title('Baseline Epicardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,2,3)
% plot(NZepi.currents.time,NZepi.currents.ICaL,'k',BZepiH.currents.time,BZepiH.currents.ICaL,'r',RZepiH.currents.time,RZepiH.currents.ICaL,'m','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('ICaL (\muA/\muF)')
% xlim([0 400])
% % title('Baseline Epicardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,2,4)
% plot(NZepi.currents.time,NZepi.currents.ICaL,'k',BZepiH.currents.time,BZepiH.currents.ICaL,'r',RZepiA.currents.time,RZepiA.currents.ICaL,'m','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('ICaL (\muA/\muF)')
% xlim([0 400])
% % title('Baseline Epicardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,2,5)
% plot(NZepi.currents.time,NZepi.currents.IKr,'k',BZepiH.currents.time,BZepiH.currents.IKr,'r',RZepiH.currents.time,RZepiH.currents.IKr,'m','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('IKr (\muA/\muF)')
% xlim([0 500])
% % title('Baseline Epicardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,2,6)
% plot(NZepi.currents.time,NZepi.currents.IKr,'k',BZepiH.currents.time,BZepiH.currents.IKr,'r',RZepiA.currents.time,RZepiA.currents.IKr,'m','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('IKr (\muA/\muF)')
% xlim([0 500])
% % title('Baseline Epicardial Model')
% legend('NZ','Chronic BZ','Chronic RZ1')
% set(gca,'fontsize',16,'fontweight','bold');


figure()
subplot(3,2,1)
% x = NZepi.currents.time';
% Y = [NZepi.currents.INa'; BZepiH.currents.INa';RZepiH.currents.INa'];
area(NZepi.currents.time',NZepi.currents.INa')
hold on
area(BZepiH.currents.time,BZepiH.currents.INa')
area(RZepiH.currents.time,RZepiH.currents.INa')
% xlabel('Time(ms)')
% ylabel('INa (\muA/\muF)')
xlim([0 3])
% legend({'NZ','BZ','RZ'})
set(gca,'fontsize',16,'fontweight','bold');
subplot(3,2,2)
% x = NZepi.currents.time';
% Y = [NZepi.currents.INa'; RZepiA.currents.INa';BZepiH.currents.INa';];
area(NZepi.currents.time',NZepi.currents.INa')
hold on
area(RZepiA.currents.time,RZepiA.currents.INa')
area(BZepiH.currents.time,BZepiH.currents.INa')
% xlabel('Time(ms)')
% ylabel('INa (\muA/\muF)')
xlim([0 3])
% legend({'NZ','BZ','RZ'})
set(gca,'fontsize',16,'fontweight','bold');
subplot(3,2,3)
% x = NZepi.currents.time';
% Y = [NZepi.currents.ICaL; RZepiH.currents.ICaL;BZepiH.currents.ICaL;];
area(NZepi.currents.time',NZepi.currents.ICaL)
hold on
area(RZepiH.currents.time,RZepiH.currents.ICaL)
area(BZepiH.currents.time,BZepiH.currents.ICaL)
% xlabel('Time(ms)')
% ylabel('ICaL (\muA/\muF)')
xlim([0 300])
% legend({'NZ','Acute BZ1'})
set(gca,'fontsize',16,'fontweight','bold');
subplot(3,2,4)
% x = NZepi.currents.time';
% Y = [NZepi.currents.ICaL; RZepiA.currents.ICaL;BZepiH.currents.ICaL;];
area(NZepi.currents.time',NZepi.currents.ICaL)
hold on
area(RZepiA.currents.time,RZepiA.currents.ICaL)
area(BZepiH.currents.time,BZepiH.currents.ICaL)
% xlabel('Time(ms)')
% ylabel('ICaL (\muA/\muF)')
xlim([0 300])
% legend({'NZ','Acute BZ1'})
set(gca,'fontsize',16,'fontweight','bold');
subplot(3,2,5)
% x = NZepi.currents.time';
% Y = [NZepi.currents.IKr'; RZepiH.currents.IKr';BZepiH.currents.IKr'];
area(NZepi.currents.time',NZepi.currents.IKr')
hold on
area(RZepiH.currents.time,RZepiH.currents.IKr')
area(BZepiH.currents.time,BZepiH.currents.IKr')
% xlabel('Time(ms)')
% ylabel('IKr (\muA/\muF)')
xlim([0 500])
% legend({'NZ','Acute BZ1'})
set(gca,'fontsize',16,'fontweight','bold');
subplot(3,2,6)
% x = NZepi.currents.time';
% Y = [NZepi.currents.IKr'; RZepiA.currents.IKr';BZepiH.currents.IKr'];
area(NZepi.currents.time',NZepi.currents.IKr')
hold on
area(RZepiA.currents.time,RZepiA.currents.IKr')
area(BZepiH.currents.time,BZepiH.currents.IKr')
% xlabel('Time(ms)')
% ylabel('IKr (\muA/\muF)')
xlim([0 500])
% legend({'NZ','Acute BZ1'})
set(gca,'fontsize',16,'fontweight','bold');
newcolors = ['k';'b';'r';];%%%%  
colororder(newcolors)

figure()
subplot(3,2,1)
% x = NZepi.currents.time';
% Y = [NZepi.currents.INa'; RZepiH.currents.INa';BZepiH.currents.INa';];
area(NZepi.currents.time',NZepi.currents.INa')
hold on
area(RZepiH.currents.time,RZepiH.currents.INa')
area(BZepiH.currents.time,BZepiH.currents.INa')
% xlabel('Time(ms)')
% ylabel('INa (\muA/\muF)')
xlim([0 3])
% legend({'NZ','BZ','RZ'})
set(gca,'fontsize',16,'fontweight','bold');
subplot(3,2,2)
% x = NZepi.currents.time';
% Y = [NZepi.currents.INa'; BZepiH.currents.INa';RZepiA.currents.INa';];
area(NZepi.currents.time',NZepi.currents.INa')
hold on
area(BZepiH.currents.time,BZepiH.currents.INa')
area(RZepiA.currents.time,RZepiA.currents.INa')
% xlabel('Time(ms)')
% ylabel('INa (\muA/\muF)')
xlim([0 3])
% legend({'NZ','BZ','RZ'})
set(gca,'fontsize',16,'fontweight','bold');
subplot(3,2,3)
% x = NZepi.currents.time';
% Y = [NZepi.currents.ICaL; BZepiH.currents.ICaL;RZepiH.currents.ICaL;];
area(NZepi.currents.time',NZepi.currents.ICaL)
hold on
area(BZepiH.currents.time,BZepiH.currents.ICaL)
area(RZepiH.currents.time,RZepiH.currents.ICaL)
% xlabel('Time(ms)')
% ylabel('ICaL (\muA/\muF)')
xlim([0 300])
% legend({'NZ','Acute BZ1'})
set(gca,'fontsize',16,'fontweight','bold');
subplot(3,2,4)
% x = NZepi.currents.time';
% Y = [NZepi.currents.ICaL; BZepiH.currents.ICaL;RZepiA.currents.ICaL;];
area(NZepi.currents.time',NZepi.currents.ICaL)
hold on
area(BZepiH.currents.time,BZepiH.currents.ICaL)
area(RZepiA.currents.time,RZepiA.currents.ICaL)
% xlabel('Time(ms)')
% ylabel('ICaL (\muA/\muF)')
xlim([0 300])
% legend({'NZ','Acute BZ1'})
set(gca,'fontsize',16,'fontweight','bold');
subplot(3,2,5)
% x = NZepi.currents.time';
% Y = [NZepi.currents.IKr'; BZepiH.currents.IKr';RZepiH.currents.IKr';];
area(NZepi.currents.time',NZepi.currents.IKr')
hold on
area(BZepiH.currents.time,BZepiH.currents.IKr')
area(RZepiH.currents.time,RZepiH.currents.IKr')
% xlabel('Time(ms)')
% ylabel('IKr (\muA/\muF)')
xlim([0 500])
% legend({'NZ','Acute BZ1'})
set(gca,'fontsize',16,'fontweight','bold');
subplot(3,2,6)
% x = NZepi.currents.time';
% Y = [NZepi.currents.IKr'; BZepiH.currents.IKr';RZepiA.currents.IKr';];
area(NZepi.currents.time',NZepi.currents.IKr')
hold on
area(BZepiH.currents.time,BZepiH.currents.IKr')
area(RZepiA.currents.time,RZepiA.currents.IKr')
% xlabel('Time(ms)')
% ylabel('IKr (\muA/\muF)')
xlim([0 500])
% legend({'NZ','Acute BZ1'})
set(gca,'fontsize',16,'fontweight','bold');
newcolors = ['k';'r';'b';];%%%%  
colororder(newcolors)