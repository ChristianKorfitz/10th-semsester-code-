function [MADRoutput] = featureExtractionLiveMADR(emgData);

for b = 1:length(emgData(:,1))
    temp = abs(emgData(b,1)-emgData(b,2));
    twoChan1(b) = temp;
end
MADR1 = sum(twoChan1)/length(emgData(:,1));

for b = 1:length(emgData(:,1))
    temp = abs(emgData(b,2)-emgData(b,3));
    twoChan2(b) = temp;
end
MADR2 = sum(twoChan2)/length(emgData(:,1));

for b = 1:length(emgData(:,1))
    temp = abs(emgData(b,3)-emgData(b,4));
    twoChan3(b) = temp;
end
MADR3 = sum(twoChan3)/length(emgData(:,1));

for b = 1:length(emgData(:,1))
    temp = abs(emgData(b,4)-emgData(b,5));
    twoChan4(b) = temp;
end
MADR4 = sum(twoChan4)/length(emgData(:,1));

for b = 1:length(emgData(:,1))
    temp = abs(emgData(b,5)-emgData(b,6));
    twoChan5(b) = temp;
end
MADR5 = sum(twoChan5)/length(emgData(:,1));

for b = 1:length(emgData(:,1))
    temp = abs(emgData(b,6)-emgData(b,7));
    twoChan6(b) = temp;
end
MADR6 = sum(twoChan6)/length(emgData(:,1));

for b = 1:length(emgData(:,1))
    temp = abs(emgData(b,7)-emgData(b,8));
    twoChan7(b) = temp;
end
MADR7 = sum(twoChan7)/length(emgData(:,1));

for b = 1:length(emgData(:,1))
    temp = abs(emgData(b,8)-emgData(b,1));
    twoChan8(b) = temp;
end
MADR8 = sum(twoChan8)/length(emgData(:,1));

allChan = [MADR1 MADR2 MADR3 MADR4 MADR5 MADR6 MADR7 MADR8];

MADRoutput = allChan;