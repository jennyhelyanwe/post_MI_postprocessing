%%%%%% This script is to simulate baseline or population of normal
%%%%%% ventricular myocyte electromechanics using the ToR-ORd-Land model.

clear
close all

mkdir NZendoPOM
    
X0 = getStartingState('m_endo'); %%%% 
options = [];
beats = 500;
ignoreFirst = beats - 1;%%%;

% load parameters for varying conductances/fluxes
% Parameters=importdata('POM245.mat'); %%%% parameters of population of
% models calibrated by experimental data

Parameters=[0 ones(1,11)]; %%%%%% baseline model parameter with index 0


for i=1:size(Parameters,1)
    index=Parameters(i,1);
    
    param.bcl = 800;%%%% pacing cycle length
    param.model = @model_ToRORd_LandCaMKSKJrelpKinetics;
    param.ko = 5;
    
    param.INa_Multiplier=Parameters(i,2);
    param.INaL_Multiplier=Parameters(i,3);
    param.Ito_Multiplier=Parameters(i,4);
    param.ICaL_Multiplier=Parameters(i,5);
    param.IKr_Multiplier=Parameters(i,6);
    param.IKs_Multiplier=Parameters(i,7);
    param.IK1_Multiplier=Parameters(i,8);
    param.INaCa_Multiplier=Parameters(i,9);
    param.INaK_Multiplier=Parameters(i,10);
    param.Jrel_Multiplier=Parameters(i,11);
    param.Jup_Multiplier=Parameters(i,12);
    
    [time, X] = modelRunnerCaMKSKJrelpKinetics1ms(X0, options, param, beats, ignoreFirst);
    currents = getCurrentsStructureCaMKSKJrelpKinetics(time, X, param, 0);
 
    filename=sprintf('%s%d%s%d%s','NZendoCL',param.bcl,'Model',index,'.mat');
    cd NZendoPOM
    save(filename, 'currents','X')
    cd ..
    
    i
    clear param
end

