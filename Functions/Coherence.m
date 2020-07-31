function [ Coherence_RTL, Coherence_RPL, Coherence_Midle, Coherence_LTL, Coherence_LPL, Coherence_PL] = Coherence( RightTemporalLobe, RightParasagittalLobe, Midle, LeftTemporalLobe, LeftParasagittalLobe, PenetratingLine)

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 for i = 1 : 4
    
    channel_1 = RightTemporalLobe(:,i);
    
    for j = 1 : 4
    
        channel_2 = RightTemporalLobe(:,j);
     
        pxx2 = pwelch(channel_1,1000,300,600);
         
        MeanValue2 = mean(pxx2);
 
        pxx3 = pwelch(channel_2,1000,300,600);
 
        MeanValue3 = mean(pxx3);
 
        cxs=mscohere (pxx2, pxx3);
        
        Coherence_RTL(i,j) = mean(cxs);   
        
     
    end
    
 end
 
for i = 1 : 4
    
    channel_1 = RightParasagittalLobe(:,i);
    
    for j = 1 : 4
    
        channel_2 = RightParasagittalLobe(:,j);
     
        pxx2 = pwelch(channel_1,1000,300,600);
         
        MeanValue2 = mean(pxx2);
 
        pxx3 = pwelch(channel_2,1000,300,600);
 
        MeanValue3 = mean(pxx3);
 
        cxs=mscohere (pxx2, pxx3);
        
        Coherence_RPL(i,j) = mean(cxs);   
        
     
    end
    
end

for i = 1 : 2
    
    channel_1 = Midle(:,i);
    
    for j = 1 : 2
    
        channel_2 = Midle(:,j);
     
        pxx2 = pwelch(channel_1,1000,300,600);
         
        MeanValue2 = mean(pxx2);
 
        pxx3 = pwelch(channel_2,1000,300,600);
 
        MeanValue3 = mean(pxx3);
 
        cxs=mscohere (pxx2, pxx3);
        
        Coherence_Midle(i,j) = mean(cxs);   
        
     
    end
    
 end

 for i = 1 : 4
    
    channel_1 = LeftTemporalLobe(:,i);
    
    for j = 1 : 4
    
        channel_2 = LeftTemporalLobe(:,j);
     
        pxx2 = pwelch(channel_1,1000,300,600);
         
        MeanValue2 = mean(pxx2);
 
        pxx3 = pwelch(channel_2,1000,300,600);
 
        MeanValue3 = mean(pxx3);
 
        cxs=mscohere (pxx2, pxx3);
        
        Coherence_LTL(i,j) = mean(cxs);   
        
     
    end
    
 end

for i = 1 : 4
    
    channel_1 = LeftParasagittalLobe(:,i);
    
    for j = 1 : 4
    
        channel_2 = LeftParasagittalLobe(:,j);
     
        pxx2 = pwelch(channel_1,1000,300,600);
         
        MeanValue2 = mean(pxx2);
 
        pxx3 = pwelch(channel_2,1000,300,600);
 
        MeanValue3 = mean(pxx3);
 
        cxs=mscohere (pxx2, pxx3);
        
        Coherence_LPL(i,j) = mean(cxs);   
        
     
    end
    
end


for i = 1 : 4
    
    channel_1 = PenetratingLine(:,i);
    
    for j = 1 : 4
    
        channel_2 = PenetratingLine(:,j);
     
        pxx2 = pwelch(channel_1,1000,300,600);
         
        MeanValue2 = mean(pxx2);
 
        pxx3 = pwelch(channel_2,1000,300,600);
 
        MeanValue3 = mean(pxx3);
 
        cxs=mscohere (pxx2, pxx3);
        
        Coherence_PL(i,j) = mean(cxs);   
        
     
    end
    
 end

end

