function [SMADRoutput] = featureExtractionSMADR(MADRoutput, MMAVoutput);

for i = 1:length(MADRoutput(1,:))
temp = MADRoutput(:,i)./MMAVoutput;
allChan(i,:) = temp;
end

SMADRoutput = allChan';