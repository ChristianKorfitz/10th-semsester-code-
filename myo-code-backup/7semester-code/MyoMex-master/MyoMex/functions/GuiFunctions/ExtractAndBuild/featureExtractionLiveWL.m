function [WLoutput] = featureExtractionLiveWL(emgData);

for j = 1:length(emgData(1,:))
    temp = sum(abs(diff(abs(emgData(:,j)))));
    WL(j) = temp;
end

allWL = WL;

WLoutput = allWL;