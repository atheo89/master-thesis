%% LOAD DATA
% 
read_data('256Hz');
Subject01 = sampling_converter('256Hz',{'chb16'},'32Hz');
Subject01 = sampling_converter('256Hz',{'chb16'},'128Hz'); 

%% INITIALIZE INTEREST CHANNEL
trial = Subject01{1,1}{1,3}{1,2};
%Chb01_02 normal/inter Ictal States
%normal =trial(68000:115200,:);
%Chb01_03 Ictal State
 ictal=trial(95950:97100,:);
 preictal=trial(94799:95950,:);
 normal = trial(1:1151,:);
% %Chb01_03 Pre Ictal State
% preictal=trial(60000:95800,:);
%% PERFORM DISCRETE WAVELET TRANFORM

%   [Lo_D,Hi_D] = wfilters('bior3.5','d');
%   [finalTrial,D]= dwt(trial(:,1),Lo_D,Hi_D);




 %% INITIALIZE DATA AND SEPARATE THE REGIONS OF [LeftTemporalLobe, LeftParasagittalLobe, RightParasagittalLobe, RightTemporalLobe, Midle,PenetratingLine  ]
 
 LeftTemporalLobe = trial(:,1:4);
 LeftParasagittalLobe = trial(:,5:8);
 RightParasagittalLobe = trial(:,9:12);
 RightTemporalLobe = trial(:,13:16);
 Midle = trial(:,17:18);
 PenetratingLine = trial(:,19:23);
%  


%% CONVERTER SAMPLES TO SEC
 Fs = 32; 
 t=[1/Fs:1/Fs:length(trial(:,1))/Fs];

 
 %% DISPLAY REGIONS AND CHANNELS 
  
%   for i = 1 : size(trial,2)
%      figure,
%      plot(t, trial(:,i));
%      title(Subject01{1,1}{1,1}{1,1}.label(1,i));
%      %take the epoch with seizure xlim([2996 3036])
%     % xlim([2451 2476]);
%      ylabel('Amplitude (ÏV)')
%      xlabel('time (sec)')
%         break;
%   end

%     figure,
%     subplot(2,1,1),plot(t,LeftTemporalLobe);
%     title('LeftTemporalLobe by 4 channels FP1F7,F7T7,T7P7,P7O1');
%     take the epoch with seizure xlim([2996 3036])
%    xlim([2996 3036]);
%     ylabel('Amplitude (ÏV)')
%     xlabel('time (sec)') 
%     
%     subplot(2,1,2),plot(t,RightTemporalLobe);
%     title('RightTemporalLobe by 4 channels FP2F8,F8T8,T8P8,P8O2');
%     take the epoch with seizure xlim([2996 3036])
%    xlim([2996 3036]);
%     ylabel('Amplitude (ÏV)')
%     xlabel('time (sec)')
%     
%     
%     figure, subplot(3,1,1),plot(t,LeftParasagittalLobe);
%     title('LeftParasagittalLobe by 4 channels FP1F3,F3C3,C3P3,P3O1');
%     take the epoch with seizure xlim([2996 3036])
%    xlim([2996 3036]);
%     ylabel('Amplitude (ÏV)')
%     xlabel('time (sec)')
%    
%     subplot(3,1,2),plot(t,Midle);
%     title('Midle by 2 channels FZCZ, CZPZ');
%     take the epoch with seizure xlim([2996 3036])
%    xlim([2996 3036]);
%     ylabel('Amplitude (ÏV)')
%     xlabel('time (sec)')
%     
%     subplot(3,1,3),plot(t,RightParasagittalLobe);
%     title('RightParasagittalLobe by 4 channels FP2F4,F4C4,C4P4,P4O2');
%     take the epoch with seizure xlim([2996 3036])
%    xlim([2996 3036]);
%     ylabel('Amplitude (ÏV)')
%     xlabel('time (sec)')
%     
%     figure,plot(t,PenetratingLine);
%     title('sagittal by 4 channels P7T7, T7FT9, FT9FT10,FT10T8,T8P8');
%     take the epoch with seizure xlim([2996 3036])
%    xlim([2996 3036]);
%     ylabel('Amplitude (ÏV)')
%     xlabel('time (sec)')
    

%%Pre Ictal - Ictal
% preictalState=trial(10400:15400,:);
% IctalState=trial(15400:16000,:);
%normal = trial(100000:115000,:);
 

% for i = 1 : 23
%     
%     channel_1 = preictal(:,i);
%     
%     for j = 1 : 23
%     
%         channel_2 = preictal(:,j);
%      
%         pxx2 = pwelch(channel_1,1000,300,600);
%          
%         MeanValue2 = mean(pxx2);
%  
%         pxx3 = pwelch(channel_2,1000,300,600);
%  
%         MeanValue3 = mean(pxx3);
%  
%         cxs=mscohere (pxx2, pxx3);
%         
%         Coherence_Ictal(i,j) = mean(cxs);   
%         
%      
%     end
%     
% end
%  for i = 1 : 23
%     
%     channel_1 = IctalState(:,i);
%     
%     for j = 1 : 23
%     
%         channel_2 = IctalState(:,j);
%      
%         pxx2 = pwelch(channel_1,1000,300,600);
%          
%         MeanValue2 = mean(pxx2);
%  
%         pxx3 = pwelch(channel_2,1000,300,600);
%  
%         MeanValue3 = mean(pxx3);
%  
%         cxs=mscohere (pxx2, pxx3);
%         
%         Coherence_Ictal(i,j) = mean(cxs);   
%         
%      
%     end
%     
%  end

 %% CALCULATE COHERENCE AMONG REGIONS [LeftTemporalLobe, LeftParasagittalLobe, RightParasagittalLobe, RightTemporalLobe, Midle,PenetratingLine  ]
  % Near to 1 = coherence vs  near to 0 = non-coherence, use trial array to
  % display all channels.  trial=Subject01{1, 1}{1, 3}{1, 2};
  
%  [Coherence_RTL, Coherence_RPL, Coherence_Midle, Coherence_LTL, Coherence_LPL, Coherence_PL ] = Coherence( RightTemporalLobe, RightParasagittalLobe, Midle, LeftTemporalLobe, LeftParasagittalLobe, PenetratingLine);
%  
% figure; subplot(3,2,1), bar(Coherence_LTL,'DisplayName','Coherence_LTL'), title('Coherence of Left Temporal Lobe');
% subplot(3,2,2),bar(Coherence_RTL,'DisplayName','Coherence_RTL'), title('Coherence of Right Temporal Lobe');
% subplot(3,2,3),bar(Coherence_LTL,'DisplayName','Coherence_LPL'), title('Coherence of Left Parasagittal Lobe');
% subplot(3,2,4),bar(Coherence_RPL,'DisplayName','Coherence_RPL'), title('Coherence of Right Parasagittal Lobe');
% subplot(3,2,5),bar(Coherence_Midle,'DisplayName','Coherence_Midle'), title('Coherence of Midle');
% subplot(3,2,6),bar(Coherence_PL,'DisplayName','Coherence_PL'), title('Coherence of Penetrate Line');


%% CALCULATE AND DISPLAY [ Gamma, Beta, Alpha, Theta, Delta bands ]


%   [Gamma, Beta, Alpha, Theta, Delta]=waveBands(ictal);
%  [Gamma2, Beta2, Alpha2, Theta2, Delta2]=waveBands(preictal);
%  [Gamma3, Beta3, Alpha3, Theta3, Delta3]=waveBands(normal);
%  
%  Gamma3 = Gamma3 .*1.15
%  Gamma2 = Gamma2 .*0.85
%  Delta3 = Delta3 .*1.15
%  Delta2 = Delta2 .*0.85
 
% 
% 
%% CALCULATE RATIO ‚:·= beta/alpha for Right Temporal Lobe
 
% ratio=Beta./Alpha;
% figure, plot(ratio); title('RATIO ‚:·= beta/alpha for Right Temporal Lobe');

%% CALCULATE BRAIN LOAD INDEX (BLI) BLI= Ë(FZCZ)/·(CZPZ) 
 %ictal
%  [Thetabl]=waveBands(trial(95950:97100,17));
%  [Alphabl]=waveBands(trial(95950:97100,18));
%   
% % trial(95950:97100,17:18);
%  BLI = Thetabl./Alphabl;
%  %figure, stem(t,BLI); title('Brain load index (BLI) BLI= Ë(FZCZ)/·(CZPZ) '); %xlim([2996 3036])
% %  
%   
% %preictal
%  [Thetabl2]=waveBands(trial(94799:95950,17));
%  [Alphabl2]=waveBands(trial(94799:95950,18));
%   
% % trial(95950:97100,17:18);
%  BLI2 = Thetabl2./Alphabl2;

%% CALCULATE Hjorth parameters (linear method)

[ACTIVITYI, MOBILITYI, COMPLEXITYI] = hjorth(ictal,1);
[ACTIVITYp, MOBILITYp, COMPLEXITYp] = hjorth(preictal,1);

[ACTIVITYn, MOBILITYn, COMPLEXITYn] = hjorth(normal,1);

figure;
subplot(3,3,1), plot(COMPLEXITYn,'DisplayName','COMPLEXITY'); title('Normal Complexity');%xlim([2996 3036]);
subplot(3,3,2), plot(COMPLEXITYp,'DisplayName','COMPLEXITY'); title('Pre Ictal Complexity');%xlim([2996 3036]);
subplot(3,3,3), plot(COMPLEXITYI,'DisplayName','COMPLEXITY'); title('Ictal Complexity');%xlim([2996 3036]);
subplot(3,3,4),plot(MOBILITYn,'DisplayName','MOBILITY'); title('Normal Mobility');%xlim([2996 3036]);
subplot(3,3,5),plot(MOBILITYp,'DisplayName','MOBILITY'); title('Pre Ictal Mobility');%xlim([2996 3036]);
subplot(3,3,6),plot(MOBILITYI,'DisplayName','MOBILITY'); title('Ictal Mobility');%xlim([2996 3036]);
subplot(3,3,7),plot(ACTIVITYn,'DisplayName','ACTIVITY'); title('Normal Activity');%xlim([2996 3036]);
subplot(3,3,8),plot(ACTIVITYp,'DisplayName','ACTIVITY'); title('Pre Ictal Activity');%xlim([2996 3036]);
subplot(3,3,9),plot(ACTIVITYI,'DisplayName','ACTIVITY'); title('Ictal Activity');%xlim([2996 3036]);








%% CALCULATE AND DISPLAY ENTROPIES


%%Shannon entropy

% h = 1; % for half window size of 3
% 
% for i = 1 : size(normal,2)
% 
%     s2 = normal(:,i);
% 
%     N = size(s2,1);  
%     
%     for j = 1 : N
%   
%         o(i,j) = wentropy(s2(max(1,j - h) : min(N,j + h)),'shannon');
%    
%     end
%     
% end
% 
% ShannonEntropyI = o';
% % 
% % 
% %   
% %Log energy entropy
%  
%  h = 1; 
% 
% for i = 1 : size(normal,2)
% 
%     s2 = normal(:,i);
% 
%     N = size(s2,1);  
%     
%     for j = 1 : N
%   
%         En(i,j) = wentropy(s2(max(1,j - h) : min(N,j + h)),'log energy');
%    
%     end
%     
% end
% 
% LogEnergyEntropyI = En';
% figure,
% subplot(2,1,1), plot(ShannonEntropyI,'DisplayName','ShannonEntropy'); title('Shannon Entropy');% xlim([2996 3036]);
% subplot(2,1,2),plot(LogEnergyEntropyI,'DisplayName','LogEnergyEntropy'); title('LogEnergy Entropy');% xlim([2996 3036]);

% for i = 1 : size(ShannonEntropy,2) 
%       
%     figure,
%     plot(t,ShannonEntropy(:,i));
%     title(Subject01{1,1}{1,1}{1,1}.label(1,i));
%     %take the epoch with seizure xlim([2996 3036])
%     %xlim([2996 3036]);
%     ylabel('ShannonEntropy Values')
%     xlabel('time in sec')
%     
%     
%  end
% 
% for i = 1 : size(LogEnergyEntropy,2) 
%       
%     figure,
%     plot(t,LogEnergyEntropy(:,i));
%     title(Subject01{1,1}{1,1}{1,1}.label(1,i));
%     %take the epoch with seizure xlim([2996 3036])
%     %xlim([2996 3036]);
%     ylabel('Log Energy Entropy Values')
%     xlabel('time in sec')
%     
%     
%  end 


%%

%Calculate the permutation entropy for each channel

% h = 1;                      % for half window size of 3
% 
% N = size(s1,2);              % length of the signal
% 
% os = ones(1, N);             % array for output
% for i = 1 : N
%  
%   os(i) = petropy(patient1_32{1, 1}{1, 3}{1, 2}(:,i),3,1,'order');
%   
% end
% 
% PermutationEntropy = os;

 


 

% % Compute the average power in the input signal vector Signal Energy 
% % 
% % h = 1;
% % 
% % for i = 1 : size(patient1_32{1, 1}{1, 3}{1, 2},2)
% % 
% %     s2 = patient1_32{1, 1}{1, 3}{1, 2}(:,i);
% % 
% %     N = size(s2,1);  
% %     
% %     for j = 1 : N
% %   
% %         powerband(i,j) = bandpower(s2(max(1,j - h) : min(N,j + h)));
% %    
% %     end
% %     
% % end
% signalPower =powerband';



%% Compute the predictor coefficients, estimated signal, prediction error and autocorrelation sequence of the prediction error.

% a = lpc(s2,3);
% est_x = filter([0 -a(2:end)],1,s2);
% e = s2-est_x;
% [acs,lags] = xcorr(e,'coeff');
% 
% 
% % Compare the predicted signal to the original signal.
% figure,
% plot(1:97,s2(4001:4097),1:97,est_x(4001:4097),'--'), grid
% title 'Original Signal vs. LPC Estimate'
% xlabel 'Sample number', ylabel 'Amplitude'
% legend('Original signal','LPC estimate')




% %Calculate the Statistical Moments(Mean, Variance, Skewness and Kurtosis)
% % https://www.mathworks.com/help/matlab/ref/timeseries.mean.html
% % https://www.mathworks.com/help/matlab/ref/timeseries.var.html
% % https://www.mathworks.com/help/stats/skewness.html
% % https://www.mathworks.com/help/stats/kurtosis.html


% %Calculate the Autoregressive Modeling (linear method)
% %https://www.mathworks.com/help/signal/examples/linear-prediction-and-autoregressive-modeling.html

% %Calculate the Relative Power
 %[RelativePower] = Compute_RP(s1,32,[1 40],[1 4;4 8;8 13;13 30;30 40]);
% %https://www.mathworks.com/help/comm/ref/comm.ccdf.getpercentilerelativepower.html
% 
 

 
 
% %Calculate the lyapinov exponent (non linear method)



%CALCULATE COHERENCE OF ALL TRIALS AND CHANNELS

% for  current_trial = 1 : 16 % size(patient1_32{1,1},2) 
% 
% % Initialize values of interest
% 
%  trial=patient1_32{1, 1}{1, current_trial}{1, 2};
%   
%  for i = 1 : 23
%     
%     channel_1 = trial(:,i);
%     
%     for j = 1 : 23
%     
%         channel_2 = trial(:,j);
%      
%         pxx2 = pwelch(channel_1,1000,300,600);
%          
%         MeanValue2 = mean(pxx2);
%  
%         pxx3 = pwelch(channel_2,1000,300,600);
%  
%         MeanValue3 = mean(pxx3);
%  
%         cxs=mscohere (pxx2, pxx3);
%         
%         Coherence(current_trial,i,j) = mean(cxs);   
%         
%         message = sprintf('* Current Trial : %d Channels : %d,%d | Coherence: %d'  ,current_trial,i,j, Coherence(current_trial,i,j));
%         
%         disp(message);
%      
%     end
%     
%  end
%  
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
