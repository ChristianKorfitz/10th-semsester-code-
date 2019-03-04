function [output] = featureExtractionLiveLogVar(emgData)

output = log(var(emgData));