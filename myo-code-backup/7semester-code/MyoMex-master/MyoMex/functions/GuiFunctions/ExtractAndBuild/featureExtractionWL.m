function [WLoutput] = featureExtractionWL(emgData);

for i=1:8
    Column{i} = transpose(emgData(:,[i])); 
end

c1 = buffer(Column{1},40,20);
for j = 1:length(c1(1,:))
    temp = sum(abs(diff(abs(c1(:,j)))));
    WL1(j) = temp;
end

c2 = buffer(Column{2},40,20);
for j = 1:length(c2(1,:))
    temp = sum(abs(diff(abs(c2(:,j)))));
    WL2(j) = temp;
end

c3 = buffer(Column{3},40,20);
for j = 1:length(c3(1,:))
    temp = sum(abs(diff(abs(c3(:,j)))));
    WL3(j) = temp;
end

c4 = buffer(Column{4},40,20);
for j = 1:length(c4(1,:))
    temp = sum(abs(diff(abs(c4(:,j)))));
    WL4(j) = temp;
end

c5 = buffer(Column{5},40,20);
for j = 1:length(c5(1,:))
    temp = sum(abs(diff(abs(c5(:,j)))));
    WL5(j) = temp;
end

c6 = buffer(Column{6},40,20);
for j = 1:length(c6(1,:))
    temp = sum(abs(diff(abs(c6(:,j)))));
    WL6(j) = temp;
end

c7 = buffer(Column{7},40,20);
for j = 1:length(c7(1,:))
    temp = sum(abs(diff(abs(c7(:,j)))));
    WL7(j) = temp;
end

c8 = buffer(Column{8},40,20);
for j = 1:length(c8(1,:))
    temp = sum(abs(diff(abs(c8(:,j)))));
    WL8(j) = temp;
end


allWL = [WL1' WL2' WL3' WL4' WL5' WL6' WL7' WL8'];


WLoutput = allWL;