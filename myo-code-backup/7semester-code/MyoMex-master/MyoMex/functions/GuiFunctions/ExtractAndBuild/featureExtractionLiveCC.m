function [CCoutput] = featureExtractionLiveCC(emgData);

normRaw = [];

for j = 1:length(emgData(1,:));
    for k = 1:length(emgData(:,1));
    temp = emgData(k,j)-mean(emgData(:,j))/std(emgData(:,j));
    meabs1(k) = temp;
    end
normRaw = [normRaw,meabs1'];    
end


for b = 1:length(normRaw(:,1))
    temp = normRaw(b,1)*normRaw(b,2);
    twoChan1(b) = temp;
end
CC1 = sum(twoChan1)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = normRaw(b,2)*normRaw(b,3);
    twoChan2(b) = temp;
end
CC2 = sum(twoChan2)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = normRaw(b,3)*normRaw(b,4);
    twoChan3(b) = temp;
end
CC3 = sum(twoChan3)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = normRaw(b,4)*normRaw(b,5);
    twoChan4(b) = temp;
end
CC4 = sum(twoChan4)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = normRaw(b,5)*normRaw(b,6);
    twoChan5(b) = temp;
end
CC5 = sum(twoChan5)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = normRaw(b,6)*normRaw(b,7);
    twoChan6(b) = temp;
end
CC6 = sum(twoChan6)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = normRaw(b,7)*normRaw(b,8);
    twoChan7(b) = temp;
end
CC7 = sum(twoChan7)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = normRaw(b,8)*normRaw(b,1);
    twoChan8(b) = temp;
end
CC8 = sum(twoChan8)/length(normRaw(:,1));

allChan = [CC1 CC2 CC3 CC4 CC5 CC6 CC7 CC8];


CCoutput = allChan;