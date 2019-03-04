function [output] = stoppingDistance(startValue,stopValue,outputValue2)

zStop = zeros(1,17-length(stopValue));
zStart = zeros(1,16-length(startValue));

stopValue = [stopValue,zStop];
startValue = [startValue,zStart];

for i=1:length(startValue)
    if stopValue(i+1) == 0
        distTravel(i) = 0;
    else
        distVec = [outputValue2(startValue(i):stopValue(i+1),:)];
        distTravel(i) = findLength(distVec);
    end
end

output = sum(distTravel);