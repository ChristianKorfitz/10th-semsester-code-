
function [ZCoutput] = featureExtractionZC(emgData);

for i=1:8
    Column{i} = transpose(emgData(:,[i])); 
end

c1 = buffer(Column{1},40,20);
for j = 1:length(c1(1,:))
    temp = sum(abs(diff(c1(:,j)>0)));
    ZC1(j) = temp;
end 

c2 = buffer(Column{2},40,20);
for j = 1:length(c2(1,:))
    temp = sum(abs(diff(c2(:,j)>0)));
    ZC2(j) = temp;
end 

c3 = buffer(Column{3},40,20);
for j = 1:length(c3(1,:))
    temp = sum(abs(diff(c3(:,j)>0)));
    ZC3(j) = temp;
end 

c4 = buffer(Column{4},40,20);
for j = 1:length(c4(1,:))
    temp = sum(abs(diff(c4(:,j)>0)));
    ZC4(j) = temp;
end 

c5 = buffer(Column{5},40,20);
for j = 1:length(c5(1,:))
    temp = sum(abs(diff(c5(:,j)>0)));
    ZC5(j) = temp;
end 

c6 = buffer(Column{6},40,20);
for j = 1:length(c6(1,:))
    temp = sum(abs(diff(c6(:,j)>0)));
    ZC6(j) = temp;
end 

c7 = buffer(Column{7},40,20);
for j = 1:length(c7(1,:))
    temp = sum(abs(diff(c7(:,j)>0)));
    ZC7(j) = temp;
end 

c8 = buffer(Column{2},40,20);
for j = 1:length(c8(1,:))
    temp = sum(abs(diff(c8(:,j)>0)));
    ZC8(j) = temp;
end 


allZC = [ZC1' ZC2' ZC3' ZC4' ZC5' ZC6' ZC7' ZC8'];


ZCoutput = allZC;




