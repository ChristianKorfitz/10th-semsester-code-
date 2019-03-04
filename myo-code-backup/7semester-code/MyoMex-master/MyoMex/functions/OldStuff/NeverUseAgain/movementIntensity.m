function [output] = movementIntensity(emgData,MVC);

%Finds maximum of MVC
maxVal = mean(MVC);

%Finds mean of the data
temp = abs(emgData);
meanData = mean(temp,2);

%Rescales the data
LD = length(meanData);
movementIntensity = rescale(meanData,'InputMin',0,'InputMax',maxVal);
movementIntensity(LD+1:4*LD,1) = 0*ones(3*LD,1);



output = movementIntensity;