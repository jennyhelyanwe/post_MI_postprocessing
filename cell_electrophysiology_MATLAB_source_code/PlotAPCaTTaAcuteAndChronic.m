%%%%%Plot the membrane potential(Vm), calcium transient(CaT) and active tension (Ta) traces for the baseline models of
%%%%%normal zone (NZ) and post infarction border zones(BZs) and remote zones(RZs)
clear
close all

%%%%% Before plotting the results, the simulated traces of Vm, CaT and Ta
%%%%% need to be generated through 'EndoNZ.m, EndoAcuteBZ1-3.m,
%%%%% EndoChronicBZ.m, EndoChronicRZ1-2.m'
%% %%% CL=800ms
cd NZendoPOM
NZendo=importdata('NZendoCL800Model0.mat');
cd ../AcuteBZ1endoPOM
BZ1endo=importdata('AcuteBZ1endoCL800Model0.mat');
cd ../AcuteBZ2endoPOM
BZ2endo=importdata('AcuteBZ2endoCL800Model0.mat');
cd ../AcuteBZ3endoPOM
BZ3endo=importdata('AcuteBZ3endoCL800Model0.mat');
cd ../ChronicBZendoPOM
BZCendo=importdata('ChronicBZendoCL800Model0.mat');
cd ../ChronicRZ1endoPOM
RZ1endo=importdata('ChronicRZ1endoCL800Model0.mat');
cd ../ChronicRZ2endoPOM
RZ2endo=importdata('ChronicRZ2endoCL800Model0.mat');
cd ..

%%%%% acute stage
figure()
subplot(1,3,1)
plot(NZendo.currents.time,NZendo.currents.V,'k',BZ1endo.currents.time,BZ1endo.currents.V,'r',BZ2endo.currents.time,BZ2endo.currents.V,'m',BZ3endo.currents.time,BZ3endo.currents.V,'b','LineWidth',2)
xlabel('Time (ms)')
ylabel('Vm (mV)')
legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
set(gca,'fontsize',16,'fontweight','bold');
subplot(1,3,2)
plot(NZendo.currents.time,NZendo.currents.Cai,'k',BZ1endo.currents.time,BZ1endo.currents.Cai,'r',BZ2endo.currents.time,BZ2endo.currents.Cai,'m',BZ3endo.currents.time,BZ3endo.currents.Cai,'b','LineWidth',2)
xlabel('Time (ms)')
ylabel('CaT (mM)')
legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
set(gca,'fontsize',16,'fontweight','bold');
subplot(1,3,3)
plot(NZendo.currents.time,NZendo.currents.Ta,'k',BZ1endo.currents.time,BZ1endo.currents.Ta,'r',BZ2endo.currents.time,BZ2endo.currents.Ta,'m',BZ3endo.currents.time,BZ3endo.currents.Ta,'b','LineWidth',2)
xlabel('Time (ms)')
ylabel('Ta (kPa)')
legend('NZ','Acute BZ1','Acute BZ2','Acute BZ3')
set(gca,'fontsize',16,'fontweight','bold');

%%%% chronic stage
figure()
subplot(1,3,1)
plot(NZendo.currents.time,NZendo.currents.V,'k',BZCendo.currents.time,BZCendo.currents.V,'r',RZ1endo.currents.time,RZ1endo.currents.V,'m',RZ2endo.currents.time,RZ2endo.currents.V,'b','LineWidth',2)
xlabel('Time (ms)')
ylabel('Vm (mV)')
legend('NZ','Chronic BZ','Chronic RZ1','Chronic RZ2')
set(gca,'fontsize',16,'fontweight','bold');
subplot(1,3,2)
plot(NZendo.currents.time,NZendo.currents.Cai,'k',BZCendo.currents.time,BZCendo.currents.Cai,'r',RZ1endo.currents.time,RZ1endo.currents.Cai,'m',RZ2endo.currents.time,RZ2endo.currents.Cai,'b','LineWidth',2)
xlabel('Time (ms)')
ylabel('CaT (mM)')
legend('NZ','Chronic BZ','Chronic RZ1','Chronic RZ2')
set(gca,'fontsize',16,'fontweight','bold');
subplot(1,3,3)
plot(NZendo.currents.time,NZendo.currents.Ta,'k',BZCendo.currents.time,BZCendo.currents.Ta,'r',RZ1endo.currents.time,RZ1endo.currents.Ta,'m',RZ2endo.currents.time,RZ2endo.currents.Ta,'b','LineWidth',2)
xlabel('Time (ms)')
ylabel('Ta (kPa)')
legend('NZ','Chronic BZ','Chronic RZ1','Chronic RZ2')
set(gca,'fontsize',16,'fontweight','bold');
