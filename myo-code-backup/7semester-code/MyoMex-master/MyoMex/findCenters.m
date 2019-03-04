function [Centers,distToCenters] = findCenters(name,group)

if group == 1
    thePath1 = strcat('Data/Group 1/',name,'/Test 1');
    thePath3 = strcat('Data/Group 1/',name,'/Test 3');
    thePath4 = strcat('Data/Group 1/',name,'/Test 4');
else 
    thePath1 = strcat('Data/Group 2/',name,'/Test 1');
    thePath3 = strcat('Data/Group 2/',name,'/Test 3');
    thePath4 = strcat('Data/Group 2/',name,'/Test 4');
end

addpath(thePath1);
[EmgExt,EmgFis,EmgFle,EmgRad,EmgStr,EmgUln,EmgRes] = getEmg();
[~,CExt,sumExt] = kmeans(EmgExt,1);
[~,CFle,sumFle] = kmeans(EmgFle,1);
[~,CRad,sumRad] = kmeans(EmgRad,1);
[~,CStr,sumStr] = kmeans(EmgStr,1);
[~,CUln,sumUln] = kmeans(EmgUln,1);
[~,CRes,sumRes] = kmeans(EmgRes,1);
[~,CFis,sumFis] = kmeans(EmgFis,1);
Centers = 1000*[CExt',CFle',CRad',CStr',CUln',CRes',CFis'];
distToCenters = [sumExt,sumFle,sumRad,sumStr,sumUln,sumRes,sumFis];
rmpath(thePath1);

addpath(thePath3);
[EmgExt,EmgFis,EmgFle,EmgRad,EmgStr,EmgUln,EmgRes] = getEmg();
[~,CExt,sumExt] = kmeans(EmgExt,1);
[~,CFle,sumFle] = kmeans(EmgFle,1);
[~,CRad,sumRad] = kmeans(EmgRad,1);
[~,CStr,sumStr] = kmeans(EmgStr,1);
[~,CUln,sumUln] = kmeans(EmgUln,1);
[~,CRes,sumRes] = kmeans(EmgRes,1);
[~,CFis,sumFis] = kmeans(EmgFis,1);
Centers = [Centers;1000*[CExt',CFle',CRad',CStr',CUln',CRes',CFis']];
distToCenters = [distToCenters;[sumExt,sumFle,sumRad,sumStr,sumUln,sumRes,sumFis]];
rmpath(thePath3);

addpath(thePath4);
[EmgExt,EmgFis,EmgFle,EmgRad,EmgStr,EmgUln,EmgRes] = getEmg();
[~,CExt,sumExt] = kmeans(EmgExt,1);
[~,CFle,sumFle] = kmeans(EmgFle,1);
[~,CRad,sumRad] = kmeans(EmgRad,1);
[~,CStr,sumStr] = kmeans(EmgStr,1);
[~,CUln,sumUln] = kmeans(EmgUln,1);
[~,CRes,sumRes] = kmeans(EmgRes,1);
[~,CFis,sumFis] = kmeans(EmgFis,1);
Centers = [Centers;1000*[CExt',CFle',CRad',CStr',CUln',CRes',CFis']];
distToCenters = [distToCenters;[sumExt,sumFle,sumRad,sumStr,sumUln,sumRes,sumFis]];
rmpath(thePath4);