%%%%%% This script is to simulate baseline or population of Type 2 chronic stage
%%%%%% post infarction remote zone cell electromechanics based on the ToR-ORd-Land model

clear
close all

mkdir ChronicRZ2endoPOM
    

X0 = getStartingState('m_endo'); %%%% 'm_epi' or 'm_mid' for the epicardial or midmyocardial variants
options = [];
beats = 500;
ignoreFirst = beats - 1;%%%;

% load parameters for varying conductances/fluxes
% Parameters=importdata('POM245.mat'); %%%% parameters of population of
% models calibrated by human experimental data


Parameters=[0 ones(1,11)]; %%%%%% baseline with index 0


for i=1:size(Parameters,1)
    index=Parameters(i,1);
    
    param.bcl = 800;%%%% pacing cycle length
    param.model = @model_ToRORd_LandCaMKSKJrelpKinetics;
    param.ko = 5;
    param.celltype=0;%%%%% %endo = 0, epi = 1, mid = 2
    
    param.INa_Multiplier=Parameters(i,2)*0.43;
    param.INaL_Multiplier=Parameters(i,3)*2;
    param.Ito_Multiplier=Parameters(i,4)*0.6;
    param.ICaL_Multiplier=Parameters(i,5);
    param.IKr_Multiplier=Parameters(i,6)*0.6;
    param.IKs_Multiplier=Parameters(i,7)*0.4;
    param.IK1_Multiplier=Parameters(i,8)*0.6;
    param.INaCa_Multiplier=Parameters(i,9);
    param.INaK_Multiplier=Parameters(i,10)*0.6;
    param.Jrel_Multiplier=Parameters(i,11);
    param.Jup_Multiplier=Parameters(i,12)*0.3;
    
    param.IKCa_Multiplier=3.75;
    param.ICaCl_Multiplier=1.25;
    
    param.CaMKPhosRate_Multiplier=1.5;
    param.Jrelptau_Multiplier=6;
    
    [time, X] = modelRunnerCaMKSKJrelpKinetics1ms(X0, options, param, beats, ignoreFirst);
    currents = getCurrentsStructureCaMKSKJrelpKinetics(time, X, param, 0);
 
    filename=sprintf('%s%d%s%d%s','ChronicRZ2endoCL',param.bcl,'Model',index,'.mat');
    cd ChronicRZ2endoPOM
    save(filename, 'currents','X')
    cd ..
    
    i
    clear param
end

