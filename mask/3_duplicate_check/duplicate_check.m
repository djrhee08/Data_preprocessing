clear all
clc
close all
%%
list = dir('*.mat');

for i=1:length(list)
    name_parse = strsplit(list(i).name,'.');
    mrn = strsplit(name_parse{1},'_');
    mrn = mrn{end};
    mrn_list{i,1} = mrn;
end

for i=1:length(mrn_list)
    now = mrn_list{i};
    for j=i+1:length(mrn_list)
        if strcmpi(now,mrn_list{j}) == 1
            disp('Warning!!! ---- Duplicate structures for a same patient!!')
            disp(strcat(list(i).name,',',list(j).name))
        end
    end
end

%% Compare two structures
% file1 = 'Mandible1_mask_711560.mat';
% file2 = 'Mandible_mask_711560.mat';
% 
% amask = load(file1);
% amask = amask.mask.data;
% bmask = load(file2);
% bmask = bmask.mask.data;
% 
% c = amask - bmask;
% csum = sum(c(:));
% if amask == bmask
%     disp('okay');
% end
% 
% sz = size(amask);
% 
% figure;
% for i=1:sz(1)
%     k1 = squeeze(bmask(i,:,:));
%     k2 = squeeze(amask(i,:,:));
%     subplot(1,2,1)
%     imagesc(k1);colormap gray;
%     subplot(1,2,2)
%     imagesc(k2);colormap gray;
%     pause(0.2)
%     i
% end