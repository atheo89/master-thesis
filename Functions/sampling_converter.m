function [k] =  sampling_converter(input,patients,output)

    old_rate = 1/str2num(input(1:length(input)-2));
       
    new_rate = 1/str2num(output(1:length(output)-2));
    
    display(old_rate);
    
    display(new_rate);
    
    % Converts the import data by sampling rate [256 Hz] to [x Hz]
    
    for i = 1 : numel(patients)
       
        input_patients{i} = sprintf('Shared/%s/%s',input,patients{i});
        
        output_patients{i} = sprintf('Shared/%s/%s',output,patients{i});
    
        mkdir (output_patients{i});
        
        x{i} = dir(input_patients{i})
        
        counter = 1
        
        for j = 1 : size(x{i})
    
            if isempty(findstr(x{i}(j).name,'seizures')) && isempty(findstr(x{i}(j).name,'summary')) && isempty(findstr(x{i}(j).name,'chb')) == false
           
               input_files{i}{counter} = x{i}(j).name;
           
               counter = counter + 1;
               
            end
                     
        end
        
       % break;
    end
    
    for i = 1:numel(input_files)
      
        for j = 1:numel(input_files{i})
        
            input_file{i}{j} = sprintf('%s/%s',input_patients{i},input_files{i}{j});
            
            output_file{i}{j} = sprintf('%s/%s',output_patients{i},input_files{i}{j});
             
            [input_samples{i}{j}{1} input_samples{i}{j}{2}] = edfread(input_file{i}{j});
          
        %    break;
        
        end
        
       % break;
    end
    
     for i = 1:numel(input_files)
      
        for j = 1:numel(input_files{i})
    
            input_samples{i}{j}{2} = resample(input_samples{i}{j}{2}',1,new_rate/old_rate);
% break;
        end
% break;
     end
    
    
    k = input_samples;
   
    
    
    % Save the resampling data 
    
    for i = 1:numel(input_files)
      
        for j = 1:numel(input_files{i})
  
            output_file{i}{j} = sprintf('%s.mat',output_file{i}{j});
    
            example = matfile(output_file{i}{j},'Writable',true)
     
            example.data = input_samples{i}{j};      
 %break;
        end
  %break;
    end
   
    
    
end