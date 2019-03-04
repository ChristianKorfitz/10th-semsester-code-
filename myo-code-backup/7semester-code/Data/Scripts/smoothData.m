function [output] = smoothData(normData)

%smooth first - then normalize!

%this smooth out the normalized EMG data to plot with plotMovingDot
% so the dot does not chaotically fly around 

output = transpose(smooth(normData(1,:), 0.1, 'rloess'));


