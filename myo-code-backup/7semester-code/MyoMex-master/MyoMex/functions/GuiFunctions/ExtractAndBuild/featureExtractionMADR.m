function [MADRoutput] = featureExtractionMADR(emgData);


for i=1:8
    Column{i} = transpose(emgData(:,[i]));
end

% % Calculate CC --> subtracting data points from channel x with the
% % corresponding data points from the neighboring channel and the absolute is
% % taking from this value. These values are
% % summed and divided by the window length (40 samples). 
MADR1 = [];
MADR2 = [];
MADR3 = [];
MADR4 = [];
MADR5 = [];
MADR6 = [];
MADR7 = [];
MADR8 = [];

c1 = buffer(Column{1},40,20);
c2 = buffer(Column{2},40,20);
c3 = buffer(Column{3},40,20);
c4 = buffer(Column{4},40,20);
c5 = buffer(Column{5},40,20);
c6 = buffer(Column{6},40,20);
c7 = buffer(Column{7},40,20);
c8 = buffer(Column{8},40,20);

for a = 1:length(c1(1,:))
    for b = 1:length(c1(:,1))
    temp = abs(c1(b,a)-c2(b,a));
    twoChan1(b) = temp;
    end
temp1 = sum(twoChan1)/length(c1(:,1));
MADR1 = [MADR1,temp1];
end 

for a = 1:length(c2(1,:))
    for b = 1:length(c2(:,1))
    temp = abs(c2(b,a)-c3(b,a));
    twoChan2(b) = temp;
    end
temp2 = sum(twoChan2)/length(c2(:,1));
MADR2 = [MADR2,temp2];
end


for a = 1:length(c3(1,:))
    for b = 1:length(c3(:,1))
    temp = abs(c3(b,a)-c4(b,a));
    twoChan3(b) = temp;
    end
temp3 = sum(twoChan3)/length(c3(:,1));
MADR3 = [MADR3,temp3];
end 


for a = 1:length(c4(1,:))
    for b = 1:length(c4(:,1))
    temp = abs(c4(b,a)-c5(b,a));
    twoChan4(b) = temp;
    end
temp4 = sum(twoChan4)/length(c4(:,1));
MADR4 = [MADR4,temp4];
end


for a = 1:length(c5(1,:))
    for b = 1:length(c5(:,1))
    temp = abs(c5(b,a)-c6(b,a));
    twoChan5(b) = temp;
    end
temp5 = sum(twoChan5)/length(c5(:,1));
MADR5 = [MADR5,temp5];
end 

for a = 1:length(c6(1,:))
    for b = 1:length(c6(:,1))
    temp = abs(c6(b,a)-c7(b,a));
    twoChan6(b) = temp;
    end
temp6 = sum(twoChan6)/length(c6(:,1));
MADR6 = [MADR6,temp6];
end


for a = 1:length(c7(1,:))
    for b = 1:length(c7(:,1))
    temp = abs(c7(b,a)-c8(b,a));
    twoChan7(b) = temp;
    end
temp7 = sum(twoChan7)/length(c7(:,1));
MADR7 = [MADR7,temp7];
end 


for a = 1:length(c8(1,:))
    for b = 1:length(c8(:,1))
    temp = abs(c8(b,a)-c1(b,a));
    twoChan8(b) = temp;
    end
temp8 = sum(twoChan8)/length(c8(:,1));
MADR8 = [MADR8,temp8];
end 

allChan = [MADR1' MADR2' MADR3' MADR4' MADR5' MADR6' MADR7' MADR8'];

MADRoutput = allChan;