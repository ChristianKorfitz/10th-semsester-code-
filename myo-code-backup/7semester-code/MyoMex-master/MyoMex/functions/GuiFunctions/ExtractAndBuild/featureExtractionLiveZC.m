
function [ZCoutput] = featureExtractionLiveZC(emgData);

for j = 1:length(emgData(1,:))
    temp = sum(abs(diff(emgData(:,j)>0)));
    ZC(j) = temp;
end 

allZC = ZC;

ZCoutput = allZC;




