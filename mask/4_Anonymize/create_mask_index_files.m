function [] = create_mask_index_files()

    % create mask_index & image_index files
    fid1 = fopen('mask_index.dat','wt+');
    formatSpec1 = '%s\n';
    
    fid2 = fopen('image_index.dat','wt+');
    formatSpec2 = '%s\n';
    
    list = dir('*.mat');
    for i=1:length(list)
        fprintf(fid1,formatSpec1, list(i).name);
        
        fname = strtok(list(i).name,'.'); % filename without .mat
        pos = find(fname == '_', 1, 'last');
        mask_name = fname(1:pos);
        mask_number = fname(pos+1:end);
        image_name = strcat('image_',mask_number,'.mat');
        
        fprintf(fid2,formatSpec2,image_name);
    end
    
    
    
    
    
end

