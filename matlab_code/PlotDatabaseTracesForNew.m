%%%%% This script is to plot the representative traces of ECG

clear
close all

%% Set path
addpath 'C:\Users\bjsfd\Documents\ECGprocessing\stable\tools\input_output\ver3\'


%% PTB patient

%%%% patient 6 's0027lre' 59400 for acute BZ2
%%%% patient 14 's0056lre' 50600 for acute BZ1
%%%% patient 24 's0086lre' 50200 for acute BZ2
%%%% patient 33 's0121lre' 50000 for acute BZ1
%%%% patient 33 's0157lre' 50000 for acute BZ3 (3 months post-MI not ideal)
%%%% patient 34 's0158lre' 40000 for acute BZ3 (3 months post-MI, not ideal)
%%%% patient 42 's0347lre' 80400 for chronic
%%%% patient 115 's0023_re'  short for HF NYHA2: 8200 ectopoc, 5800 sinus
%%%% patient 118 's0183_re' for HF NYHA3: 8450
%%%% patient 123 's0224_re' for HF NYHA4:8200
%%%% patient 51 's0187lre' 20500 for acute BZ3 (unlike 33 and 34, this one is just 10 days post-MI)


sigdir='C:\Users\bjsfd\Documents\ECG databases\ptb-diagnostic-ecg-database-1.0.0\patient051\'; 
headir=[];
ecgnr='s0187lre';
timetoplot=20500;%80400;
t=[1 100000];%%%%%t = time segment to be read; two element vector [t(1) t(2)] which specifies onset and offset
ft=0;%%% MIT format
leadreading=1:12;
messages=[];

[sig_h,messages1,heasig] = readsignal(sigdir,ecgnr,t,ft,headir,leadreading,messages);

%% plot traces of PTB patient 
time=linspace(t(1),t(2),t(2)-t(1)+1);%%%% start from 0 to all extracted signal
figure()
for i=1:6%%%% v1:v6
subplot(2,3,i)
plot(time,sig_h(i+6,:)/1000,'k','LineWidth',1.5)%%%% plot all extracted signal in mV (originally in microvolts)
xlim([timetoplot timetoplot+1000])%%%%% only select 1 second (1000 ms) to show
ylim([-2 2])%%%% change this for s0064lre to -1.5 to 1
title(['V' num2str(i)])
grid on
grid minor
ax = gca;
ax.GridColor = 'red';
ax.MinorGridColor = 'red';
% ax.XColor = 'red';
% ax.YColor = 'red';
ax.MinorGridLineStyle='-';
ax.MinorGridAlpha = 0.2;
ax.GridAlpha = 0.5;
ax.XTickMode = 'manual';
ax.YTickMode = 'manual';
ax.XTick=[timetoplot,timetoplot+200,timetoplot+400,timetoplot+600,timetoplot+800,timetoplot+1000];
ax.XTickLabel = {'0','0.2','0.4','0.6','0.8','1.0'};
% ax.XTickLabel = {'-1','-0.5','0','0.5','1.0'};
ax.XAxis.MinorTickValues = ax.XAxis.Limits(1):40:ax.XAxis.Limits(2);%%%% data actually in ms, labelled as seconds
ax.YAxis.MinorTickValues = ax.YAxis.Limits(1):0.1:ax.YAxis.Limits(2);
ax.LineWidth = 1.5;
set(gca,'fontsize',12,'fontweight','bold');
xlabel('Time (s)')
ylabel('ECG (mV)')
end


% %% Leeds data
% sigdir='C:\Users\bjsfd\Documents\ECGprocessing\LeedsHolterData\DTIINMI-014\BinFiles\V3\Holter\DAY2\'; 
% headir=[];
% ecgnr='Hour1RawData&spln&50Hz';
% timetoplot=11249000;%%%V3D2%52769700;%11249000%%%V3D1%75325400;%65547900;%4389850;%310000;%%%V2D2%30000%%%V2D1%72732000;%58165200;%35518200;%19355500;%8580600;%%%V1D2%1032750;%8829560;%4905400;%12000%2000;%%%V1D1%65968000;%60300;%1201800;%2198000;
% t=[3600000*3+1 3600000*6];%%%%%t = time segment to be read; two element vector [t(1) t(2)] which specifies onset and offset
% ft=0;%%% MIT format
% leadreading=1:12;
% messages=[];
% 
% [sig_h,messages1,heasig] = readsignal(sigdir,ecgnr,t,ft,headir,leadreading,messages);
% 
% %% plot traces of Leeds patient 
% time=linspace(t(1),t(2),t(2)-t(1)+1);
% figure()
% for i=1:6%%%% v1:v6
% subplot(2,3,i)
% plot(time,sig_h(i+2,:))
% xlim([timetoplot timetoplot+1000])
% title(['V' num2str(i)])
% end