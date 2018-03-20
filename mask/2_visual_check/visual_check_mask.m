clear all
clc
close all
%%
fname = 'Brain in txt fld_mask_819128.mat';
load(fname);
mask = mask.data;
dim = size(mask);
num_slice = dim(1);

figure;
for i=1:num_slice
    mask_slice = squeeze(mask(i,:,:));
    if sum(mask_slice(:)) ~= 0
        imagesc(mask_slice)
        colormap gray
        pause(0.3)
    end
end