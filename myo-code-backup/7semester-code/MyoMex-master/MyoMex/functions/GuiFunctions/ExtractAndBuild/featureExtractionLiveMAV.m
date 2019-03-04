function [output] = featureExtractionLiveMAV(emgData)

output = mean(abs(emgData));