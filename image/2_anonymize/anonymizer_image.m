clear all
clc
close all
%%
list = dir('image*.mat');
fid = fopen('original_index.dat','wt+');
formatSpec = '%s\n';

for i=1:length(list)
    C = strsplit(list(i).name,{'.','_'});
    new_number = sprintf('%05d',i);
    old_number = C{end-1};
    old_image_name = list(i).name;
    new_image_name = strcat(C{1:end-2},'_',new_number,'.mat');
    image_compare{i,1} = strcat('"',old_number,'"');
    image_compare{i,2} = strcat('"',new_number,'"');
    fprintf(fid,formatSpec, strcat(old_number,',',new_number));

    new_image_name = strcat('image_',new_number,'.mat');

    movefile(old_image_name, new_image_name);
end

fclose(fid);

Table1 = cell2table(image_compare,'VariableNames',{'new_index','original_index'});
writetable(Table1,'original_index.csv','QuoteStrings', true);


