function [Moveoutput] = featureExtractionMove(emgData, MVC)

LD = length(emgData);
MVC = mean(MVC,2);
meanRows = mean(emgData,2);
allChan = rescale(meanRows(:,1),'InputMin',0,'InputMax',MVC);
allChan(LD+1:2*LD,1) = 0*ones(LD,1);

Moveoutput = allChan;