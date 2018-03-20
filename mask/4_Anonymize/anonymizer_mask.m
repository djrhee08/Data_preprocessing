clear all
clc
close all
%% rename mask files
list = dir('*.mat');
%% read index file ('data_index.dat')
fid = fopen('original_index.dat','r+');
formatSpec = '%s\n';
temp = textscan(fid, '%s', 'Delimiter', sprintf('\n'));
index_array = temp{1};
for i=1:length(index_array)
    index = strsplit(index_array{i,1}, {','});
    old_index{i,1} = index{1};
    new_index{i,1} = index{2};
end
old_index = string(old_index);
new_index = string(new_index);
fclose(fid);
%%
for i=1:length(list)
    fname = strtok(list(i).name,'.'); % filename without .mat
    pos = find(fname == '_', 1, 'last');
    mask_name = fname(1:pos);       %fname before MRN
    mask_number = fname(pos+1:end); %patient MRN
    mask_name_full = list(i).name;  %full filename
    
    if mask_number(1:3) ~= 'MDA' %MDA file already anonymized
        % Matching MRN with anonymized index
        index_oldnum = find(old_index==mask_number);
        new_number = new_index(index_oldnum);
    
        new_mask_name_full = strcat(mask_name,new_number,'.mat');

        disp(strcat(mask_name_full, ', ', new_mask_name_full));

        % Change the filename
        movefile(old_mask_name, char(new_mask_name_full));
    end
end

% Create index files
create_mask_index_files()


