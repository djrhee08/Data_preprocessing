clear all
clc
close all
%%
list = dir('H&N_DATASET/MDA*');
%list = list(~ismember({list.name},{'.','..'}));

for i=1:length(list)
    if list(i).isdir == 1
        tic
        dicom2mat(list(i).folder, list(i).name);
        disp(i);
        toc
    end
end
