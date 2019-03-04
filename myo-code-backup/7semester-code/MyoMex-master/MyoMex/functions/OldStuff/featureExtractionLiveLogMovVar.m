function [output] = featureExtractionLiveLogMovVar(emgData)

%Creates a sliding-window MAV with a windowlength of 40.
%This slides through the data with a 40 sample window but it doesn't
%Take steps the same way we do with the windowing. How to fix that?
movVar = dsp.MovingVariance('Method','Sliding window');
movVar = dsp.MovingVariance(40);

logVarData = log(step(movVar, emgData));

output = logVarData;