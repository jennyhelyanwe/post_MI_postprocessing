%%%%%% This script is to generate Fig 3 and relavent panels in Supplemental
%%%%%% material for the MI POM paper

clear
close all

Parameters=importdata('NZPOM253.mat');

% %% load biomarkers and abnormalities for the baseline and the POM
% %%%%%% NZ
cd ../SKPOMNZ
% 
% NZBaselineepi=importdata('BiomarkersEpiNZBaseline.mat');
% NZBaselineendo=importdata('BiomarkersEndoNZBaseline.mat');
% NZBaselinemid=importdata('BiomarkersMidNZBaseline.mat');
% 
% NZepi=importdata('BiomarkersEpiNZ253.mat');
% NZendo=importdata('BiomarkersEndoNZ253.mat');
% NZmid=importdata('BiomarkersMidNZ253.mat');
% 
% APDemptyNZepi=find(NZepi(:,4)==0);
% APDemptyNZendo=find(NZendo(:,4)==0);
% APDemptyNZmid=find(NZmid(:,4)==0);
% 
AbnormalityNZepi=importdata('AbnormalityEpiNZ253.mat');
AbnormalityNZendo=importdata('AbnormalityEndoNZ253.mat');
AbnormalityNZmid=importdata('AbnormalityMidNZ253.mat');
% 
% 
% %%%%%% Chronic BZ
% cd ../SKPOMHFBZ
% ChronicBZEpiBaseline=importdata('BiomarkersEpiBZBaselineHegyiCaMKJrelSlow.mat');
% ChronicBZEndoBaseline=importdata('BiomarkersEndoBZBaselineHegyiCaMKJrelSlow.mat');
% ChronicBZMidBaseline=importdata('BiomarkersMidBZBaselineHegyiCaMKJrelSlow.mat');
% 
% ChronicBZepi=importdata('Biomarkers253EpiBZHegyiCaMKJrelSlow.mat');
% ChronicBZendo=importdata('Biomarkers253EndoBZHegyiCaMKJrelSlow.mat');
% ChronicBZmid=importdata('Biomarkers253MidBZHegyiCaMKJrelSlow.mat');
% 
% AbnormalityChronicBZepi=importdata('Abnormality253EpiBZHegyiCaMKJrelSlow.mat');
% AbnormalityChronicBZendo=importdata('Abnormality253EndoBZHegyiCaMKJrelSlow.mat');
% AbnormalityChronicBZmid=importdata('Abnormality253MidBZHegyiCaMKJrelSlow.mat');
% 
% 
% %%%%%% Chronic RZ1
% cd ../SKPOMHFRZ
% 
% ChronicRZ1EpiBaseline=importdata('BiomarkersEpiRZBaselineHegyiCaMKJrelSlow.mat');
% ChronicRZ1EndoBaseline=importdata('BiomarkersEndoRZBaselineHegyiCaMKJrelSlow.mat');
% ChronicRZ1MidBaseline=importdata('BiomarkersMidRZBaselineHegyiCaMKJrelSlow.mat');
% 
% ChronicRZ1epi=importdata('Biomarkers253EpiRZHegyiCaMKJrelSlow.mat');
% ChronicRZ1endo=importdata('Biomarkers253EndoRZHegyiCaMKJrelSlow.mat');
% ChronicRZ1mid=importdata('Biomarkers253MidRZHegyiCaMKJrelSlow.mat');
% 
% AbnormalityChronicRZ1epi=importdata('Abnormality253EpiRZHegyiCaMKJrelSlow.mat');
% AbnormalityChronicRZ1endo=importdata('Abnormality253EndoRZHegyiCaMKJrelSlow.mat');
% AbnormalityChronicRZ1mid=importdata('Abnormality253MidRZHegyiCaMKJrelSlow.mat');
% 
% 
% %%%%%% Chronic RZ2
% cd ../SKPOMHFRZAll
% 
% ChronicRZ2EpiBaseline=importdata('BiomarkersEpiRZBaselineAllCaMKJrelSlow.mat');
% ChronicRZ2EndoBaseline=importdata('BiomarkersEndoRZBaselineAllCaMKJrelSlow.mat');
% ChronicRZ2MidBaseline=importdata('BiomarkersMidRZBaselineAllCaMKJrelSlow.mat');
% 
% ChronicRZ2epi=importdata('Biomarkers253EpiRZAllCaMKJrelSlow.mat');
% ChronicRZ2endo=importdata('Biomarkers253EndoRZAllCaMKJrelSlow.mat');
% ChronicRZ2mid=importdata('Biomarkers253MidRZAllCaMKJrelSlow.mat');
% 
% AbnormalityChronicRZ2epi=importdata('Abnormality253EpiRZAllCaMKJrelSlow.mat');
% AbnormalityChronicRZ2endo=importdata('Abnormality253EndoRZAllCaMKJrelSlow.mat');
% AbnormalityChronicRZ2mid=importdata('Abnormality253MidRZAllCaMKJrelSlow.mat');
% 
% cd ../SKPOMHFBZ
% 
% %%%%% Epi delta to NZ
% 
% ChronicBaselineepi=[ChronicBZEpiBaseline;ChronicRZ1EpiBaseline;ChronicRZ2EpiBaseline];
% dbaseepi=ChronicBaselineepi-NZBaselineepi;
% 
% 
% d1epi=ChronicBZepi-NZepi;
% d2epi=ChronicRZ1epi-NZepi;
% d3epi=ChronicRZ2epi-NZepi;
% 
% APDemptyBZepi=find(ChronicBZepi(:,4)==0);
% APDemptyRZ1epi=find(ChronicRZ1epi(:,4)==0);
% APDemptyRZ2epi=find(ChronicRZ2epi(:,4)==0);
% 
% 
% %%%%% Endo delta to NZ
% 
% ChronicBaselineendo=[ChronicBZEndoBaseline;ChronicRZ1EndoBaseline;ChronicRZ2EndoBaseline];
% dbaseendo=ChronicBaselineendo-NZBaselineendo;
% 
% d1endo=ChronicBZendo-NZendo;
% d2endo=ChronicRZ1endo-NZendo;
% d3endo=ChronicRZ2endo-NZendo;
% 
% APDemptyBZendo=find(ChronicBZendo(:,4)==0);
% APDemptyRZ1endo=find(ChronicRZ1endo(:,4)==0);
% APDemptyRZ2endo=find(ChronicRZ2endo(:,4)==0);
% 
% 
% %%%%% Mid delta to NZ
% 
% ChronicBZBaselinemid=[ChronicBZMidBaseline;ChronicRZ1MidBaseline;ChronicRZ2MidBaseline];
% dbasemid=ChronicBZBaselinemid-NZBaselinemid;
% 
% d1mid=ChronicBZmid-NZmid;
% d2mid=ChronicRZ1mid-NZmid;
% d3mid=ChronicRZ2mid-NZmid;
% 
% APDemptyBZmid=find(ChronicBZmid(:,4)==0);
% APDemptyRZ1mid=find(ChronicRZ1mid(:,4)==0);%%%% case 219(434) failed therefore no trace saved
% APDemptyRZ2mid=find(ChronicRZ2mid(:,4)==0);
% 
% %%%%% Epi delta to BZ
% ChronicBaselineepiRZ=[ChronicRZ1EpiBaseline;ChronicRZ2EpiBaseline];
% Dbaseepi=ChronicBaselineepiRZ-ChronicBZEpiBaseline;
% 
% D1epi=ChronicRZ1epi-ChronicBZepi;
% D2epi=ChronicRZ2epi-ChronicBZepi;
% 
% %%%%% Endo delta to BZ
% ChronicBaselineendoRZ=[ChronicRZ1EndoBaseline;ChronicRZ2EndoBaseline];
% Dbaseendo=ChronicBaselineendoRZ-ChronicBZEndoBaseline;
% 
% D1endo=ChronicRZ1endo-ChronicBZendo;
% D2endo=ChronicRZ2endo-ChronicBZendo;
% 
% %%%%% Mid delta to BZ
% ChronicBaselinemidRZ=[ChronicRZ1MidBaseline;ChronicRZ2MidBaseline];
% Dbasemid=ChronicBaselinemidRZ-ChronicBZMidBaseline;
% 
% D1mid=ChronicRZ1mid-ChronicBZmid;
% D2mid=ChronicRZ2mid-ChronicBZmid;
% 
% %% plot the abnormality number in 253 POM for NZ and three chronic remodelling
% figure()
% subplot(3,4,1)
% bar(sum(AbnormalityNZendo))
% set(gca,'xticklabel',{'EAD','DAD','RF','DF'})
% title('NZ endo')
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(3,4,2)
% bar(sum(AbnormalityChronicBZendo))
% set(gca,'xticklabel',{'EAD','DAD','RF','DF'})
% title('Chronic BZ endo')
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(3,4,3)
% bar(sum(AbnormalityChronicRZ1endo))
% set(gca,'xticklabel',{'EAD','DAD','RF','DF'})
% title('Chronic RZ1 endo')
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(3,4,4)
% bar(sum(AbnormalityChronicRZ2endo))
% set(gca,'xticklabel',{'EAD','DAD','RF','DF'})
% title('Chronic RZ2 endo')
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(3,4,5)
% bar(sum(AbnormalityNZmid))
% set(gca,'xticklabel',{'EAD','DAD','RF','DF'})
% title('NZ mid')
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(3,4,6)
% bar(sum(AbnormalityChronicBZmid))
% set(gca,'xticklabel',{'EAD','DAD','RF','DF'})
% title('Chronic BZ mid')
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(3,4,7)
% bar(sum(AbnormalityChronicRZ1mid))
% set(gca,'xticklabel',{'EAD','DAD','RF','DF'})
% title('Chronic RZ1 mid')
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(3,4,8)
% bar(sum(AbnormalityChronicRZ2mid))
% set(gca,'xticklabel',{'EAD','DAD','RF','DF'})
% title('Chronic RZ2 mid')
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(3,4,9)
% bar(sum(AbnormalityNZepi))
% set(gca,'xticklabel',{'EAD','DAD','RF','DF'})
% title('NZ epi')
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(3,4,10)
% bar(sum(AbnormalityChronicBZepi))
% set(gca,'xticklabel',{'EAD','DAD','RF','DF'})
% title('Chronic BZ epi')
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(3,4,11)
% bar(sum(AbnormalityChronicRZ1epi))
% set(gca,'xticklabel',{'EAD','DAD','RF','DF'})
% title('Chronic RZ1 epi')
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(3,4,12)
% bar(sum(AbnormalityChronicRZ2epi))
% set(gca,'xticklabel',{'EAD','DAD','RF','DF'})
% title('Chronic RZ2 epi')
% set(gca,'fontsize',12,'fontweight','bold');
% 
% %% Histograms for deltaAPD,and other biomarkers: exclude the case that have EADs in midNZ
cleanindex=find(AbnormalityNZmid(:,1)==0);%%%% 245 models without abnormality in mid NZ
% 
% %%%%%%% Becareful that 3 layers had abonormality and therefore those cases
% %%%%%%% may be excluded when calculating deltaAPD,etc. The cases without
% %%%%%%% proper APD calculation should be excluded for sure.
% 
% %%%%%% exclude EADs in deltaAPD calculation: 
% excludeinmid=[find(AbnormalityNZmid(:,1)==1);find(AbnormalityChronicBZmid(:,1)==1); find(AbnormalityChronicRZ1mid(:,1)==1); find(AbnormalityChronicRZ2mid(:,1)==1); find(AbnormalityChronicRZ2mid(:,3)==1);APDemptyRZ1mid];
% excludeinendo=[find(AbnormalityNZmid(:,1)==1);find(AbnormalityChronicRZ2endo(:,1)==1)];
% excludeinepi=[find(AbnormalityNZmid(:,1)==1);find(AbnormalityChronicRZ2epi(:,1)==1)];
% 
% %%%%%% keep EADs in deltaAPD calculation: 
% % excludeinmid=[find(AbnormalityNZmid(:,1)==1);APDemptyRZ1mid];
% % excludeinendo=find(AbnormalityNZmid(:,1)==1);
% % excludeinepi=find(AbnormalityNZmid(:,1)==1);
% 
% extraexcludeindexinmid=unique(excludeinmid);
% extraexcludeindexinendo=unique(excludeinendo);
% extraexcludeindexinepi=unique(excludeinepi);
% cleanindexinmid=setdiff(linspace(1,253,253)',extraexcludeindexinmid);
% cleanindexinendo=setdiff(linspace(1,253,253)',extraexcludeindexinendo);
% cleanindexinepi=setdiff(linspace(1,253,253)',extraexcludeindexinepi);
% 
% %%%%%% deltaAPD %%%%%%
% figure()
% subplot(1,3,1)%%%% 
% hist1 =histogram(d1epi(cleanindexinepi,4),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d1endo(cleanindexinendo,4), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d1mid(cleanindexinmid,4), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta APD (ms) BZ-NZ')
% title('Chronic BZ')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(1,4) dbaseepi(1,4)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(1,4) dbaseendo(1,4)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(1,4) dbasemid(1,4)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,2)
% hist1 =histogram(d2epi(cleanindexinepi,4),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d2endo(cleanindexinendo,4), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d2mid(cleanindexinmid,4), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta APD (ms) RZ-NZ')
% title('Chronic RZ1')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(2,4) dbaseepi(2,4)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(2,4) dbaseendo(2,4)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(2,4) dbasemid(2,4)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,3)
% hist1 =histogram(d3epi(cleanindexinepi,4),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d3endo(cleanindexinendo,4), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d3mid(cleanindexinmid,4), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo')
% xlabel('\Delta APD (ms) RZ-NZ')
% title('Chronic RZ2')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(3,4) dbaseepi(3,4)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(3,4) dbaseendo(3,4)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(3,4) dbasemid(3,4)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% 
% %%%%%% deltaCaTmax %%%%%%
% figure()
% subplot(1,3,1)
% hist1 =histogram(d1epi(cleanindexinepi,11),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d1endo(cleanindexinendo,11), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d1mid(cleanindexinmid,11), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta CaTmax (mM) BZ-NZ')
% title('Chronic BZ')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(1,11) dbaseepi(1,11)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(1,11) dbaseendo(1,11)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(1,11) dbasemid(1,11)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,2)
% hist1 =histogram(d2epi(cleanindexinepi,11),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d2endo(cleanindexinendo,11), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d2mid(cleanindexinmid,11), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta CaTmax (mM) RZ-NZ')
% title('Chronic RZ1')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(2,11) dbaseepi(2,11)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(2,11) dbaseendo(2,11)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(2,11) dbasemid(2,11)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,3)
% hist1 =histogram(d3epi(cleanindexinepi,11),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d3endo(cleanindexinendo,11), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d3mid(cleanindexinmid,11), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo')
% xlabel('\Delta CaTmax (mM) RZ-NZ')
% title('Chronic RZ2')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(3,11) dbaseepi(3,11)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(3,11) dbaseendo(3,11)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(3,11) dbasemid(3,11)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% 
% %%%%%% deltaCaTmin %%%%%%
% figure()
% subplot(1,3,1)
% hist1 =histogram(d1epi(cleanindexinepi,12),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d1endo(cleanindexinendo,12), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d1mid(cleanindexinmid,12), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta CaTmin (mM) BZ-NZ')
% title('Chronic BZ')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(1,12) dbaseepi(1,12)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(1,12) dbaseendo(1,12)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(1,12) dbasemid(1,12)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,2)
% hist1 =histogram(d2epi(cleanindexinepi,12),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d2endo(cleanindexinendo,12), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d2mid(cleanindexinmid,12), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta CaTmin (mM) RZ-NZ')
% title('Chronic RZ1')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(2,12) dbaseepi(2,12)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(2,12) dbaseendo(2,12)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(2,12) dbasemid(2,12)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,3)
% hist1 =histogram(d3epi(cleanindexinepi,12),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d3endo(cleanindexinendo,12), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d3mid(cleanindexinmid,12), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo')
% xlabel('\Delta CaTmin (mM) RZ-NZ')
% title('Chronic RZ2')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(3,12) dbaseepi(3,12)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(3,12) dbaseendo(3,12)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(3,12) dbasemid(3,12)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% 
% %%%%%% deltaVmax %%%%%%
% figure()
% subplot(1,3,1)
% hist1 =histogram(d1epi(cleanindexinepi,1),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d1endo(cleanindexinendo,1), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d1mid(cleanindexinmid,1), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta Vmax (mV) BZ-NZ')
% title('Chronic BZ')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(1,1) dbaseepi(1,1)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(1,1) dbaseendo(1,1)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(1,1) dbasemid(1,1)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,2)
% hist1 =histogram(d2epi(cleanindexinepi,1),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d2endo(cleanindexinendo,1), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d2mid(cleanindexinmid,1), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta Vmax (mV) RZ-NZ')
% title('Chronic RZ1')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(2,1) dbaseepi(2,1)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(2,1) dbaseendo(2,1)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(2,1) dbasemid(2,1)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,3)
% hist1 =histogram(d3epi(cleanindexinepi,1),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d3endo(cleanindexinendo,1), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d3mid(cleanindexinmid,1), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo')
% xlabel('\Delta Vmax (mV) RZ-NZ')
% title('Chronic RZ2')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(3,1) dbaseepi(3,1)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(3,1) dbaseendo(3,1)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(3,1) dbasemid(3,1)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% 
% %%%%%% deltaRMP %%%%%%
% figure()
% subplot(1,3,1)
% hist1 =histogram(d1epi(cleanindexinepi,2),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d1endo(cleanindexinendo,2), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d1mid(cleanindexinmid,2), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta RMP (mV) BZ-NZ')
% title('Chronic BZ')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(1,2) dbaseepi(1,2)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(1,2) dbaseendo(1,2)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(1,2) dbasemid(1,2)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,2)
% hist1 =histogram(d2epi(cleanindexinepi,2),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d2endo(cleanindexinendo,2), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d2mid(cleanindexinmid,2), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta RMP (mV) RZ-NZ')
% title('Chronic RZ1')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(2,2) dbaseepi(2,2)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(2,2) dbaseendo(2,2)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(2,2) dbasemid(2,2)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,3)
% hist1 =histogram(d3epi(cleanindexinepi,2),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d3endo(cleanindexinendo,2), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d3mid(cleanindexinmid,2), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo')
% xlabel('\Delta RMP (mV) RZ-NZ')
% title('Chronic RZ2')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(3,2) dbaseepi(3,2)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(3,2) dbaseendo(3,2)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(3,2) dbasemid(3,2)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% 
% %%%%%% deltaCaTD %%%%%%
% figure()
% subplot(1,3,1)
% hist1 =histogram(d1epi(cleanindexinepi,8),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d1endo(cleanindexinendo,8), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d1mid(cleanindexinmid,8), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta CaTD (ms) BZ-NZ')
% title('Chronic BZ')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(1,8) dbaseepi(1,8)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(1,8) dbaseendo(1,8)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(1,8) dbasemid(1,8)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,2)
% hist1 =histogram(d2epi(cleanindexinepi,8),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d2endo(cleanindexinendo,8), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d2mid(cleanindexinmid,8), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta CaTD (ms) RZ-NZ')
% title('Chronic RZ1')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(2,8) dbaseepi(2,8)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(2,8) dbaseendo(2,8)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(2,8) dbasemid(2,8)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,3)
% hist1 =histogram(d3epi(cleanindexinepi,8),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(d3endo(cleanindexinendo,8), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(d3mid(cleanindexinmid,8), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo')
% xlabel('\Delta CaTD (ms) RZ-NZ')
% title('Chronic RZ2')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepi(3,8) dbaseepi(3,8)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendo(3,8) dbaseendo(3,8)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemid(3,8) dbasemid(3,8)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% %% delta biomarkers between chronic BZ and RZs
% 
% %%%%%% deltaAPD %%%%%%
% figure()
% subplot(1,2,1)%%%% 
% hist1 =histogram(D1epi(cleanindexinepi,4),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(D1endo(cleanindexinendo,4), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(D1mid(cleanindexinmid,4), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta APD (ms) RZ-BZ')
% title('Chronic RZ1')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([Dbaseepi(1,4) Dbaseepi(1,4)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([Dbaseendo(1,4) Dbaseendo(1,4)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([Dbasemid(1,4) Dbasemid(1,4)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,2,2)
% hist1 =histogram(D2epi(cleanindexinepi,4),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(D2endo(cleanindexinendo,4), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(D2mid(cleanindexinmid,4), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta APD (ms) RZ-BZ')
% title('Chronic RZ2')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([Dbaseepi(2,4) Dbaseepi(2,4)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([Dbaseendo(2,4) Dbaseendo(2,4)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([Dbasemid(2,4) Dbasemid(2,4)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% %%%%%% deltaCaTmax %%%%%%
% figure()
% subplot(1,2,1)%%%% 
% hist1 =histogram(D1epi(cleanindexinepi,11),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(D1endo(cleanindexinendo,11), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(D1mid(cleanindexinmid,11), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta CaTmax (mM) RZ-BZ')
% title('Chronic RZ1')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([Dbaseepi(1,11) Dbaseepi(1,11)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([Dbaseendo(1,11) Dbaseendo(1,11)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([Dbasemid(1,11) Dbasemid(1,11)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,2,2)
% hist1 =histogram(D2epi(cleanindexinepi,11),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(D2endo(cleanindexinendo,11), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(D2mid(cleanindexinmid,11), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta CaTmax (mM) RZ-BZ')
% title('Chronic RZ2')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([Dbaseepi(2,11) Dbaseepi(2,11)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([Dbaseendo(2,11) Dbaseendo(2,11)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([Dbasemid(2,11) Dbasemid(2,11)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% %%%%%% deltaCaTmin %%%%%%
% figure()
% subplot(1,2,1)%%%% 
% hist1 =histogram(D1epi(cleanindexinepi,12),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(D1endo(cleanindexinendo,12), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(D1mid(cleanindexinmid,12), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta CaTmin (mM) RZ-BZ')
% title('Chronic RZ1')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([Dbaseepi(1,12) Dbaseepi(1,12)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([Dbaseendo(1,12) Dbaseendo(1,12)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([Dbasemid(1,12) Dbasemid(1,12)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,2,2)
% hist1 =histogram(D2epi(cleanindexinepi,12),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(D2endo(cleanindexinendo,12), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(D2mid(cleanindexinmid,12), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta CaTmin (mM) RZ-BZ')
% title('Chronic RZ2')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([Dbaseepi(2,12) Dbaseepi(2,12)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([Dbaseendo(2,12) Dbaseendo(2,12)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([Dbasemid(2,12) Dbasemid(2,12)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% %% plot POM for NZ and Acute BZ1 as grey and baselines as black
% cd ../SKPOMNZ/NZepiPOM253
% param.bcl=1000;
% figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','NZepiCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'color','b')
%     hold on
%     
% end
% cd ..
% baselineNZEpi=importdata('NZepiCL1000Model0.mat');
% 
% % title('NZ Epicardial Models')
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% cd ../SKPOMBZ/BZepiPOM253Allcurrents
% % figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','BZepiCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'color',[0.5 0.5 0.5])
%     hold on    
% end
% baselineBZ1Epi=importdata('BZepiCL1000Model0.mat');
% plot(baselineNZEpi.time,baselineNZEpi.V,'color','k','LineWidth',2)
% plot(baselineBZ1Epi.time,baselineBZ1Epi.V,'color','r','LineWidth',2)
% % title('Chronic RZ1 Epicardial Models')
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% set(gca,'fontsize',16,'fontweight','bold');
% cd ..
% %% plot POM for NZ and RZ1 as grey and baselines as black
% cd ../SKPOMNZ/NZepiPOM253
% param.bcl=1000;
% figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','NZepiCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'color','b')
%     hold on
%     
% end
% cd ..
% baselineNZEpi=importdata('NZepiCL1000Model0.mat');
% 
% % title('NZ Epicardial Models')
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% cd ../SKPOMHFRZ/RZepiPOM253HegyiCaMKJrelSlow
% % figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'color',[0.5 0.5 0.5])
%     hold on    
% end
% baselineRZ1Epi=importdata('RZepiCL1000Model0.mat');
% plot(baselineNZEpi.time,baselineNZEpi.V,'color','k','LineWidth',2)
% plot(baselineRZ1Epi.time,baselineRZ1Epi.V,'color','r','LineWidth',2)
% % title('Chronic RZ1 Epicardial Models')
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% set(gca,'fontsize',16,'fontweight','bold');
% cd ..

%% plot alternans POM figure for RZ1 CL
cd ../SKPOMHFRZ/AlternansCaMKJrelSlow/RZepiPOM253HegyiCaMKJrelSlowFast
param.bcl=400;
figure()
for i=1:length(cleanindex)
    index=Parameters(cleanindex(i),1);
    filename1=sprintf('%s%d%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'Beats',1,'.mat');
    filename2=sprintf('%s%d%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'Beats',2,'.mat');
    data1=importdata(filename1);
    data2=importdata(filename2);
    plot(data1.time,data1.V,'color',[0.5 0.5 0.5])
    hold on
    plot(data2.time+param.bcl,data2.V,'color',[0.5 0.5 0.5])
    hold on    
end
index=358;
filename1=sprintf('%s%d%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'Beats',1,'.mat');
filename2=sprintf('%s%d%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'Beats',2,'.mat');
data1=importdata(filename1);
data2=importdata(filename2);
plot(data1.time,data1.V,'color','b','LineWidth',2)
plot(data2.time+param.bcl,data2.V,'color','b','LineWidth',2)

xlabel('Time (ms)')
ylabel('Vm (mV)')
set(gca,'fontsize',16,'fontweight','bold');
cd ../..

figure()
cd ../SKPOMHFRZ/AlternansCaMKJrelSlow/RZepiPOM253HegyiCaMKJrelSlowFast
param.bcl=400;
for i=1:length(cleanindex)
    index=Parameters(cleanindex(i),1);
    filename1=sprintf('%s%d%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'Beats',1,'.mat');
    filename2=sprintf('%s%d%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'Beats',2,'.mat');
    data1=importdata(filename1);
    data2=importdata(filename2);
    plot(data1.time,data1.Cai,'color',[0.5 0.5 0.5])
    hold on
    plot(data2.time+param.bcl,data2.Cai,'color',[0.5 0.5 0.5])
    hold on    
end
index=358;
filename1=sprintf('%s%d%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'Beats',1,'.mat');
filename2=sprintf('%s%d%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'Beats',2,'.mat');
data1=importdata(filename1);
data2=importdata(filename2);
plot(data1.time,data1.Cai,'color','b','LineWidth',2)
plot(data2.time+param.bcl,data2.Cai,'color','b','LineWidth',2)

xlabel('Time (ms)')
ylabel('CaT (mM)')
set(gca,'fontsize',16,'fontweight','bold');
cd ../..

% %% plot all the traces and abnormal traces of Chronic RZ2 endo
% cd ../SKPOMHFRZAll/RZendoPOM253AllCaMKJrelSlow
% param.bcl=1000;
% figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','RZendoCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'color',[0.5 0.5 0.5])
%     hold on
%     
% end
% title('Chronic RZ2 Endocardial Cells')
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% % figure()
% for i=1:size(Parameters,1)
%     if AbnormalityChronicRZ2endo(i,1)==1 || AbnormalityChronicRZ2endo(i,3)==1
%         index=Parameters(i,1);
%         if ismember(i,cleanindex)==1
%     filename=sprintf('%s%d%s%d%s','RZendoCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'r','LineWidth',2)
%     hold on
%         end
%     end
% end
% % title('Chronic RZ2 Endocardial Cells')
% % xlabel('Time (ms)')
% % ylabel('Vm (mV)')
% % set(gca,'fontsize',12,'fontweight','bold');
% 
% figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','RZendoCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.Cai,'color',[0.5 0.5 0.5])
%     hold on
%     
% end
% title('Chronic RZ2 Endocardial Cells')
% xlabel('Time (ms)')
% ylabel('Cai (mM)')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% % figure()
% for i=1:size(Parameters,1)
%     if AbnormalityChronicRZ2endo(i,1)==1 || AbnormalityChronicRZ2endo(i,3)==1
%         index=Parameters(i,1);
%         if ismember(i,cleanindex)==1
%     filename=sprintf('%s%d%s%d%s','RZendoCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.Cai,'r','LineWidth',2)
%     hold on
%         end
%     end
% end
% 
% cd ../../SKPOMHFBZ
% %% plot all the traces and abnormal traces of Chronic RZ2 epi
% cd ../SKPOMHFRZAll/RZepiPOM253AllCaMKJrelSlow
% param.bcl=1000;
% figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'color',[0.5 0.5 0.5])
%     hold on
%     
% end
% title('Chronic RZ2 Epicardial Cells')
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% % figure()
% for i=1:size(Parameters,1)
%     if AbnormalityChronicRZ2epi(i,1)==1 || AbnormalityChronicRZ2epi(i,3)==1
%         index=Parameters(i,1);
%         if ismember(i,cleanindex)==1
%     filename=sprintf('%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'r','LineWidth',2)
%     hold on
%         end
%     end
% end
% % title('Chronic RZ2 Epicardial POM')
% % xlabel('Time (ms)')
% % ylabel('Vm (mV)')
% % set(gca,'fontsize',12,'fontweight','bold');
% 
% figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.Cai,'color',[0.5 0.5 0.5])
%     hold on
%     
% end
% title('Chronic RZ2 Epicardial Cells')
% xlabel('Time (ms)')
% ylabel('Cai (mM)')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% % figure()
% for i=1:size(Parameters,1)
%     if AbnormalityChronicRZ2epi(i,1)==1 || AbnormalityChronicRZ2epi(i,3)==1
%         index=Parameters(i,1);
%         if ismember(i,cleanindex)==1
%     filename=sprintf('%s%d%s%d%s','RZepiCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.Cai,'r','LineWidth',2)
%     hold on
%         end
%     end
% end
% 
% 
% cd ../../SKPOMHFBZ
% 
% %% plot all the traces and abnormal traces of Chronic RZ2 mid
% cd ../SKPOMHFRZAll/RZmidPOM253AllCaMKJrelSlow
% param.bcl=1000;
% figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','RZmidCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'color',[0.5 0.5 0.5])
%     hold on
% end
% title('Chronic RZ2 Midmyocardial Cells')
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% % figure()
% for i=1:size(Parameters,1)
%     if AbnormalityChronicRZ2mid(i,1)==1 || AbnormalityChronicRZ2mid(i,3)==1
%         index=Parameters(i,1);
%         if ismember(i,cleanindex)==1
%     filename=sprintf('%s%d%s%d%s','RZmidCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'r','LineWidth',2)
%     hold on
%         end
%     end
% end
% % title('Chronic RZ2 Midmyocardial Cells')
% % xlabel('Time (ms)')
% % ylabel('Vm (mV)')
% % set(gca,'fontsize',12,'fontweight','bold');
% figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','RZmidCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.Cai,'color',[0.5 0.5 0.5])
%     hold on
% end
% title('Chronic RZ2 Midmyocardial Cells')
% xlabel('Time (ms)')
% ylabel('Cai (mM)')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% % figure()
% for i=1:size(Parameters,1)
%     if AbnormalityChronicRZ2mid(i,1)==1 || AbnormalityChronicRZ2mid(i,3)==1
%         index=Parameters(i,1);
%         if ismember(i,cleanindex)==1
%     filename=sprintf('%s%d%s%d%s','RZmidCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.Cai,'r','LineWidth',2)
%     hold on
%         end
%     end
% end
% cd ../../SKPOMHFBZ
% 
% %% plot all the traces and abnormal traces of Chronic RZ1 mid
% cd ../SKPOMHFRZ/RZmidPOM253HegyiCaMKJrelSlow
% param.bcl=1000;
% figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','RZmidCL',param.bcl,'Model',index,'.mat');
%     if exist(filename)~=0
%     data=importdata(filename);
%     plot(data.time,data.V,'color',[0.5 0.5 0.5])
%     end
%     hold on
% end
% title('Chronic RZ1 Midmyocardial Cells')
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% % figure()
% for i=1:size(Parameters,1)
%     if AbnormalityChronicRZ1mid(i,1)==1 || AbnormalityChronicRZ1mid(i,3)==1
%         index=Parameters(i,1);
%         if ismember(i,cleanindex)==1
%     filename=sprintf('%s%d%s%d%s','RZmidCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'r','LineWidth',2)
%     hold on
%         end
%     end
% end
% % title('Chronic RZ1 Midmyocardial Cells')
% % xlabel('Time (ms)')
% % ylabel('Vm (mV)')
% % set(gca,'fontsize',12,'fontweight','bold');
% figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','RZmidCL',param.bcl,'Model',index,'.mat');
%     if exist(filename)~=0
%     data=importdata(filename);
%     plot(data.time,data.Cai,'color',[0.5 0.5 0.5])
%     end
%     hold on
% end
% title('Chronic RZ1 Midmyocardial Cells')
% xlabel('Time (ms)')
% ylabel('Cai (mM)')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% % figure()
% for i=1:size(Parameters,1)
%     if AbnormalityChronicRZ1mid(i,1)==1 || AbnormalityChronicRZ1mid(i,3)==1
%         index=Parameters(i,1);
%         if ismember(i,cleanindex)==1
%     filename=sprintf('%s%d%s%d%s','RZmidCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.Cai,'r','LineWidth',2)
%     hold on
%         end
%     end
% end
% cd ../../SKPOMHFBZ
% 
% %% plot all the traces and abnormal traces of Chronic BZ mid
% cd BZmidPOM253HegyiCaMKJrelSlow
% param.bcl=1000;
% figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','BZmidCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'color',[0.5 0.5 0.5])
%     hold on
% end
% title('Chronic BZ Midmyocardial Cells')
% xlabel('Time (ms)')
% ylabel('Vm (mV)')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% % figure()
% for i=1:size(Parameters,1)
%     if AbnormalityChronicBZmid(i,1)==1 || AbnormalityChronicBZmid(i,3)==1
%         index=Parameters(i,1);
%         if ismember(i,cleanindex)==1
%     filename=sprintf('%s%d%s%d%s','BZmidCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.V,'r','LineWidth',2)
%     hold on
%         end
%     end
% end
% % title('Chronic BZ Midmyocardial Cells')
% % xlabel('Time (ms)')
% % ylabel('Vm (mV)')
% % set(gca,'fontsize',12,'fontweight','bold');
% figure()
% for i=1:length(cleanindex)
%     index=Parameters(cleanindex(i),1);
%     filename=sprintf('%s%d%s%d%s','BZmidCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.Cai,'color',[0.5 0.5 0.5])
%     hold on
% end
% title('Chronic BZ Midmyocardial Cells')
% xlabel('Time (ms)')
% ylabel('Cai (mM)')
% set(gca,'fontsize',16,'fontweight','bold');
% 
% % figure()
% for i=1:size(Parameters,1)
%     if AbnormalityChronicBZmid(i,1)==1 || AbnormalityChronicBZmid(i,3)==1
%         index=Parameters(i,1);
%         if ismember(i,cleanindex)==1
%     filename=sprintf('%s%d%s%d%s','BZmidCL',param.bcl,'Model',index,'.mat');
%     data=importdata(filename);
%     plot(data.time,data.Cai,'r','LineWidth',2)
%     hold on
%         end
%     end
% end
% cd ../../SKPOMHFBZ
% 
% %% load the ERP data to plot
% %%%%%%% NZ
% cd ../SKPOMBZ/ERPcalculation
% NZendoERP=importdata('NZendoPOM253ERP.mat');
% NZepiERP=importdata('NZepiPOM253ERP.mat');
% NZmidERP=importdata('NZmidPOM253ERP.mat');
% NZBaselineendoERP=importdata('NZendoBaselineERP.mat');
% NZBaselineepiERP=importdata('NZepiBaselineERP.mat');
% NZBaselinemidERP=importdata('NZmidBaselineERP.mat');
% 
% %%%%%% Chronic BZ
% cd ../../SKPOMHFBZ/ERPcalculation
% ChronicBZendoERP=importdata('BZendoPOM253ERPHegyiJup40CaMKJrelSlow.mat');
% ChronicBZepiERP=importdata('BZepiPOM253ERPHegyiJup40CaMKJrelSlow.mat');
% ChronicBZmidERP=importdata('BZmidPOM253ERPHegyiJup40CaMKJrelSlow.mat');
% 
% ChronicBZBaselineendoERP=importdata('BZendoBaselineERPHegyiJup40CaMKJrelSlow.mat');
% ChronicBZBaselineepiERP=importdata('BZepiBaselineERPHegyiJup40CaMKJrelSlow.mat');
% ChronicBZBaselinemidERP=importdata('BZmidBaselineERPHegyiJup40CaMKJrelSlow.mat');
% 
% cd ../../SKPOMHFRZ/ERPcalculation
% ChronicRZ1endoERP=importdata('RZendoPOM253ERPHegyiJup40CaMKJrelSlow.mat');
% ChronicRZ1epiERP=importdata('RZepiPOM253ERPHegyiJup40CaMKJrelSlow.mat');
% ChronicRZ1midERP=importdata('RZmidPOM253ERPHegyiJup40CaMKJrelSlow.mat');
% 
% ChronicRZ1BaselineendoERP=importdata('RZendoBaselineERPHegyiJup40CaMKJrelSlow.mat');
% ChronicRZ1BaselineepiERP=importdata('RZepiBaselineERPHegyiJup40CaMKJrelSlow.mat');
% ChronicRZ1BaselinemidERP=importdata('RZmidBaselineERPHegyiJup40CaMKJrelSlow.mat');
% 
% cd ../../SKPOMHFRZAll/ERPcalculation
% ChronicRZ2endoERP=importdata('RZendoPOM253ERPAllJup30CaMKJrelSlow.mat');
% ChronicRZ2epiERP=importdata('RZepiPOM253ERPAllJup30CaMKJrelSlow.mat');
% ChronicRZ2midERP=importdata('RZmidPOM253ERPAllJup30CaMKJrelSlow.mat');
% 
% ChronicRZ2BaselineendoERP=importdata('RZendoBaselineERPAllJup30CaMKJrelSlow.mat');
% ChronicRZ2BaselineepiERP=importdata('RZepiBaselineERPAllJup30CaMKJrelSlow.mat');
% ChronicRZ2BaselinemidERP=importdata('RZmidBaselineERPAllJup30CaMKJrelSlow.mat');
% cd ../../SKPOMHFBZ
% 
% %%%%% BZ,RZ - NZ
% dendoERP1=ChronicBZendoERP-NZendoERP;
% depiERP1=ChronicBZepiERP-NZepiERP;
% dmidERP1=ChronicBZmidERP-NZmidERP;
% 
% dendoERP2=ChronicRZ1endoERP-NZendoERP;
% depiERP2=ChronicRZ1epiERP-NZepiERP;
% dmidERP2=ChronicRZ1midERP-NZmidERP;
% 
% dendoERP3=ChronicRZ2endoERP-NZendoERP;
% depiERP3=ChronicRZ2epiERP-NZepiERP;
% dmidERP3=ChronicRZ2midERP-NZmidERP;
% 
% ChronicBaselineendoERP=[ChronicBZBaselineendoERP ChronicRZ1BaselineendoERP ChronicRZ2BaselineendoERP];
% ChronicBaselineepiERP=[ChronicBZBaselineepiERP ChronicRZ1BaselineepiERP ChronicRZ2BaselineepiERP];
% ChronicBaselinemidERP=[ChronicBZBaselinemidERP ChronicRZ1BaselinemidERP ChronicRZ2BaselinemidERP];
% 
% dbaseendoERP=ChronicBaselineendoERP-NZBaselineendoERP;
% dbaseepiERP=ChronicBaselineepiERP-NZBaselineepiERP;
% dbasemidERP=ChronicBaselinemidERP-NZBaselinemidERP;
% 
% %%%%% RZ-BZ
% DendoERP1=ChronicRZ1endoERP-ChronicBZendoERP;
% DepiERP1=ChronicRZ1epiERP-ChronicBZepiERP;
% DmidERP1=ChronicRZ1midERP-ChronicBZmidERP;
% 
% DendoERP2=ChronicRZ2endoERP-ChronicBZendoERP;
% DepiERP2=ChronicRZ2epiERP-ChronicBZepiERP;
% DmidERP2=ChronicRZ2midERP-ChronicBZmidERP;
% 
% RZBaselineendoERP=[ChronicRZ1BaselineendoERP ChronicRZ2BaselineendoERP];
% RZBaselineepiERP=[ChronicRZ1BaselineepiERP ChronicRZ2BaselineepiERP];
% RZBaselinemidERP=[ChronicRZ1BaselinemidERP ChronicRZ2BaselinemidERP];
% 
% DbaseendoERP=RZBaselineendoERP-ChronicBZBaselineendoERP;
% DbaseepiERP=RZBaselineepiERP-ChronicBZBaselineepiERP;
% DbasemidERP=RZBaselinemidERP-ChronicBZBaselinemidERP;
% 
% %%%%%% Be careful to remove the 8 mid NZ EAD models and the other models
% %%%%%% with ERP=0 (failure of ERP calculation)
% 
% %%%%%% Also excldue the EADs in the mid?
% excludeERPinendo=[find(AbnormalityNZmid(:,1)==1);find(NZendoERP==0); find(ChronicBZendoERP==0); find(ChronicRZ1endoERP==0); find(ChronicRZ2endoERP==0)];
% excludeERPinepi=[find(AbnormalityNZmid(:,1)==1);find(NZepiERP==0); find(ChronicBZepiERP==0); find(ChronicRZ1epiERP==0); find(ChronicRZ2epiERP==0)];
% excludeERPinmid=[find(AbnormalityNZmid(:,1)==1);find(NZmidERP==0); find(ChronicBZmidERP==0); find(ChronicRZ1midERP==0); find(ChronicRZ2midERP==0); find(AbnormalityChronicBZmid(:,1)==1); find(AbnormalityChronicRZ1mid(:,1)==1); find(AbnormalityChronicRZ2mid(:,1)==1); find(AbnormalityChronicRZ2mid(:,3)==1);APDemptyRZ1mid];
% 
% extraexcludeERPindexinendo=unique(excludeERPinendo);
% extraexcludeERPindexinepi=unique(excludeERPinepi);
% extraexcludeERPindexinmid=unique(excludeERPinmid);
% cleanERPindexinendo=setdiff(linspace(1,253,253)',extraexcludeERPindexinendo);
% cleanERPindexinepi=setdiff(linspace(1,253,253)',extraexcludeERPindexinepi);
% cleanERPindexinmid=setdiff(linspace(1,253,253)',extraexcludeERPindexinmid);
% 
% figure()
% subplot(1,3,1)%%%% 
% hist1 =histogram(depiERP1(cleanERPindexinepi),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(dendoERP1(cleanERPindexinendo), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(dmidERP1(cleanERPindexinmid), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta ERP (ms) BZ-NZ')
% title('Chronic BZ')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepiERP(1) dbaseepiERP(1)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendoERP(1) dbaseendoERP(1)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemidERP(1) dbasemidERP(1)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,2)%%%%
% hist1 =histogram(depiERP2(cleanERPindexinepi),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(dendoERP2(cleanERPindexinendo), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(dmidERP2(cleanERPindexinmid), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta ERP (ms) RZ-NZ')
% title('Chronic RZ1')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepiERP(2) dbaseepiERP(2)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendoERP(2) dbaseendoERP(2)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemidERP(2) dbasemidERP(2)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% subplot(1,3,3)%%%%
% hist1 =histogram(depiERP3(cleanERPindexinepi),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(dendoERP3(cleanERPindexinendo), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(dmidERP3(cleanERPindexinmid), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta ERP (ms) RZ-NZ')
% title('Chronic RZ2')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([dbaseepiERP(3) dbaseepiERP(3)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([dbaseendoERP(3) dbaseendoERP(3)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([dbasemidERP(3) dbasemidERP(3)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% figure()
% subplot(1,2,1)%%%% 
% hist1 =histogram(DepiERP1(cleanERPindexinepi),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(DendoERP1(cleanERPindexinendo), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(DmidERP1(cleanERPindexinmid), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta ERP (ms) RZ-BZ')
% title('Chronic RZ1')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([DbaseepiERP(1) DbaseepiERP(1)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([DbaseendoERP(1) DbaseendoERP(1)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([DbasemidERP(1) DbasemidERP(1)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% subplot(1,2,2)%%%% 
% hist1 =histogram(DepiERP2(cleanERPindexinepi),'EdgeColor', 'blue', 'FaceColor',  'blue' );
% hold on
% hist2 = histogram(DendoERP2(cleanERPindexinendo), 'EdgeColor', 'green', 'FaceColor',  'green', 'FaceAlpha', 0.2 );
% hist3 = histogram(DmidERP2(cleanERPindexinmid), 'EdgeColor', 'yellow', 'FaceColor',  'yellow', 'FaceAlpha', 0.2 );
% legend('Epi','Endo','Mid')
% xlabel('\Delta ERP (ms) RZ-BZ')
% title('Chronic RZ2')
% set(gca,'fontsize',12,'fontweight','bold');
% hax=gca;
% line([DbaseepiERP(2) DbaseepiERP(2)],get(hax,'YLim'),'Color','b','LineWidth',2)
% line([DbaseendoERP(2) DbaseendoERP(2)],get(hax,'YLim'),'Color','g','LineWidth',2)
% line([DbasemidERP(2) DbasemidERP(2)],get(hax,'YLim'),'Color','y','LineWidth',2)
% legend('Epi POM','Endo POM','Mid POM','Epi baseline','Endo baseline','Mid baseline')
% 
% %% Analyze the Chronic mid RZ2 EAD and RF model parameters and calcium biomarkers
% cd ../SKPOMHFRZAll
% midRZ2Ab=importdata('Abnormality253MidRZAllCaMKJrelSlow.mat');%%% 1Hz Abnormality
% midRZ2Biomarkers=importdata('Biomarkers253MidRZAllCaMKJrelSlow.mat');
% 
% cleanPara=Parameters(cleanindex,:);
% cleanmidRZ2Biomarkers=midRZ2Biomarkers(cleanindex,:);
% cleanmidRZ2Ab=midRZ2Ab(cleanindex,:);
% 
% midRZ2EADindex=find(cleanmidRZ2Ab(:,1)==1);%%%% index in 245 clean cases
% midRZ2RFindex=find(cleanmidRZ2Ab(:,3)==1);%%%% index in 245 clean cases
% midRZ2EADRFindex=unique([midRZ2EADindex;midRZ2RFindex]);%%%% index in 245 clean cases
% midRZ2Otherindex=setdiff(linspace(1,245,245)',midRZ2EADRFindex);%%%% index in 245 clean cases
% 
% %%%%%%% Compare the parameters between the mid RZ2 EAD,RF cases with other cases
% pGNamidRZ2=ranksum(cleanPara(midRZ2EADRFindex,2),cleanPara(midRZ2Otherindex,2));
% pGNaLmidRZ2=ranksum(cleanPara(midRZ2EADRFindex,3),cleanPara(midRZ2Otherindex,3));
% pGtomidRZ2=ranksum(cleanPara(midRZ2EADRFindex,4),cleanPara(midRZ2Otherindex,4));
% pGCaLmidRZ2=ranksum(cleanPara(midRZ2EADRFindex,5),cleanPara(midRZ2Otherindex,5));
% pGKrmidRZ2=ranksum(cleanPara(midRZ2EADRFindex,6),cleanPara(midRZ2Otherindex,6));
% pGKsmidRZ2=ranksum(cleanPara(midRZ2EADRFindex,7),cleanPara(midRZ2Otherindex,7));
% pGK1midRZ2=ranksum(cleanPara(midRZ2EADRFindex,8),cleanPara(midRZ2Otherindex,8));
% pGNCXmidRZ2=ranksum(cleanPara(midRZ2EADRFindex,9),cleanPara(midRZ2Otherindex,9));
% pGNaKmidRZ2=ranksum(cleanPara(midRZ2EADRFindex,10),cleanPara(midRZ2Otherindex,10));
% pJrelmidRZ2=ranksum(cleanPara(midRZ2EADRFindex,11),cleanPara(midRZ2Otherindex,11));
% pJupmidRZ2=ranksum(cleanPara(midRZ2EADRFindex,12),cleanPara(midRZ2Otherindex,12));
% 
% 
% figure()
% subplot(1,4,1)
% C = [cleanPara(midRZ2EADRFindex,5);cleanPara(midRZ2Otherindex,5)];
% g = [repmat(1, [length(midRZ2EADRFindex), 1]) ;repmat(2, [length(midRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('G_C_a_L')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,4,2)
% C = [cleanPara(midRZ2EADRFindex,6);cleanPara(midRZ2Otherindex,6)];
% g = [repmat(1, [length(midRZ2EADRFindex), 1]) ;repmat(2, [length(midRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('G_K_r')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,4,3)
% C = [cleanPara(midRZ2EADRFindex,9);cleanPara(midRZ2Otherindex,9)];
% g = [repmat(1, [length(midRZ2EADRFindex), 1]) ;repmat(2, [length(midRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('G_N_C_X')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,4,4)
% C = [cleanPara(midRZ2EADRFindex,12);cleanPara(midRZ2Otherindex,12)];
% g = [repmat(1, [length(midRZ2EADRFindex), 1]) ;repmat(2, [length(midRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('P_J_u_p')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% %%%%%% compare the biomarkers between the mid RZ2 EAD,RF cases with other cases
% pCaTmaxmidRZ2=ranksum(cleanmidRZ2Biomarkers(midRZ2EADRFindex,11),cleanmidRZ2Biomarkers(midRZ2Otherindex,11));
% pCaTminmidRZ2=ranksum(cleanmidRZ2Biomarkers(midRZ2EADRFindex,12),cleanmidRZ2Biomarkers(midRZ2Otherindex,12));
% figure()
% subplot(1,2,1)
% C = [cleanmidRZ2Biomarkers(midRZ2EADRFindex,11);cleanmidRZ2Biomarkers(midRZ2Otherindex,11)];
% g = [repmat(1, [length(midRZ2EADRFindex), 1]) ;repmat(2, [length(midRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_a_x')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,2,2)
% C = [cleanmidRZ2Biomarkers(midRZ2EADRFindex,12);cleanmidRZ2Biomarkers(midRZ2Otherindex,12)];
% g = [repmat(1, [length(midRZ2EADRFindex), 1]) ;repmat(2, [length(midRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_i_n')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% 
% %% Analyze the Chronic epi RZ2 EAD and RF model parameters and calcium biomarkers (only 9 EAD in this case)
% 
% epiRZ2Ab=importdata('Abnormality253EpiRZAllCaMKJrelSlow.mat');%%% 1Hz Abnormality
% epiRZ2Biomarkers=importdata('Biomarkers253EpiRZAllCaMKJrelSlow.mat');
% 
% cleanPara=Parameters(cleanindex,:);
% cleanepiRZ2Biomarkers=epiRZ2Biomarkers(cleanindex,:);
% cleanepiRZ2Ab=epiRZ2Ab(cleanindex,:);
% 
% epiRZ2EADindex=find(cleanepiRZ2Ab(:,1)==1);%%%% index in 245 clean cases
% epiRZ2RFindex=find(cleanepiRZ2Ab(:,3)==1);%%%% index in 245 clean cases
% epiRZ2EADRFindex=unique([epiRZ2EADindex;epiRZ2RFindex]);%%%% index in 245 clean cases
% epiRZ2Otherindex=setdiff(linspace(1,245,245)',epiRZ2EADRFindex);%%%% index in 245 clean cases
% 
% %%%%%%% Compare the parameters between the epi RZ2 EAD,RF cases with other cases
% pGNaepiRZ2=ranksum(cleanPara(epiRZ2EADRFindex,2),cleanPara(epiRZ2Otherindex,2));
% pGNaLepiRZ2=ranksum(cleanPara(epiRZ2EADRFindex,3),cleanPara(epiRZ2Otherindex,3));
% pGtoepiRZ2=ranksum(cleanPara(epiRZ2EADRFindex,4),cleanPara(epiRZ2Otherindex,4));
% pGCaLepiRZ2=ranksum(cleanPara(epiRZ2EADRFindex,5),cleanPara(epiRZ2Otherindex,5));
% pGKrepiRZ2=ranksum(cleanPara(epiRZ2EADRFindex,6),cleanPara(epiRZ2Otherindex,6));
% pGKsepiRZ2=ranksum(cleanPara(epiRZ2EADRFindex,7),cleanPara(epiRZ2Otherindex,7));
% pGK1epiRZ2=ranksum(cleanPara(epiRZ2EADRFindex,8),cleanPara(epiRZ2Otherindex,8));
% pGNCXepiRZ2=ranksum(cleanPara(epiRZ2EADRFindex,9),cleanPara(epiRZ2Otherindex,9));
% pGNaKepiRZ2=ranksum(cleanPara(epiRZ2EADRFindex,10),cleanPara(epiRZ2Otherindex,10));
% pJrelepiRZ2=ranksum(cleanPara(epiRZ2EADRFindex,11),cleanPara(epiRZ2Otherindex,11));
% pJupepiRZ2=ranksum(cleanPara(epiRZ2EADRFindex,12),cleanPara(epiRZ2Otherindex,12));
% 
% figure()
% subplot(1,4,1)
% C = [cleanPara(epiRZ2EADRFindex,6);cleanPara(epiRZ2Otherindex,6)];
% g = [repmat(1, [length(epiRZ2EADRFindex), 1]) ;repmat(2, [length(epiRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('G_K_r')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Epi')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,4,2)
% C = [cleanPara(epiRZ2EADRFindex,9);cleanPara(epiRZ2Otherindex,9)];
% g = [repmat(1, [length(epiRZ2EADRFindex), 1]) ;repmat(2, [length(epiRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('G_N_C_X')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Epi')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,4,3)
% C = [cleanPara(epiRZ2EADRFindex,10);cleanPara(epiRZ2Otherindex,10)];
% g = [repmat(1, [length(epiRZ2EADRFindex), 1]) ;repmat(2, [length(epiRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('G_N_a_K')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Epi')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,4,4)
% C = [cleanPara(epiRZ2EADRFindex,12);cleanPara(epiRZ2Otherindex,12)];
% g = [repmat(1, [length(epiRZ2EADRFindex), 1]) ;repmat(2, [length(epiRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('P_J_u_p')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Epi')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% %%%%%% compare the biomarkers between the epi RZ2 EAD,RF cases with other cases
% pCaTmaxepiRZ2=ranksum(cleanepiRZ2Biomarkers(epiRZ2EADRFindex,11),cleanepiRZ2Biomarkers(epiRZ2Otherindex,11));
% pCaTminepiRZ2=ranksum(cleanepiRZ2Biomarkers(epiRZ2EADRFindex,12),cleanepiRZ2Biomarkers(epiRZ2Otherindex,12));
% figure()
% subplot(1,2,1)
% C = [cleanepiRZ2Biomarkers(epiRZ2EADRFindex,11);cleanepiRZ2Biomarkers(epiRZ2Otherindex,11)];
% g = [repmat(1, [length(epiRZ2EADRFindex), 1]) ;repmat(2, [length(epiRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_a_x')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Epi')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,2,2)
% C = [cleanepiRZ2Biomarkers(epiRZ2EADRFindex,12);cleanepiRZ2Biomarkers(epiRZ2Otherindex,12)];
% g = [repmat(1, [length(epiRZ2EADRFindex), 1]) ;repmat(2, [length(epiRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_i_n')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Epi')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% cd ../SKPOMHFBZ/AlternansCaMKJrelSlow
% 
% 
% %% Analyze the Chronic mid RZ1 EAD and RF model parameters and calcium biomarkers (52 cases)
% cd ../../SKPOMHFRZ
% midRZ1Ab=importdata('Abnormality253MidRZHegyiCaMKJrelSlow.mat');%%% 1Hz Abnormality
% midRZ1Biomarkers=importdata('Biomarkers253MidRZHegyiCaMKJrelSlow.mat');
% 
% cleanPara=Parameters(cleanindex,:);
% cleanmidRZ1Biomarkers=midRZ1Biomarkers(cleanindex,:);
% cleanmidRZ1Ab=midRZ1Ab(cleanindex,:);
% 
% midRZ1EADindex=find(cleanmidRZ1Ab(:,1)==1);%%%% index in 245 clean cases
% midRZ1RFindex=find(cleanmidRZ1Ab(:,3)==1);%%%% index in 245 clean cases
% midRZ1EADRFindex=unique([midRZ1EADindex;midRZ1RFindex]);%%%% index in 245 clean cases
% midRZ1Otherindex=setdiff(linspace(1,245,245)',midRZ1EADRFindex);%%%% index in 245 clean cases
% 
% %%%%%%% Compare the parameters between the mid RZ1 EAD,RF cases with other cases
% pGNamidRZ1=ranksum(cleanPara(midRZ1EADRFindex,2),cleanPara(midRZ1Otherindex,2));
% pGNaLmidRZ1=ranksum(cleanPara(midRZ1EADRFindex,3),cleanPara(midRZ1Otherindex,3));
% pGtomidRZ1=ranksum(cleanPara(midRZ1EADRFindex,4),cleanPara(midRZ1Otherindex,4));
% pGCaLmidRZ1=ranksum(cleanPara(midRZ1EADRFindex,5),cleanPara(midRZ1Otherindex,5));
% pGKrmidRZ1=ranksum(cleanPara(midRZ1EADRFindex,6),cleanPara(midRZ1Otherindex,6));
% pGKsmidRZ1=ranksum(cleanPara(midRZ1EADRFindex,7),cleanPara(midRZ1Otherindex,7));
% pGK1midRZ1=ranksum(cleanPara(midRZ1EADRFindex,8),cleanPara(midRZ1Otherindex,8));
% pGNCXmidRZ1=ranksum(cleanPara(midRZ1EADRFindex,9),cleanPara(midRZ1Otherindex,9));
% pGNaKmidRZ1=ranksum(cleanPara(midRZ1EADRFindex,10),cleanPara(midRZ1Otherindex,10));
% pJrelmidRZ1=ranksum(cleanPara(midRZ1EADRFindex,11),cleanPara(midRZ1Otherindex,11));
% pJupmidRZ1=ranksum(cleanPara(midRZ1EADRFindex,12),cleanPara(midRZ1Otherindex,12));
% 
% figure()
% subplot(1,3,1)
% C = [cleanPara(midRZ1EADRFindex,5);cleanPara(midRZ1Otherindex,5)];
% g = [repmat(1, [length(midRZ1EADRFindex), 1]) ;repmat(2, [length(midRZ1Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('G_C_a_L')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ1 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,3,2)
% C = [cleanPara(midRZ1EADRFindex,6);cleanPara(midRZ1Otherindex,6)];
% g = [repmat(1, [length(midRZ1EADRFindex), 1]) ;repmat(2, [length(midRZ1Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('G_K_r')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ1 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,3,3)
% C = [cleanPara(midRZ1EADRFindex,9);cleanPara(midRZ1Otherindex,9)];
% g = [repmat(1, [length(midRZ1EADRFindex), 1]) ;repmat(2, [length(midRZ1Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('G_N_C_X')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ1 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% 
% %%%%%% compare the biomarkers between the mid RZ1 EAD,RF cases with other cases
% pCaTmaxmidRZ1=ranksum(cleanmidRZ1Biomarkers(midRZ1EADRFindex,11),cleanmidRZ1Biomarkers(midRZ1Otherindex,11));
% pCaTminmidRZ1=ranksum(cleanmidRZ1Biomarkers(midRZ1EADRFindex,12),cleanmidRZ1Biomarkers(midRZ1Otherindex,12));
% 
% figure()
% subplot(1,2,1)
% C = [cleanmidRZ1Biomarkers(midRZ1EADRFindex,11);cleanmidRZ1Biomarkers(midRZ1Otherindex,11)];
% g = [repmat(1, [length(midRZ1EADRFindex), 1]) ;repmat(2, [length(midRZ1Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_a_x')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ1 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,2,2)
% C = [cleanmidRZ1Biomarkers(midRZ1EADRFindex,12);cleanmidRZ1Biomarkers(midRZ1Otherindex,12)];
% g = [repmat(1, [length(midRZ1EADRFindex), 1]) ;repmat(2, [length(midRZ1Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_i_n')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ1 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% %% Analyze the Chronic mid BZ EAD and RF model parameters and calcium biomarkers (11 cases)
% cd ../SKPOMHFBZ
% midBZAb=importdata('Abnormality253MidBZHegyiCaMKJrelSlow.mat');%%% 1Hz Abnormality
% midBZBiomarkers=importdata('Biomarkers253MidBZHegyiCaMKJrelSlow.mat');
% 
% cleanPara=Parameters(cleanindex,:);
% cleanmidBZBiomarkers=midBZBiomarkers(cleanindex,:);
% cleanmidBZAb=midBZAb(cleanindex,:);
% 
% midBZEADindex=find(cleanmidBZAb(:,1)==1);%%%% index in 245 clean cases
% midBZRFindex=find(cleanmidBZAb(:,3)==1);%%%% index in 245 clean cases
% midBZEADRFindex=unique([midBZEADindex;midBZRFindex]);%%%% index in 245 clean cases
% midBZOtherindex=setdiff(linspace(1,245,245)',midBZEADRFindex);%%%% index in 245 clean cases
% 
% %%%%%%% Compare the parameters between the mid BZ EAD,RF cases with other cases
% pGNamidBZ=ranksum(cleanPara(midBZEADRFindex,2),cleanPara(midBZOtherindex,2));
% pGNaLmidBZ=ranksum(cleanPara(midBZEADRFindex,3),cleanPara(midBZOtherindex,3));
% pGtomidBZ=ranksum(cleanPara(midBZEADRFindex,4),cleanPara(midBZOtherindex,4));
% pGCaLmidBZ=ranksum(cleanPara(midBZEADRFindex,5),cleanPara(midBZOtherindex,5));
% pGKrmidBZ=ranksum(cleanPara(midBZEADRFindex,6),cleanPara(midBZOtherindex,6));
% pGKsmidBZ=ranksum(cleanPara(midBZEADRFindex,7),cleanPara(midBZOtherindex,7));
% pGK1midBZ=ranksum(cleanPara(midBZEADRFindex,8),cleanPara(midBZOtherindex,8));
% pGNCXmidBZ=ranksum(cleanPara(midBZEADRFindex,9),cleanPara(midBZOtherindex,9));
% pGNaKmidBZ=ranksum(cleanPara(midBZEADRFindex,10),cleanPara(midBZOtherindex,10));
% pJrelmidBZ=ranksum(cleanPara(midBZEADRFindex,11),cleanPara(midBZOtherindex,11));
% pJupmidBZ=ranksum(cleanPara(midBZEADRFindex,12),cleanPara(midBZOtherindex,12));
% 
% figure()
% subplot(1,3,1)
% C = [cleanPara(midBZEADRFindex,5);cleanPara(midBZOtherindex,5)];
% g = [repmat(1, [length(midBZEADRFindex), 1]) ;repmat(2, [length(midBZOtherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('G_C_a_L')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic BZ Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,3,2)
% C = [cleanPara(midBZEADRFindex,6);cleanPara(midBZOtherindex,6)];
% g = [repmat(1, [length(midBZEADRFindex), 1]) ;repmat(2, [length(midBZOtherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('G_K_r')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic BZ Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,3,3)
% C = [cleanPara(midBZEADRFindex,9);cleanPara(midBZOtherindex,9)];
% g = [repmat(1, [length(midBZEADRFindex), 1]) ;repmat(2, [length(midBZOtherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('G_N_C_X')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic BZ Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% 
% %%%%%% compare the biomarkers between the mid BZ EAD,RF cases with other cases
% pCaTmaxmidBZ=ranksum(cleanmidBZBiomarkers(midBZEADRFindex,11),cleanmidBZBiomarkers(midBZOtherindex,11));
% pCaTminmidBZ=ranksum(cleanmidBZBiomarkers(midBZEADRFindex,12),cleanmidBZBiomarkers(midBZOtherindex,12));
% 
% figure()
% subplot(1,2,1)
% C = [cleanmidBZBiomarkers(midBZEADRFindex,11);cleanmidBZBiomarkers(midBZOtherindex,11)];
% g = [repmat(1, [length(midBZEADRFindex), 1]) ;repmat(2, [length(midBZOtherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_a_x')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic BZ Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,2,2)
% C = [cleanmidBZBiomarkers(midBZEADRFindex,12);cleanmidBZBiomarkers(midBZOtherindex,12)];
% g = [repmat(1, [length(midBZEADRFindex), 1]) ;repmat(2, [length(midBZOtherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_i_n')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic BZ Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% %% plot all CaTmax and CaTmin of EAD vs nonEAD in one figure
% figure()
% subplot(1,8,1)
% C = [cleanmidBZBiomarkers(midBZEADRFindex,11);cleanmidBZBiomarkers(midBZOtherindex,11)];
% g = [repmat(1, [length(midBZEADRFindex), 1]) ;repmat(2, [length(midBZOtherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_a_x')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic BZ Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,8,2)
% C = [cleanmidBZBiomarkers(midBZEADRFindex,12);cleanmidBZBiomarkers(midBZOtherindex,12)];
% g = [repmat(1, [length(midBZEADRFindex), 1]) ;repmat(2, [length(midBZOtherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_i_n')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic BZ Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,8,3)
% C = [cleanmidRZ1Biomarkers(midRZ1EADRFindex,11);cleanmidRZ1Biomarkers(midRZ1Otherindex,11)];
% g = [repmat(1, [length(midRZ1EADRFindex), 1]) ;repmat(2, [length(midRZ1Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_a_x')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ1 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,8,4)
% C = [cleanmidRZ1Biomarkers(midRZ1EADRFindex,12);cleanmidRZ1Biomarkers(midRZ1Otherindex,12)];
% g = [repmat(1, [length(midRZ1EADRFindex), 1]) ;repmat(2, [length(midRZ1Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_i_n')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ1 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,8,5)
% C = [cleanepiRZ2Biomarkers(epiRZ2EADRFindex,11);cleanepiRZ2Biomarkers(epiRZ2Otherindex,11)];
% g = [repmat(1, [length(epiRZ2EADRFindex), 1]) ;repmat(2, [length(epiRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_a_x')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Epi')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,8,6)
% C = [cleanepiRZ2Biomarkers(epiRZ2EADRFindex,12);cleanepiRZ2Biomarkers(epiRZ2Otherindex,12)];
% g = [repmat(1, [length(epiRZ2EADRFindex), 1]) ;repmat(2, [length(epiRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_i_n')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Epi')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,8,7)
% C = [cleanmidRZ2Biomarkers(midRZ2EADRFindex,11);cleanmidRZ2Biomarkers(midRZ2Otherindex,11)];
% g = [repmat(1, [length(midRZ2EADRFindex), 1]) ;repmat(2, [length(midRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_a_x')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,8,8)
% C = [cleanmidRZ2Biomarkers(midRZ2EADRFindex,12);cleanmidRZ2Biomarkers(midRZ2Otherindex,12)];
% g = [repmat(1, [length(midRZ2EADRFindex), 1]) ;repmat(2, [length(midRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_i_n')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% 
% figure()
% 
% subplot(1,4,1)
% C = [cleanmidBZBiomarkers(midBZEADRFindex,12);cleanmidBZBiomarkers(midBZOtherindex,12)];
% g = [repmat(1, [length(midBZEADRFindex), 1]) ;repmat(2, [length(midBZOtherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_i_n')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic BZ Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% subplot(1,4,2)
% C = [cleanmidRZ1Biomarkers(midRZ1EADRFindex,12);cleanmidRZ1Biomarkers(midRZ1Otherindex,12)];
% g = [repmat(1, [length(midRZ1EADRFindex), 1]) ;repmat(2, [length(midRZ1Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_i_n')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ1 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% subplot(1,4,3)
% C = [cleanepiRZ2Biomarkers(epiRZ2EADRFindex,12);cleanepiRZ2Biomarkers(epiRZ2Otherindex,12)];
% g = [repmat(1, [length(epiRZ2EADRFindex), 1]) ;repmat(2, [length(epiRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_i_n')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Epi')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% subplot(1,4,4)
% C = [cleanmidRZ2Biomarkers(midRZ2EADRFindex,12);cleanmidRZ2Biomarkers(midRZ2Otherindex,12)];
% g = [repmat(1, [length(midRZ2EADRFindex), 1]) ;repmat(2, [length(midRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('CaT_m_i_n')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Mid')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% %% Check the APD of EAD models in epi and mid, since epi and endo APDs are calculable
% 
% endoBZBiomarkers=importdata('Biomarkers253EndoBZHegyiCaMKJrelSlow.mat');
% epiBZBiomarkers=importdata('Biomarkers253EpiBZHegyiCaMKJrelSlow.mat');
% cleanendoBZBiomarkers=endoBZBiomarkers(cleanindex,:);
% cleanepiBZBiomarkers=epiBZBiomarkers(cleanindex,:);
% 
% figure()
% subplot(1,6,1)
% C = [cleanendoBZBiomarkers(midBZEADRFindex,4);cleanendoBZBiomarkers(midBZOtherindex,4)];
% g = [repmat(1, [length(midBZEADRFindex), 1]) ;repmat(2, [length(midBZOtherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('APD')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic BZ Endo')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,6,2)
% C = [cleanepiBZBiomarkers(midBZEADRFindex,4);cleanepiBZBiomarkers(midBZOtherindex,4)];
% g = [repmat(1, [length(midBZEADRFindex), 1]) ;repmat(2, [length(midBZOtherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('APD')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic BZ Epi')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% cd ../SKPOMHFRZ
% endoRZ1Biomarkers=importdata('Biomarkers253EndoRZHegyiCaMKJrelSlow.mat');
% epiRZ1Biomarkers=importdata('Biomarkers253EpiRZHegyiCaMKJrelSlow.mat');
% cleanendoRZ1Biomarkers=endoRZ1Biomarkers(cleanindex,:);
% cleanepiRZ1Biomarkers=epiRZ1Biomarkers(cleanindex,:);
% 
% subplot(1,6,3)
% C = [cleanendoRZ1Biomarkers(midRZ1EADRFindex,4);cleanendoRZ1Biomarkers(midRZ1Otherindex,4)];
% g = [repmat(1, [length(midRZ1EADRFindex), 1]) ;repmat(2, [length(midRZ1Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('APD')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ1 Endo')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,6,4)
% C = [cleanepiRZ1Biomarkers(midRZ1EADRFindex,4);cleanepiRZ1Biomarkers(midRZ1Otherindex,4)];
% g = [repmat(1, [length(midRZ1EADRFindex), 1]) ;repmat(2, [length(midRZ1Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('APD')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ1 Epi')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% 
% cd ../SKPOMHFRZAll
% 
% endoRZ2Biomarkers=importdata('Biomarkers253EndoRZAllCaMKJrelSlow.mat');
% epiRZ2Biomarkers=importdata('Biomarkers253EpiRZAllCaMKJrelSlow.mat');
% cleanendoRZ2Biomarkers=endoRZ2Biomarkers(cleanindex,:);
% cleanepiRZ2Biomarkers=epiRZ2Biomarkers(cleanindex,:);
% 
% subplot(1,6,5)
% C = [cleanendoRZ2Biomarkers(midRZ2EADRFindex,4);cleanendoRZ2Biomarkers(midRZ2Otherindex,4)];
% g = [repmat(1, [length(midRZ2EADRFindex), 1]) ;repmat(2, [length(midRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('APD')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Endo')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% subplot(1,6,6)
% C = [cleanepiRZ2Biomarkers(midRZ2EADRFindex,4);cleanepiRZ2Biomarkers(midRZ2Otherindex,4)];
% g = [repmat(1, [length(midRZ2EADRFindex), 1]) ;repmat(2, [length(midRZ2Otherindex), 1])];
% bh=boxplot(C, g,'notch','on');
% set(bh,'linewidth',2);
% ylabel('APD')
% set(gca,'XTickLabel',{'EAD or RF' 'No EAD or RF'})
% title('Chronic RZ2 Epi')
% xtickangle(20)
% set(gca,'fontsize',12,'fontweight','bold');
% 
% cd ../SKPOMHFBZ
% 
% pAPDendoBZ=ranksum(cleanendoBZBiomarkers(midBZEADRFindex,4),cleanendoBZBiomarkers(midBZOtherindex,4));
% pAPDepiBZ=ranksum(cleanepiBZBiomarkers(midBZEADRFindex,4),cleanepiBZBiomarkers(midBZOtherindex,4));
% 
% pAPDendoRZ1=ranksum(cleanendoRZ1Biomarkers(midRZ1EADRFindex,4),cleanendoRZ1Biomarkers(midRZ1Otherindex,4));
% pAPDepiRZ1=ranksum(cleanepiRZ1Biomarkers(midRZ1EADRFindex,4),cleanepiRZ1Biomarkers(midRZ1Otherindex,4));
% 
% pAPDendoRZ2=ranksum(cleanendoRZ2Biomarkers(midRZ2EADRFindex,4),cleanendoRZ2Biomarkers(midRZ2Otherindex,4));
% pAPDepiRZ2=ranksum(cleanepiRZ2Biomarkers(midRZ2EADRFindex,4),cleanepiRZ2Biomarkers(midRZ2Otherindex,4));