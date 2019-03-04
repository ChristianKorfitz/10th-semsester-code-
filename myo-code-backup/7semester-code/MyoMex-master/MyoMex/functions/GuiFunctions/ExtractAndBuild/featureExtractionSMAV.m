function [SMAVoutput] = featureExtractionSMAV(MAVoutput,MMAVoutput)

for i = 1:length(MAVoutput(1,:))
temp = MAVoutput(:,i)./MMAVoutput;
allChan(i,:) = temp;
end

SMAVoutput = allChan';
