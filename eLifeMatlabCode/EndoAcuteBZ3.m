%%%%%% This script is to simulate baseline or population of Type 3 acute stage
%%%%%% post infarction border zone cell electromechanics based on the ToR-ORd-Land model


clear
close all

mkdir AcuteBZ3endoPOM
    

X0 = getStartingState('m_endo');  %%%% 'm_epi' or 'm_mid' for the epicardial or midmyocardial variants
options = [];
beats = 500;
ignoreFirst = beats - 1;%%%;

% load parameters for varying conductances/fluxes
% Parameters=importdata('POM245.mat'); %%%% parameters of population of
% models calibrated by human experimental data


Parameters=[0 ones(1,11)]; %%%%%% baseline with index 0


for i=1:size(Parameters,1)
    index=Parameters(i,1);
    
    param.bcl = 800; %%%% pacing cycle length
    param.model = @model_ToRORd_LandCaMKSKJrelpKinetics;
    param.ko = 5;
    param.celltype=0;%%%%% %endo = 0, epi = 1, mid = 2
    
    param.INa_Multiplier=Parameters(i,2)*0.4;
    param.INaL_Multiplier=Parameters(i,3);
    param.Ito_Multiplier=Parameters(i,4)*0;
    param.ICaL_Multiplier=Parameters(i,5)*0.64;
    param.IKr_Multiplier=Parameters(i,6);
    param.IKs_Multiplier=Parameters(i,7);
    param.IK1_Multiplier=Parameters(i,8)*0.6;
    param.INaCa_Multiplier=Parameters(i,9);
    param.INaK_Multiplier=Parameters(i,10);
    param.Jrel_Multiplier=Parameters(i,11);
    param.Jup_Multiplier=Parameters(i,12);
    
    param.ICab_Multiplier=1.33;
    param.CaMKPhosRate_Multiplier=1.5;
    
    param.Jrelptau_Multiplier=6;
    
    [time, X] = modelRunnerCaMKSKJrelpKinetics1ms(X0, options, param, beats, ignoreFirst);
    currents = getCurrentsStructureCaMKSKJrelpKinetics(time, X, param, 0);
 
    filename=sprintf('%s%d%s%d%s','AcuteBZ3endoCL',param.bcl,'Model',index,'.mat');
    cd AcuteBZ3endoPOM
    save(filename, 'currents','X')
    cd ..
    
    i
    clear param
end
