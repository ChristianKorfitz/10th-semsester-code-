function [output] = featureExtractionOffline(emgData)

movVar = dsp.MovingVariance('Method','Sliding window', 'ForgettingFactor', 0.9); %Moving variance stuff

logVarData = log(step(movVar, emgData));

output = logVarData;