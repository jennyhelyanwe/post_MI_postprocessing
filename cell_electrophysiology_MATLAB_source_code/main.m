%     Cardiac model ToR-ORd-Land for acute and chronic myocardial infarction
%     Copyright (C) 2024 Xin Zhou. Contact: xin.zhou.joy@hotmail.com
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <https://www.gnu.org/licenses/>.
%
% The ToR-ORd model is described in the article "Development, calibration, and validation of a novel human ventricular myocyte model in health, disease, and drug block"
% by Jakub Tomek, Alfonso Bueno-Orovio, Elisa Passini, Xin Zhou, Ana Minchole, Oliver Britton, Chiara Bartolucci, Stefano Severi, Alvin Shrier, Laszlo Virag, Andras Varro and Blanca Rodriguez
% The article and supplemental materails are freely available in the
% Open Access jounal eLife
% Link to Article:
% https://elifesciences.org/articles/48890

% The models for acute and chronic infarction are described in the artile "Clinical phenotypes in acute and chronic infarction explained through human ventricular electromechanical modelling and simulations"
% by Xin Zhou, Zhinuo Jenny Wang, Julia Camps, Jakub Tomek, Alfonso Santiago, Adria Quintanas, Mariano Vazquez, Marmar Vaseghi and Blanca Rodriguez
% The article and supplemental materails are freely available in the
% Open Access jounal eLife
% Link to Article:
% https://elifesciences.org/reviewed-preprints/93002

% The model.m function contains the code for equations. The same models
% were implemented in other programming languages and simulation platforms, 
% such as the the high-performance numerical software Alya and
% GPU-enabled open source MonoAlg3D simulator as shown in the following
% papers:
% https://elifesciences.org/reviewed-preprints/93002
% https://www.nature.com/articles/s41598-024-67951-5

close all
clear

%% Setup the simulation cases

celltype=1; %endo = 0, epi = 1, M = 2

if celltype==0
    celltypename='endo';
elseif celltype==1
    celltypename='epi';
elseif   celltype==2
    celltypename='mid';
end

ZoneName=["NZ","AcuteBZ1","AcuteBZ2","AcuteBZ3","ChronicBZ","ChronicRZ1","ChronicRZ2"];

%% Initial conditions for state variables
%X0 is the vector for initial sconditions for state variables
%%%% endo
% X0 = [-88.6369922306458,11.8973412949238,11.8976610470850,141.234464714982,141.234423402713,7.26747296460659e-05,6.33786975780735e-05,1.53265306371970,1.53394579180493,0.000828007761976018,0.666527193684116,0.826020806005678,0.826055985895856,0.825850881115628,0.000166868626513013,0.522830604669169,0.285969584294187,0.000959137028030184,0.999601150012565,0.593401639836100,0.000488696137242056,0.999601147267179,0.654668660159696,9.50007519781516e-32,0.999999992317577,0.939258048397962,0.999999992317557,0.999898379647465,0.999978251560040,0.000444816183420527,0.000755072490632667,0.999999992318446,0.999999992318445,0.242404683449520,0.000179537726989804,-6.88308558109975e-25,0.0111749845355653,0.998036620213316,0.000858801779013532,0.000709744678350176,0.000381261722195702,1.35711566929992e-05,2.30252452954649e-23,0.000156194131630688,0.000235128869057516,0.00807763107171867,0.999373435811656,0,0]; 
%%%% epi
 X0 = [-89.0462806262884,12.7218980311997,12.7222039977392,142.248960281735,142.248911688304,6.54105789316085e-05,5.68443136844764e-05,1.80911728399381,1.80970235621251,0.000758182108180449,0.679839847935577,0.834150231581688,0.834188252920967,0.834081731522592,0.000154387698861246,0.538295069820379,0.302769394159465,0.000933035060391086,0.999628705730844,0.999626204093615,0.000475390662092180,0.999628705544664,0.999628513430851,1.74213411952898e-37,0.999999993122906,0.947952168523141,0.999999993122889,0.999932686646139,0.999982915381882,0.000291544679470133,0.000502604507932921,0.999999993124187,0.999999993123756,0.228815500940270,0.000171497784228012,-1.13118992668881e-26,0.0129505221481656,0.998194356754674,0.000834232097912889,0.000683865770895308,0.000277878501096440,9.66775862738005e-06,8.16930403133409e-24,0.000125999575445634,0.000189952183128226,0.00655149435193622,0.999493972060333,0,0];
%%%% mid
% X0 = [-89.5379994049964,14.9292004720038,14.9296673679334,144.844718688810,144.844658476157,7.50228807455408e-05,6.10763598140135e-05,1.79043480744558,1.79484249993962,0.000681936485046493,0.695380653101535,0.843488797335149,0.843520761455969,0.843226224403045,0.000140621109700401,0.545314876174586,0.292496735833565,0.000902612655601118,0.999659345906191,0.563119679366890,0.000459883274920751,0.999659343029625,0.623696443871387,-1.31418873360667e-33,0.999999993979673,0.920408593154793,0.999999993979652,0.999761950174748,0.999962530196306,0.000385359469667100,0.000853529194511867,0.999999993978835,0.999999993980401,0.266415111925392,0.000162310655612839,1.20976169203982e-24,0.0178243652102213,0.997971986641796,0.000805399061926759,0.000678179976274546,0.000526536308931670,1.78956481798154e-05,7.05916237956270e-23,0.000167065448972034,0.000250679417924283,0.00860262481216925,0.999331445205816,0,0];

CL=800;%pacing cycle length in ms
beats=10;%number of beats in the simulation

options=[];%options for ode solver

%% Initialization of the simulation parameters
Parameters=[(1:1:7)' ones(7,16)];
%%%%%% Order of simulation cases:
%%%%%% Normal Zone (NZ): Parameters(1,:)
%%%%%% Acute border Zone1 (AcuteBZ1): Parameters(2,:)
%%%%%% Acute border Zone2 (AcuteBZ2): Parameters(3,:)
%%%%%% Acute border Zone3 (AcuteBZ3): Parameters(4,:)
%%%%%% Chronic border Zone (ChronicBZ): Parameters(5,:)
%%%%%% Chronic remote Zone1 (ChronicRZ1): Parameters(6,:)
%%%%%% Chronic remote Zone2 (ChronicRZ2): Parameters(7,:)
%%%%%% Order of parameters:
%%%%%% 1)INa_Multiplier = Parameters(case, 2)
%%%%%% 2)INaL_Multiplier = Parameters(case, 3)
%%%%%% 3)Ito_Multiplier = Parameters(case, 4)
%%%%%% 4)ICaL_Multiplier = Parameters(case, 5)
%%%%%% 5)IKr_Multiplier = Parameters(case, 6)
%%%%%% 6)IKs_Multiplier = Parameters(case, 7)
%%%%%% 7)IK1_Multiplier = Parameters(case, 8);
%%%%%% 8)INaCa_Multiplier = Parameters(case, 9)
%%%%%% 9)INaK_Multiplier = Parameters(case, 10)
%%%%%% 10)Jrel_Multiplier = Parameters(case, 11)
%%%%%% 11)Jup_Multiplier = Parameters(case, 12)
%%%%%% 12)IKCa_Multiplier = Parameters(case, 13) 
%%%%%% 13)ICaCl_Multiplier = Parameters(case, 14) 
%%%%%% 14)CaMKPhosRate_Multiplier = Parameters(case, 15)
%%%%%% 15)Jrelptau_Multiplier = Parameters(case, 16)
%%%%%% 16)ICab_Multiplier = Parameters(case, 17)

Parameters(2,[2,4,5,6,7,8])=[0.4 0.1 0.64 0.7 0.2 0.3]; %%%% Acute BZ1
Parameters(3,[2,5,6,7])=[0.38 0.31 0.3 0.2]; %%%% Acute BZ2
Parameters(4,[2,4,5,8,15,16,17])=[0.4 0 0.64 0.6,1.5,6,1.33]; %%%% Acute BZ3
Parameters(5,[2,3,5,6,8,12,13,14,15,16])=[0.43 1.275 0.7 0.89 0.76 0.4 2 1.25 1.5 6]; %%%% Chronic BZ
Parameters(6,[2,3,6,12,13,14,15,16])=[0.43 1.413 0.87 0.4 2 1.25 1.5 6]; %%%% Chronic RZ1
Parameters(7,[2,3,4,6,7,8,10,12,13,14,15,16])=[0.43 2 0.6 0.6 0.4 0.6 0.6 0.3 3.75 1.25 1.5 6]; %%%% Chronic RZ2

%% Run all simulations for healthy and diseased conditions
for c=1:size(Parameters,1)%%%% set the simulation cases here
    for n=1:beats
        [time, X]=ode15s(@model,0:1:CL,X0,options,1,celltype,Parameters(c,:)); %%%% solve the odes to get state variables
        X0=X(size(X,1),:);
        
    end

    %calculate and name dependent variables for the final beat in the
    %simulation (i.e. currents and fluxes)
    for i=1:size(X,1)
        IsJs=model(time(i),X(i,:),0,celltype,Parameters(c,:)); %%%%% calculate the currents and fluxes

        %%%%%%%% get the membrane voltage (V), and ionic concentrations
        %%%%%%%% from state variables
        V(i) = X(i,1);
        Nai(i) =X(i,2);
        Nass(i) =X(i,3);
        Ki(i) =X(i,4);
        Kss(i) =X(i,5);
        Cai(i) =X(i,6);
        Cass(i) =X(i,7);
        Cansr(i) =X(i,8);
        Cajsr(i) =X(i,9);

        %%%%%%%% extract the values of currents and fluxes
        INa(i)=IsJs(1);
        INaL(i)=IsJs(2);
        Ito(i)=IsJs(3);
        ICaL(i)=IsJs(4);
        IKr(i)=IsJs(5);
        IKs(i)=IsJs(6);
        IK1(i)=IsJs(7);
        INaCa_i(i)=IsJs(8);
        INaCa_ss(i)=IsJs(9);
        INaK(i)=IsJs(10);
        IKb(i)=IsJs(11);
        INab(i)=IsJs(12);
        ICab(i)=IsJs(13);
        IpCa(i)=IsJs(14);
        Jdiff(i)=IsJs(15);
        JdiffNa(i)=IsJs(16);
        JdiffK(i)=IsJs(17);
        Jup(i)=IsJs(18);
        Jleak(i)=IsJs(19);
        Jtr(i)=IsJs(20);
        Jrel(i)=IsJs(21);
        CaMKa(i)=IsJs(22);
        Istim(i)=IsJs(23);
        fINap(i) = IsJs(24);
        fINaLp(i) = IsJs(25);
        fICaLp(i) = IsJs(26);
        fJrelp(i) = IsJs(27);
        fJupp(i) = IsJs(28);
        CaJSR(i) = IsJs(29);
        CaNSR(i) = IsJs(30);
        PhiCaL_ss(i) = IsJs(31);
        ICaL_ss(i) = IsJs(32);
        ICaL_i(i) = IsJs(33);
        IClCa(i) = IsJs(34);
        IClbk(i) = IsJs(35);
        ICaL_tot(i) = IsJs(36);
        BCai(i) = IsJs(37);
        IKCa(i) = IsJs(38);
        Ta(i) = IsJs(39);

        INaCa(i) = INaCa_i(i)+INaCa_ss(i);


    end
    %%%%%%% model results save with index 0, representing the baseline model,
    %%%%%%% rather than the population of models
    filename=sprintf('%s%s%s%d%s%d%s',ZoneName{c},celltypename,'CL',CL,'Model',0,'.mat');
    save(filename,'X','time','V','Cai','Ta','INa','INaL','Ito','ICaL','IKr','IKs','IK1','INaCa','INaK','Jrel','Jup','IKCa','IClCa')
end

%% Reproduce the cellular simulation results of as in the paper: https://elifesciences.org/reviewed-preprints/93002
%%%%%%% The results in the published figure were simulated from Alya to be consistent with the organ level simulations, some numerical differences may exist due to the differences in the ode solvers and the definition of steady
%%%%%%% state thresholds 
NZepi=importdata('NZepiCL800Model0.mat');

BZ1epi=importdata('AcuteBZ1epiCL800Model0.mat');

BZ2epi=importdata('AcuteBZ2epiCL800Model0.mat');

BZ3epi=importdata('AcuteBZ3epiCL800Model0.mat');

BZCepi=importdata('ChronicBZepiCL800Model0.mat');

RZ1epi=importdata('ChronicRZ1epiCL800Model0.mat');

RZ2epi=importdata('ChronicRZ2epiCL800Model0.mat');


%%%%% acute stage figure
figure()
%%%%%% plot the membrane voltage
subplot(3,3,1)
plot(NZepi.time,NZepi.V,'k',BZ1epi.time,BZ1epi.V,'r','LineWidth',2)
xlabel('Time (ms)')
ylabel('Vm (mV)')
legend('NZ','Acute BZ1')
yticks(-100:20:40)
ylim([-100, 40])
xticks(0:100:800)
set(gca,'fontsize',12,'fontweight','bold');
subplot(3,3,2)
plot(NZepi.time,NZepi.V,'k',BZ2epi.time,BZ2epi.V,'r','LineWidth',2)
xlabel('Time (ms)')
ylabel('Vm (mV)')
legend('NZ','Acute BZ2')
set(gca,'fontsize',12,'fontweight','bold');
yticks(-100:20:40)
ylim([-100, 40])
xticks(0:100:800)
subplot(3,3,3)
plot(NZepi.time,NZepi.V,'k',BZ3epi.time,BZ3epi.V,'r','LineWidth',2)
xlabel('Time (ms)')
ylabel('Vm (mV)')
legend('NZ','Acute BZ3')
set(gca,'fontsize',12,'fontweight','bold');
yticks(-100:20:40)
ylim([-100, 40])
xticks(0:100:800)
%%%%%% plot the intracellular calcium transient
subplot(3,3,4)
plot(NZepi.time,NZepi.Cai*10^6,'k',BZ1epi.time,BZ1epi.Cai*10^6,'r','LineWidth',2)
xlabel('Time (ms)')
ylabel('CaT (nM)')
legend('NZ','Acute BZ1')
set(gca,'fontsize',12,'fontweight','bold');
yticks(0:100:700)
ylim([0,700])
xticks(0:100:800)
subplot(3,3,5)
plot(NZepi.time,NZepi.Cai*10^6,'k',BZ2epi.time,BZ2epi.Cai*10^6,'r','LineWidth',2)
xlabel('Time (ms)')
ylabel('CaT (nM)')
legend('NZ','Acute BZ2')
set(gca,'fontsize',12,'fontweight','bold');
yticks(0:100:700)
ylim([0,700])
xticks(0:100:800)
subplot(3,3,6)
plot(NZepi.time,NZepi.Cai*10^6,'k',BZ3epi.time,BZ3epi.Cai*10^6,'r','LineWidth',2)
xlabel('Time (ms)')
ylabel('CaT (nM)')
legend('NZ','Acute BZ3')
set(gca,'fontsize',12,'fontweight','bold');
yticks(0:100:700)
ylim([0,700])
xticks(0:100:800)
%%%%%% plot the active tension
subplot(3,3,7)
plot(NZepi.time,NZepi.Ta,'k',BZ1epi.time,BZ1epi.Ta,'r','LineWidth',2)
xlabel('Time (ms)')
ylabel('Ta (kPa)')
legend('NZ','Acute BZ1')
set(gca,'fontsize',12,'fontweight','bold');
yticks(0:5:45)
ylim([0,45])
xticks(0:100:800)
subplot(3,3,8)
plot(NZepi.time,NZepi.Ta,'k',BZ2epi.time,BZ2epi.Ta,'r','LineWidth',2)
xlabel('Time (ms)')
ylabel('Ta (kPa)')
legend('NZ','Acute BZ2')
set(gca,'fontsize',12,'fontweight','bold');
yticks(0:5:45)
ylim([0,45])
xticks(0:100:800)
subplot(3,3,9)
plot(NZepi.time,NZepi.Ta,'k',BZ3epi.time,BZ3epi.Ta,'r','LineWidth',2)
xlabel('Time (ms)')
ylabel('Ta (kPa)')
legend('NZ','Acute BZ3')
set(gca,'fontsize',12,'fontweight','bold');
yticks(0:5:45)
ylim([0,45])
xticks(0:100:800)

%%%% chronic stage
figure()
%%%%%% plot the membrane voltage
subplot(3,2,1)
plot(NZepi.time,NZepi.V,'k',BZCepi.time,BZCepi.V,'r',RZ1epi.time,RZ1epi.V,'b','LineWidth',2)
xlabel('Time (ms)')
ylabel('Vm (mV)')
legend('NZ','Chronic BZ','Chronic RZ1')
set(gca,'fontsize',12,'fontweight','bold');
yticks(-100:20:40)
ylim([-100, 40])
xticks(0:100:800)
subplot(3,2,2)
plot(NZepi.time,NZepi.V,'k',BZCepi.time,BZCepi.V,'r',RZ2epi.time,RZ2epi.V,'b','LineWidth',2)
xlabel('Time (ms)')
ylabel('Vm (mV)')
legend('NZ','Chronic BZ','Chronic RZ2')
set(gca,'fontsize',12,'fontweight','bold');
yticks(-100:20:40)
ylim([-100, 40])
xticks(0:100:800)
%%%%%% plot the intracellular calcium transient
subplot(3,2,3)
plot(NZepi.time,NZepi.Cai*10^6,'k',BZCepi.time,BZCepi.Cai*10^6,'r',RZ1epi.time,RZ1epi.Cai*10^6,'b','LineWidth',2)
xlabel('Time (ms)')
ylabel('CaT (nM)')
legend('NZ','Chronic BZ','Chronic RZ1')
set(gca,'fontsize',12,'fontweight','bold');
yticks(0:100:700)
ylim([0,700])
xticks(0:100:800)
subplot(3,2,4)
plot(NZepi.time,NZepi.Cai*10^6,'k',BZCepi.time,BZCepi.Cai*10^6,'r',RZ2epi.time,RZ2epi.Cai*10^6,'b','LineWidth',2)
xlabel('Time (ms)')
ylabel('CaT (nM)')
legend('NZ','Chronic BZ','Chronic RZ2')
set(gca,'fontsize',12,'fontweight','bold');
yticks(0:100:700)
ylim([0,700])
xticks(0:100:800)
%%%%%% plot the active tension
subplot(3,2,5)
plot(NZepi.time,NZepi.Ta,'k',BZCepi.time,BZCepi.Ta,'r',RZ1epi.time,RZ1epi.Ta,'b','LineWidth',2)
xlabel('Time (ms)')
ylabel('Ta (kPa)')
legend('NZ','Chronic BZ','Chronic RZ1')
set(gca,'fontsize',12,'fontweight','bold');
yticks(0:5:45)
ylim([0,45])
xticks(0:100:800)
subplot(3,2,6)
plot(NZepi.time,NZepi.Ta,'k',BZCepi.time,BZCepi.Ta,'r',RZ2epi.time,RZ2epi.Ta,'b','LineWidth',2)
xlabel('Time (ms)')
ylabel('Ta (kPa)')
legend('NZ','Chronic BZ','Chronic RZ2')
set(gca,'fontsize',12,'fontweight','bold');
yticks(0:5:45)
ylim([0,45])
xticks(0:100:800)

