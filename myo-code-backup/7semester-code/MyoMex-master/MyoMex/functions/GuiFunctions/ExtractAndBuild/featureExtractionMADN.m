function [MADNoutput] = featureExtractionMADN(emgData);

normRaw1 = [];
normRaw2 = [];
normRaw3 = [];
normRaw4 = [];
normRaw5 = [];
normRaw6 = []; 
normRaw7 = [];
normRaw8 = [];

for i=1:8
    Column{i} = transpose(emgData(:,[i]));
end
%Normalize each window for each channel by subtracting the mean from each raw data point and dividing it by its std  

c1 = buffer(Column{1},40,20);
for j = 1:length(c1(1,:));
    for k = 1:length(c1(:,1));
    temp = c1(k,j)-mean(c1(:,j))/std(c1(:,j));
    meabs1(k) = temp;
    end
normRaw1 = [normRaw1,meabs1'];    
end

c2 = buffer(Column{2},40,20);
for j = 1:length(c2(1,:));
    for k = 1:length(c2(:,1));
    temp = c2(k,j)-mean(c2(:,j))/std(c2(:,j));
    meabs2(k) = temp;
    end
normRaw2 = [normRaw2,meabs2'];    
end

c3 = buffer(Column{3},40,20);
for j = 1:length(c3(1,:));
    for k = 1:length(c3(:,1));
    temp = c3(k,j)-mean(c3(:,j))/std(c3(:,j));
    meabs3(k) = temp;
    end
normRaw3 = [normRaw3,meabs3'];    
end

c4 = buffer(Column{4},40,20);
for j = 1:length(c4(1,:));
    for k = 1:length(c4(:,1));
    temp = c4(k,j)-mean(c4(:,j))/std(c4(:,j));
    meabs4(k) = temp;
    end
normRaw4 = [normRaw4,meabs4'];    
end

c5 = buffer(Column{5},40,20);
for j = 1:length(c5(1,:));
    for k = 1:length(c5(:,1));
    temp = c5(k,j)-mean(c5(:,j))/std(c5(:,j));
    meabs5(k) = temp;
    end
normRaw5 = [normRaw5,meabs5'];    
end

c6 = buffer(Column{6},40,20);
for j = 1:length(c6(1,:));
    for k = 1:length(c6(:,1));
    temp = c6(k,j)-mean(c6(:,j))/std(c6(:,j));
    meabs6(k) = temp;
    end
normRaw6 = [normRaw6,meabs6'];    
end

c7 = buffer(Column{7},40,20);
for j = 1:length(c7(1,:));
    for k = 1:length(c7(:,1));
    temp = c7(k,j)-mean(c7(:,j))/std(c7(:,j));
    meabs7(k) = temp;
    end
normRaw7 = [normRaw7,meabs7'];    
end

c8 = buffer(Column{8},40,20);
for j = 1:length(c8(1,:));
    for k = 1:length(c8(:,1));
    temp = c8(k,j)-mean(c8(:,j))/std(c8(:,j));
    meabs8(k) = temp;
    end
normRaw8 = [normRaw8,meabs8'];    
end

% % Calculate CC --> subtracting data points from channel x with the
% % corresponding data points from the neighboring channel and the absolute is
% % taking from this value. These values are
% % summed and divided by the window length (40 samples). 
MADN1 = [];
MADN2 = [];
MADN3 = [];
MADN4 = [];
MADN5 = [];
MADN6 = [];
MADN7 = [];
MADN8 = [];

for a = 1:length(normRaw1(1,:))
    for b = 1:length(normRaw1(:,1))
    temp = abs(normRaw1(b,a)-normRaw2(b,a));
    twoChan1(b) = temp;
    end
temp1 = sum(twoChan1)/length(normRaw1(:,1));
MADN1 = [MADN1,temp1];
end 

for a = 1:length(normRaw2(1,:))
    for b = 1:length(normRaw2(:,1))
    temp = abs(normRaw2(b,a)-normRaw3(b,a));
    twoChan2(b) = temp;
    end
temp2 = sum(twoChan2)/length(normRaw2(:,1));
MADN2 = [MADN2,temp2];
end


for a = 1:length(normRaw3(1,:))
    for b = 1:length(normRaw3(:,1))
    temp = abs(normRaw3(b,a)-normRaw4(b,a));
    twoChan3(b) = temp;
    end
temp3 = sum(twoChan3)/length(normRaw3(:,1));
MADN3 = [MADN3,temp3];
end 


for a = 1:length(normRaw4(1,:))
    for b = 1:length(normRaw4(:,1))
    temp = abs(normRaw4(b,a)-normRaw5(b,a));
    twoChan4(b) = temp;
    end
temp4 = sum(twoChan4)/length(normRaw4(:,1));
MADN4 = [MADN4,temp4];
end


for a = 1:length(normRaw5(1,:))
    for b = 1:length(normRaw5(:,1))
    temp = abs(normRaw5(b,a)-normRaw6(b,a));
    twoChan5(b) = temp;
    end
temp5 = sum(twoChan5)/length(normRaw5(:,1));
MADN5 = [MADN5,temp5];
end 

for a = 1:length(normRaw6(1,:))
    for b = 1:length(normRaw6(:,1))
    temp = abs(normRaw6(b,a)-normRaw7(b,a));
    twoChan6(b) = temp;
    end
temp6 = sum(twoChan6)/length(normRaw6(:,1));
MADN6 = [MADN6,temp6];
end


for a = 1:length(normRaw7(1,:))
    for b = 1:length(normRaw7(:,1))
    temp = abs(normRaw7(b,a)-normRaw8(b,a));
    twoChan7(b) = temp;
    end
temp7 = sum(twoChan7)/length(normRaw7(:,1));
MADN7 = [MADN7,temp7];
end 


for a = 1:length(normRaw8(1,:))
    for b = 1:length(normRaw8(:,1))
    temp = abs(normRaw8(b,a)-normRaw1(b,a));
    twoChan8(b) = temp;
    end
temp8 = sum(twoChan8)/length(normRaw8(:,1));
MADN8 = [MADN8,temp8];
end 

allChan = [MADN1' MADN2' MADN3' MADN4' MADN5' MADN6' MADN7' MADN8'];

MADNoutput = allChan;
