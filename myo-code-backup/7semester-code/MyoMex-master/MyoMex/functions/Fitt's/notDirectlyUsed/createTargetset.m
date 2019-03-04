function [output, randomOrder] = createTargetset(targetSet)

%What targetset did the 
if targetSet == 1
    randomOrder = (1:16);
elseif targetSet == 2
    randomOrder = [16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1];
elseif targetSet == 3
    randomOrder = [8,7,6,5,4,3,2,1,9,10,11,12,13,14,15,16];
elseif targetSet == 4
    randomOrder = [9,10,11,12,13,14,15,16,1,2,3,4,5,6,7,8];
end

SizeOfDot = [0.8 1.2 1 1.3 1.2 1 0.8 1.2 1 1.2 0.8 1.3 1.2 1 0.8 1.2];
plotData = 3.5*[1 0.5 0 -0.5 -1 -0.5 0 0.5 2 1 0 -1 -2 -1 0 1; ...
            0 0.5 1 0.5 0 -0.5 -1 -0.5 0 1 2 1 0 -1 -2 -1];

targets = [];

for i=1:length(randomOrder)
    targets = [targets; plotData(:,randomOrder(i))', SizeOfDot(randomOrder(i))];
end

output = targets;