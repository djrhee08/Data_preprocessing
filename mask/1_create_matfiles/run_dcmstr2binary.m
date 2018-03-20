clear all
clc
close all
%%
list_temp = dir('H&N_DATASET');
list_temp = list_temp(~ismember({list_temp.name},{'.','..'}));
index = 1;
for i=1:length(list_temp)
    if list_temp(i).isdir == 1
        list(index,1) = list_temp(i);
        index = index + 1;
    end
end
%% Cord
string_to_contain = ["brain"];
string_not_to_contain = ["stem","exp","+","0.5","aryte","hot","mm","cm","avoid","prv","ptv","pv","off"];

% string_to_contain = ["Cord"];
% string_not_to_contain = ["exp","+","0.5","aryte","hot","mm","cm","avoid","prv","ptv","pv","off"];
% %% Brainstem
% string_to_contain2 = ["Brainstem"];
% string_not_to_contain2 = ["exp","+","0.5","aryte","hot","mm","cm","avoid","prv","ptv","pv","off"];
% %% Cochlea
% string_to_contain3 = ["Cochlea"];
% string_not_to_contain3 = ["exp","+","0.5","aryte","hot","mm","cm","avoid","prv","ptv","pv","off"];
% %% Esophagus
% string_to_contain4 = ["Esophagus"];
% string_not_to_contain4 = ["exp","+","0.5","aryte","hot","mm","cm","avoid","prv","ptv","pv","off"];
% %% Mandible
% string_to_contain5 = ["Mandible"];
% string_not_to_contain5 = ["exp","+","0.5","aryte","hot","mm","cm","avoid","prv","ptv","pv","off"];
% %% Chiasm
% string_to_contain6 = ["Chiasm"];
% string_not_to_contain6 = ["exp","+","0.5","aryte","hot","mm","cm","avoid","prv","ptv","pv","off"];
% %% Eye, lenses, optic nerves, parotids are all LR pairs. Think about how to do these.
% string_to_contain = ["eye"];
% string_not_to_contain = ["+"];% ["lens","len","exp","+","0.5","aryte","hot","mm","cm","avoid","prv","ptv","pv","off"];
% %% Lens
% string_to_contain2 = ["lens"];
% string_not_to_contain2 = ["scalene","exp","+","0.5","aryte","hot","mm","cm","avoid","prv","ptv","pv","off"];
% %% parotids
% string_to_contain3 = ["parotid"];
% string_not_to_contain3 = ["exp","+","0.5","aryte","hot","mm","cm","avoid","prv","ptv","pv","off"];
% %% optical nerves
% string_to_contain4 = ["nerve"];
% string_not_to_contain4 = ["exp","+","0.5","aryte","hot","mm","cm","avoid","prv","ptv","pv","off"];
%%
for i=1:551%length(list)%552:length(list)
    if list(i).isdir == 1
        tic
        % use v2 to save structures separately
        dcmstr2binary_v2(list(i).folder, list(i).name, 'Brain', string_to_contain,string_not_to_contain);
        %dcmstr2binary_v2(list(i).folder, list(i).name, 'Lens', string_to_contain2,string_not_to_contain2);
        %dcmstr2binary_v2(list(i).folder, list(i).name, 'Parotids', string_to_contain3,string_not_to_contain3);
        %dcmstr2binary_v2(list(i).folder, list(i).name, 'Optical_Nerves', string_to_contain4,string_not_to_contain4);
        %dcmstr2binary_v2(list(i).folder, list(i).name, 'Mandible', string_to_contain5,string_not_to_contain5);
        %dcmstr2binary_v2(list(i).folder, list(i).name, 'Chiasm', string_to_contain6,string_not_to_contain6);
        disp(i);
        toc
    end
end

% Cord # 514 was wrong (938365)
% Cord # 571 was wrong (MDA020)
