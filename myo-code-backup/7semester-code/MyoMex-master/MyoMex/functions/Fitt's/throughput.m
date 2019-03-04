function [output] = throughput(timeDif,targetSet)

targets = createTargetset(targetSet);
ID = indexOfDifficulty(targetSet)';
MT = timeDif;

temp = ID./MT;

TP = 1/length(targets)*sum(temp);

output = TP;