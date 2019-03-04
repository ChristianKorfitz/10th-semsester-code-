function [CR,ID,OS,PE,SD,TP] = fittsLawResults(targetSet)

load('gotIt.mat');
load('overshots.mat');
load('lengthTravel.mat');
load('startValue.mat');
load('stopValue.mat');
load('timeDif.mat');
load('outputValue2.mat');

CR = completionRate(gotIt,targetSet);
ID = indexOfDifficulty(targetSet);
OS = overshot(overshots,gotIt);%targetSet);
PE = pathEfficiency(lengthTravel,targetSet);
SD = stoppingDistance(startValue,stopValue,outputValue2);
TP = throughput(timeDif,targetSet);

clear gotIt;
clear overshots;
clear lengthTravel;
clear startValue;
clear stopValue;
clear timeDif;
clear outputValue2;