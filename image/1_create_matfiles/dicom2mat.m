function [] = dicom2mat(rootdir, dirname)
     %% Extract useful data from DICOM image files
    % Directories are expected to be 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ?dcm2binary.m (in the same directory with rootdir)
    % ?InPolygon-MEX
    %   ?
    % ?rootdir
    %   ?dirname1
    %   ?dirname2
    %   ?dirname3
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    addpath('InPolygon-MEX'); %
    
    rootdir = strcat(rootdir,'\',dirname);
    list = dir(strcat(rootdir,'\*.dcm')); 

    for i = 1:length(list)
        info_temp = dicominfo(strcat(list(i).folder,'\',list(i).name),'UseVRHeuristic',false);
        if isfield(info_temp,'Modality') == 1
            if strcmp(info_temp.Modality,'CT') == 1
                info = info_temp;
                img(info.InstanceNumber,:,:) = dicomread(strcat(rootdir,'\',list(i).name));
                img_pos(info.InstanceNumber,:) = info.ImagePositionPatient;
            end
        end
    end    

    % Apply Slope and intercept to dicom image
    if isfield(info,'RescaleSlope') == 1
        slope = info.RescaleSlope;
    else
        slope = 1;
    end

    if isfield(info,'RescaleIntercept') == 1
        intercept = info.RescaleIntercept;
    else
        intercept = 0;
    end
    
    img = img.*slope + intercept;

    img_orientation = info.ImageOrientationPatient;
    img_pixsize = info.PixelSpacing;
    img_pixsize = [img_pixsize;1]';
    img_pos_temp = img_pos(1,:);
    img_pos_temp(3) = 0;
    img_size = [info.Rows, info.Columns];
    
    %% Save the data
    save(strcat('image_',dirname,'.mat'),'img');
end

