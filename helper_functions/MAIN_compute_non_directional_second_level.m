function MAIN_compute_non_directional_second_level()
% This function computes second levele results 

results_dir = fullfile('..','results');
ffldrs = findFilesBVQX(results_dir,'results_VocalDataSet_FFX_ND*',...
    struct('dirs',1));
fprintf('The following results folders were found:\n'); 
for i = 1:length(ffldrs)
    [pn,fn] = fileparts(ffldrs{i})
    fprintf('[%d]\t%s\n',i,fn);
end
fprintf('enter number of results folder to compute second level on\n'); 
foldernum = input('what num? ');
analysisfolder = ffldrs{foldernum}; 
secondlevelresultsfolder = fullfile(analysisfolder,'2nd_level');
mkdir(secondlevelresultsfolder); 

subsToExtract = subsUsedGet(20); % 150 / 20 for vocal data set 
fold = 1; 
numMaps = 1e2;
computeFFXresults(subsToExtract,fold,secondlevelresultsfolder,numMaps)
end
