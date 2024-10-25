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
% BZ1endo=importdata('AcuteBZ1endoCL1000Model01ms.mat');
% BZ2endo=importdata('AcuteBZ2endoCL1000Model01ms.mat');
% BZ3endo=importdata('AcuteBZ3endoCL1000Model01ms.mat');
% 
% BZ1epi=importdata('AcuteBZ1epiCL1000Model01ms.mat');
% BZ2epi=importdata('AcuteBZ2epiCL1000Model01ms.mat');
% BZ3epi=importdata('AcuteBZ3epiCL1000Model01ms.mat');
% 
% 
% BZ1mid=importdata('AcuteBZ1midCL1000Model01ms.mat');
% BZ2mid=importdata('AcuteBZ2midCL1000Model01ms.mat');
% BZ3mid=importdata('AcuteBZ3midCL1000Model01ms.mat');

%% %%% CL=800ms

% NZendo=importdata('NZendoCL800Model01ms.mat');
% NZepi=importdata('NZepiCL800Model01ms.mat');
% NZmid=importdata('NZmidCL800Model01ms.mat');

NZepi=importdata('NZepiCL800Model0adaptive.mat');


% BZ1endo=importdata('AcuteBZ1endoCL800Model01ms.mat');
% BZ2endo=importdata('AcuteBZ2endoCL800Model01ms.mat');
% BZ3endo=importdata('AcuteBZ3endoCL800Model01ms.mat');

% BZ1epi=importdata('AcuteBZ1epiCL800Model01ms.mat');
% BZ2epi=importdata('AcuteBZ2epiCL800Model01ms.mat');
% BZ3epi=importdata('AcuteBZ3epiCL800Model01ms.mat');
BZ1epi=importdata('AcuteBZ1epiCL800Model0adaptive.mat');
BZ2epi=importdata('AcuteBZ2epiCL800Model0adaptive.mat');
BZ3epi=importdata('AcuteBZ3epiCL800Model0adaptive.mat');

% BZ1mid=importdata('AcuteBZ1midCL800Model01ms.mat');
% BZ2mid=importdata('AcuteBZ2midCL800Model01ms.mat');
% BZ3mid=importdata('AcuteBZ3midCL800Model01ms.mat');


% figure()
% subplot(3,3,1)
% plot(NZendo.currents.time,NZendo.currents.V,'k',BZ1endo.currents.time,BZ1endo.currents.V,'r',BZ2endo.currents.time,BZ2endo.currents.V,'m',BZ3endo.currents.time,BZ3endo.currents.V,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% title('Baseline Endocardial Model')
% legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,2)
% plot(NZmid.currents.time,NZmid.currents.V,'k',BZ1mid.currents.time,BZ1mid.currents.V,'r',BZ2mid.currents.time,BZ2mid.currents.V,'m',BZ3mid.currents.time,BZ3mid.currents.V,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% title('Baseline Midmyocardial Model')
% legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,3)
% plot(NZepi.currents.time,NZepi.currents.V,'k',BZ1epi.currents.time,BZ1epi.currents.V,'r',BZ2epi.currents.time,BZ2epi.currents.V,'m',BZ3epi.currents.time,BZ3epi.currents.V,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% title('Baseline Epicardial Model')
% legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,4)
% plot(NZendo.currents.time,NZendo.currents.Cai,'k',BZ1endo.currents.time,BZ1endo.currents.Cai,'r',BZ2endo.currents.time,BZ2endo.currents.Cai,'m',BZ3endo.currents.time,BZ3endo.currents.Cai,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('CaT (mM)')
% % title('Baseline Endocardial Model')
% legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,5)
% plot(NZmid.currents.time,NZmid.currents.Cai,'k',BZ1mid.currents.time,BZ1mid.currents.Cai,'r',BZ2mid.currents.time,BZ2mid.currents.Cai,'m',BZ3mid.currents.time,BZ3mid.currents.Cai,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('CaT (mM)')
% % title('Baseline Midmyocardial Model')
% legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,6)
% plot(NZepi.currents.time,NZepi.currents.Cai,'k',BZ1epi.currents.time,BZ1epi.currents.Cai,'r',BZ2epi.currents.time,BZ2epi.currents.Cai,'m',BZ3epi.currents.time,BZ3epi.currents.Cai,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('CaT (mM)')
% % title('Baseline Epicardial Model')
% legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,7)
% plot(NZendo.currents.time,NZendo.currents.Ta,'k',BZ1endo.currents.time,BZ1endo.currents.Ta,'r',BZ2endo.currents.time,BZ2endo.currents.Ta,'m',BZ3endo.currents.time,BZ3endo.currents.Ta,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Ta (kPa)')
% % title('Baseline Endocardial Model')
% legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,8)
% plot(NZmid.currents.time,NZmid.currents.Ta,'k',BZ1mid.currents.time,BZ1mid.currents.Ta,'r',BZ2mid.currents.time,BZ2mid.currents.Ta,'m',BZ3mid.currents.time,BZ3mid.currents.Ta,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Ta (kPa)')
% % title('Baseline Midmyocardial Model')
% legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,9)
% % plot(NZepi.time,NZepi.Ta,'k',BZepiH.time,BZepiH.Ta,'r',RZepiH.time,RZepiH.Ta,'m',RZepiA.time,RZepiA.Ta,'b','LineWidth',2)
% plot(NZepi.currents.time,NZepi.currents.Ta,'k',BZ1epi.currents.time,BZ1epi.currents.Ta,'r',BZ2epi.currents.time,BZ2epi.currents.Ta,'m',BZ3epi.currents.time,BZ3epi.currents.Ta,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Ta (kPa)')
% % title('Baseline Epicardial Model')
% legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% %% plot the currents as filled in plots
% %%%% color code in:https://uk.mathworks.com/help/matlab/creating_plots/specify-plot-colors.html
% %%%% Control: blue(	'#0072BD'[0 0.4470 0.7410]), 
% %%%% Acute BZ1:orange('#D95319'[0.8500 0.3250 0.0980]), 
% %%%% Acute BZ3: yellow('#EDB120'[0.9290 0.6940 0.1250]), 
% %%%% Acute BZ2: purple ('#7E2F8E'[0.4940 0.1840 0.5560]).
% %%%%%% Plot the line plots first and then make sure the colors appear in an
% %%%%%% order that they don't cover each other if possible. Don't use the
% %%%%%% stack mode of area function: for area(X,Y), if Y is a matrix, this
% %%%%%% function plots the relative contribution of each row element to the total height! 
% 
% figure()
% % subplot(1,2,1)
% plot(NZendo.currents.time,NZendo.currents.INa,'k',BZ1endo.currents.time,BZ1endo.currents.INa,'r',BZ2endo.currents.time,BZ2endo.currents.INa,'m',BZ3endo.currents.time,BZ3endo.currents.INa,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('INa (\muA/\muF)')
% xlim([0 3])
% title('Baseline Endocardial Model')
% legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% figure()
% % subplot(1,2,2)
% x = NZepi.currents.time';
% Y = [NZepi.currents.INa'; BZ1epi.currents.INa'; BZ3epi.currents.INa';BZ2epi.currents.INa'];
% area(x,Y(1,:))
% hold on
% area(x,Y(2,:))
% area(x,Y(3,:))
% area(x,Y(4,:))
% xlabel('Time(ms)')
% ylabel('INa (\muA/\muF)')
% xlim([0 3])
% legend({'Control','T wave inversion','normal ST-T','Brugada phenocopy'})
% set(gca,'fontsize',16,'fontweight','bold');
% newcolors = ['#0072BD'; '#D95319'; 	'#EDB120';	'#7E2F8E'];%%%% blue orange yellow and pruple
% colororder(newcolors)
% 
% figure()
% % subplot(1,2,1)
% plot(NZendo.currents.time,NZendo.currents.ICaL,'k',BZ1endo.currents.time,BZ1endo.currents.ICaL,'r',BZ2endo.currents.time,BZ2endo.currents.ICaL,'m',BZ3endo.currents.time,BZ3endo.currents.ICaL,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('ICaL (\muA/\muF)')
% xlim([0 400])
% title('Baseline Endocardial Model')
% legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% figure()
% % subplot(1,2,2)
% x = NZepi.currents.time';
% Y = [NZepi.currents.ICaL; BZ1epi.currents.ICaL; BZ3epi.currents.ICaL;BZ2epi.currents.ICaL];
% area(x,Y(1,:))
% hold on
% area(x,Y(2,:))
% area(x,Y(3,:))
% area(x,Y(4,:))
% xlabel('Time(ms)')
% ylabel('ICaL (\muA/\muF)')
% xlim([0 400])
% legend({'Control','T wave inversion','normal ST-T','Brugada phenocopy'})
% set(gca,'fontsize',16,'fontweight','bold');
% newcolors = ['#0072BD'; '#D95319'; 	'#EDB120';	'#7E2F8E'];%%%% blue orange yellow and pruple
% colororder(newcolors)
% 
% figure()
% % subplot(1,2,1)
% plot(NZendo.currents.time,NZendo.currents.IKr,'k',BZ1endo.currents.time,BZ1endo.currents.IKr,'r',BZ2endo.currents.time,BZ2endo.currents.IKr,'m',BZ3endo.currents.time,BZ3endo.currents.IKr,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('IKr (\muA/\muF)')
% xlim([0 500])
% title('Baseline Endocardial Model')
% legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');

% figure()
% % subplot(1,2,2)
% x = NZepi.currents.time';
% Y = [BZ3epi.currents.IKr';NZepi.currents.IKr'; BZ1epi.currents.IKr'; BZ2epi.currents.IKr'];
% area(x,Y(1,:))
% hold on
% area(x,Y(2,:))
% area(x,Y(3,:))
% area(x,Y(4,:))
% xlabel('Time(ms)')
% ylabel('IKr (\muA/\muF)')
% xlim([0 500])
% legend({'normal ST-T','Control','T wave inversion','Brugada phenocopy'})
% set(gca,'fontsize',16,'fontweight','bold');
% newcolors2 = ['#EDB120'; '#0072BD';'#D95319'; '#7E2F8E'];%%%% yellow blue orange and pruple
% colororder(newcolors2)
% 
% %% pair-wise comparison between NZ and BZ currents filled
% 
% figure()
% subplot(3,3,1)
% plot(NZepi.currents.time,NZepi.currents.V,'k',BZ1epi.currents.time,BZ1epi.currents.V,'r','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% title('Baseline Epicardial Model')
% legend('NZ','Acute BZ1')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,2)
% plot(NZepi.currents.time,NZepi.currents.V,'k',BZ2epi.currents.time,BZ2epi.currents.V,'m','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% title('Baseline Epicardial Model')
% legend('NZ','Acute BZ2')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,3)
% plot(NZepi.currents.time,NZepi.currents.V,'k',BZ3epi.currents.time,BZ3epi.currents.V,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% title('Baseline Epicardial Model')
% legend('NZ','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,4)
% plot(NZepi.currents.time,NZepi.currents.Cai,'k',BZ1epi.currents.time,BZ1epi.currents.Cai,'r','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('CaT (mM)')
% % title('Baseline Epicardial Model')
% legend('NZ','Acute BZ1')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,5)
% plot(NZepi.currents.time,NZepi.currents.Cai,'k',BZ2epi.currents.time,BZ2epi.currents.Cai,'m','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('CaT (mM)')
% % title('Baseline Epicardial Model')
% legend('NZ','Acute BZ2')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,6)
% plot(NZepi.currents.time,NZepi.currents.Cai,'k',BZ3epi.currents.time,BZ3epi.currents.Cai,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('CaT (mM)')
% % title('Baseline Epicardial Model')
% legend('NZ','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,7)
% plot(NZepi.currents.time,NZepi.currents.Ta,'k',BZ1epi.currents.time,BZ1epi.currents.Ta,'r','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Ta (kPa)')
% % title('Baseline Epicardial Model')
% legend('NZ','Acute BZ1')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,8)
% plot(NZepi.currents.time,NZepi.currents.Ta,'k',BZ2epi.currents.time,BZ2epi.currents.Ta,'m','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Ta (kPa)')
% % title('Baseline Epicardial Model')
% legend('NZ','Acute BZ2')
% set(gca,'fontsize',16,'fontweight','bold');
% subplot(3,3,9)
% plot(NZepi.currents.time,NZepi.currents.Ta,'k',BZ3epi.currents.time,BZ3epi.currents.Ta,'b','LineWidth',2)
% xlabel('Time (ms)')
% ylabel('Ta (kPa)')
% % title('Baseline Epicardial Model')
% legend('NZ','Acute BZ3')
% set(gca,'fontsize',16,'fontweight','bold');

figure()
subplot(3,3,1)
x = NZepi.currents.time';
% Y = [NZepi.currents.INa'; BZ1epi.currents.INa'];
area(NZepi.currents.time',NZepi.currents.INa')
hold on
area(BZ1epi.currents.time',BZ1epi.currents.INa')
% xlabel('Time(ms)')
% ylabel('INa (\muA/\muF)')
% title('T wave inversion')
xlim([0 3])
% legend({'NZ','Acute BZ1'})
set(gca,'fontsize',16,'fontweight','bold');
% newcolors = ['#0072BD'; '#D95319'; ];%%%% blue orange 
% colororder(newcolors)
subplot(3,3,2)
x = NZepi.currents.time';
% Y = [NZepi.currents.INa'; BZ2epi.currents.INa'];
area(NZepi.currents.time',NZepi.currents.INa')
hold on
area(BZ2epi.currents.time',BZ2epi.currents.INa')
% xlabel('Time(ms)')
% ylabel('INa (\muA/\muF)')
xlim([0 3])
% title('Brugada phenocopy')
% legend({'NZ','Acute BZ2'})
set(gca,'fontsize',16,'fontweight','bold');
% newcolors = ['#0072BD'; '#7E2F8E'];%%%% blue pruple
% colororder(newcolors)
subplot(3,3,3)
x = NZepi.currents.time';
% Y = [NZepi.currents.INa'; BZ3epi.currents.INa'];
area(NZepi.currents.time',NZepi.currents.INa')
hold on
area(BZ3epi.currents.time',BZ3epi.currents.INa')
% xlabel('Time(ms)')
% ylabel('INa (\muA/\muF)')
xlim([0 3])
% title('normal ST-T')
% legend({'NZ','Acute BZ3'})
set(gca,'fontsize',16,'fontweight','bold');
% newcolors = ['#0072BD'; '#EDB120';];%%%% blue yellow
% colororder(newcolors)
subplot(3,3,4)
x = NZepi.currents.time';
% Y = [NZepi.currents.ICaL; BZ1epi.currents.ICaL];
area(NZepi.currents.time',NZepi.currents.ICaL)
hold on
area(BZ1epi.currents.time',BZ1epi.currents.ICaL)
% xlabel('Time(ms)')
% ylabel('ICaL (\muA/\muF)')
xlim([0 400])
% legend({'NZ','Acute BZ1'})
set(gca,'fontsize',16,'fontweight','bold');
% newcolors = ['#0072BD'; '#D95319';];%%%% blue orange 
% colororder(newcolors)
subplot(3,3,5)
x = NZepi.currents.time';
% Y = [NZepi.currents.ICaL; BZ2epi.currents.ICaL];
area(NZepi.currents.time',NZepi.currents.ICaL)
hold on
area(BZ2epi.currents.time',BZ2epi.currents.ICaL)
% xlabel('Time(ms)')
% ylabel('ICaL (\muA/\muF)')
xlim([0 400])
% legend({'NZ','Acute BZ2'})
set(gca,'fontsize',16,'fontweight','bold');
% newcolors = ['#0072BD'; '#7E2F8E'];%%%% blue  pruple
% colororder(newcolors)
subplot(3,3,6)
x = NZepi.currents.time';
% Y = [NZepi.currents.ICaL; BZ3epi.currents.ICaL;];
area(NZepi.currents.time',NZepi.currents.ICaL)
hold on
area(BZ3epi.currents.time',BZ3epi.currents.ICaL)
% xlabel('Time(ms)')
% ylabel('ICaL (\muA/\muF)')
xlim([0 400])
% legend({'NZ','Acute BZ3'})
set(gca,'fontsize',16,'fontweight','bold');
% newcolors = ['#0072BD'; '#EDB120';];%%%% blue yellow
% colororder(newcolors)
subplot(3,3,7)
x = NZepi.currents.time';
% Y = [NZepi.currents.IKr'; BZ1epi.currents.IKr'];
area(NZepi.currents.time',NZepi.currents.IKr')
hold on
area(BZ1epi.currents.time',BZ1epi.currents.IKr')
% xlabel('Time(ms)')
% ylabel('IKr (\muA/\muF)')
xlim([0 500])
% legend({'NZ','Acute BZ1'})
set(gca,'fontsize',16,'fontweight','bold');
% newcolors = ['#0072BD';'#D95319';];%%%% blue orange 
% colororder(newcolors)
subplot(3,3,8)
x = NZepi.currents.time';
% Y = [NZepi.currents.IKr';  BZ2epi.currents.IKr'];
area(NZepi.currents.time',NZepi.currents.IKr')
hold on
area(BZ2epi.currents.time',BZ2epi.currents.IKr')
% xlabel('Time(ms)')
% ylabel('IKr (\muA/\muF)')
xlim([0 500])
% legend({'NZ','Acute BZ2'})
set(gca,'fontsize',16,'fontweight','bold');
% newcolors = [ '#0072BD'; '#7E2F8E'];%%%% yellow  pruple
% colororder(newcolors)
subplot(3,3,9)
x = NZepi.currents.time';
% Y = [NZepi.currents.IKr'; BZ3epi.currents.IKr';];
area(NZepi.currents.time',NZepi.currents.IKr')
hold on
area(BZ3epi.currents.time',BZ3epi.currents.IKr')
% xlabel('Time(ms)')
% ylabel('IKr (\muA/\muF)')
xlim([0 500])
% legend({'NZ','Acute BZ3'})
set(gca,'fontsize',16,'fontweight','bold');
% newcolors = ['#0072BD';'#EDB120';];%%%%  blue yellow
% colororder(newcolors)
newcolors = ['k';'r';];%%%%  blue yellow
colororder(newcolors)