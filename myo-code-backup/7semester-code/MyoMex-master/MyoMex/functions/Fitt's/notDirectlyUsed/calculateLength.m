function calculateLength(outputData)

points = [];
i = 1;
L = length(outputData)

while i <= L
    if outputData(i,1:2) == [0 0]
        points = [points, i];
        i = i+20;
    else
        i = i+1;
    end
end

for i=1:15
    lengthTravel(i) = findLength(outputData(points(i):points(i+1),:));
end

lengthTravel(16) = findLength(outputData(points(16):L,:));

lengthTravel = [0,lengthTravel]

save('lengthTravel.mat','lengthTravel');