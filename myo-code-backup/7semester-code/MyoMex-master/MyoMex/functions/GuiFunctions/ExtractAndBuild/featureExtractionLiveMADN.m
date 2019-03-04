function [CCoutput] = featureExtractionLiveMADN(emgData);

normRaw = [];

for j = 1:length(emgData(1,:));
    for k = 1:length(emgData(:,1));
    temp = emgData(k,j)-mean(emgData(:,j))/std(emgData(:,j));
    meabs1(k) = temp;
    end
normRaw = [normRaw,meabs1'];    
end


for b = 1:length(normRaw(:,1))
    temp = abs(normRaw(b,1)-normRaw(b,2));
    twoChan1(b) = temp;
end
MADN1 = sum(twoChan1)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = abs(normRaw(b,2)-normRaw(b,3));
    twoChan2(b) = temp;
end
MADN2 = sum(twoChan2)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = abs(normRaw(b,3)-normRaw(b,4));
    twoChan3(b) = temp;
end
MADN3 = sum(twoChan3)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = abs(normRaw(b,4)-normRaw(b,5));
    twoChan4(b) = temp;
end
MADN4 = sum(twoChan4)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = abs(normRaw(b,5)-normRaw(b,6));
    twoChan5(b) = temp;
end
MADN5 = sum(twoChan5)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = abs(normRaw(b,6)-normRaw(b,7));
    twoChan6(b) = temp;
end
MADN6 = sum(twoChan6)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = abs(normRaw(b,7)-normRaw(b,8));
    twoChan7(b) = temp;
end
MADN7 = sum(twoChan7)/length(normRaw(:,1));

for b = 1:length(normRaw(:,1))
    temp = abs(normRaw(b,8)-normRaw(b,1));
    twoChan8(b) = temp;
end
MADN8 = sum(twoChan8)/length(normRaw(:,1));

allChan = [MADN1 MADN2 MADN3 MADN4 MADN5 MADN6 MADN7 MADN8];


CCoutput = allChan;