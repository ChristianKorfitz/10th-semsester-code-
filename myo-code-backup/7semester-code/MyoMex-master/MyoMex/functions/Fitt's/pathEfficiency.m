function [output] = pathEfficiency(lengthTravel,targetSet)

targets = createTargetset(targetSet);
optimalPath = [];
startSize = [90 90 90 90 30 30 30 30 90 90 90 90 30 30 30 30];
targets(:,3) = targets(:,3)*60;

for i=1:length(targets)
    temp = sum(abs([0 0 startSize(i)]-targets(i,:)));
    optimalPath = [optimalPath; temp];
end

output = sum(optimalPath)/sum(lengthTravel(2:17));